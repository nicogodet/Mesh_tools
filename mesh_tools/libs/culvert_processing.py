# -*- coding: utf-8 -*-

"""Processing provider of Mesh Tools: import, check and export culverts (also used by the Culvert Manager)."""

import os

from qgis.core import (
    QgsFeatureSink,
    QgsField,
    QgsFields,
    QgsProcessing,
    QgsProcessingAlgorithm,
    QgsProcessingException,
    QgsProcessingLayerPostProcessorInterface,
    QgsProcessingOutputNumber,
    QgsProcessingParameterCrs,
    QgsProcessingParameterEnum,
    QgsProcessingParameterFeatureSink,
    QgsProcessingParameterFile,
    QgsProcessingParameterFileDestination,
    QgsProcessingParameterMeshLayer,
    QgsProcessingParameterNumber,
    QgsProcessingParameterString,
    QgsProcessingParameterVectorLayer,
    QgsProcessingProvider,
    QgsWkbTypes,
)
from qgis.PyQt.QtCore import QCoreApplication, QMetaType
from qgis.PyQt.QtGui import QIcon

from . import culvert_core
from .culvert_io import CulvertFileError, write_culvert_file

ICON = os.path.join(os.path.dirname(__file__), "..", "icons", "culvert.png")
SOFTWARES = ["TELEMAC", "Uhaina"]
OPTIONS = ["From the culvert layer", "1", "2"]


def tr(message):
    return QCoreApplication.translate("CulvertProcessing", message)


class CulvertAlgorithm(QgsProcessingAlgorithm):
    def group(self):
        return tr("Culverts")

    def groupId(self):
        return "culverts"

    def icon(self):
        return QIcon(ICON)

    def tr(self, message):
        return tr(message)

    def createInstance(self):
        return type(self)()

    def add_mesh_parameters(self):
        self.addParameter(QgsProcessingParameterMeshLayer("MESH", self.tr("Mesh layer")))
        self.addParameter(
            QgsProcessingParameterString(
                "DATASET",
                self.tr("Dataset of the bottom elevation (empty: from the culvert layer, or guessed)"),
                optional=True,
            )
        )

    def add_culvert_parameters(self):
        self.addParameter(
            QgsProcessingParameterVectorLayer(
                "INPUT", self.tr("Culvert layer"), [QgsProcessing.SourceType.TypeVectorLine]
            )
        )
        self.add_mesh_parameters()
        self.addParameter(QgsProcessingParameterEnum("SOFTWARE", self.tr("Software"), SOFTWARES, defaultValue=0))
        self.addParameter(
            QgsProcessingParameterEnum("OPTION", self.tr("TELEMAC culvert option"), OPTIONS, defaultValue=0)
        )

    def culvert_inputs(self, parameters, context):
        layer = self.parameterAsVectorLayer(parameters, "INPUT", context)
        if not culvert_core.is_culvert_layer(layer):
            raise QgsProcessingException(self.tr("The input layer is not a culvert layer (missing fields)."))
        mesh, group = self.mesh_inputs(parameters, context, layer)
        software = self.parameterAsEnum(parameters, "SOFTWARE", context)
        option = self.parameterAsEnum(parameters, "OPTION", context)
        option = culvert_core.culvert_option(layer) if option == 0 else option
        return layer, mesh, group, software, option

    def mesh_inputs(self, parameters, context, culvert_layer=None):
        mesh_layer = self.parameterAsMeshLayer(parameters, "MESH", context)
        if mesh_layer is None:
            raise QgsProcessingException(self.tr("The mesh layer is not valid."))
        mesh = culvert_core.mesh_context(mesh_layer)
        dataset = self.parameterAsString(parameters, "DATASET", context)
        if not dataset:
            dataset = culvert_core.layer_setting(culvert_layer, culvert_core.BOTTOM_VARIABLE) or mesh.default_dataset()
        return mesh, mesh.dataset_group(dataset) if dataset else None

    def report(self, problems, feedback):
        for name, message, _ in problems:
            feedback.reportError(f"{name} : {message}")


class CheckCulverts(CulvertAlgorithm):
    def name(self):
        return "checkculverts"

    def displayName(self):
        return self.tr("Check culverts")

    def shortHelpString(self):
        return self.tr(
            "Checks the culverts as for the creation of the culvert file: extremities within the mesh, values "
            "needed by the software and the TELEMAC culvert option. The culverts with problems can be written to "
            "a layer."
        )

    def initAlgorithm(self, config=None):
        self.add_culvert_parameters()
        self.addParameter(
            QgsProcessingParameterFeatureSink(
                "OUTPUT", self.tr("Culverts with problems"), QgsProcessing.SourceType.TypeVectorLine, optional=True
            )
        )
        self.addOutput(QgsProcessingOutputNumber("PROBLEMS", self.tr("Number of problems")))

    def processAlgorithm(self, parameters, context, feedback):
        layer, mesh, group, software, option = self.culvert_inputs(parameters, context)
        _, problems = culvert_core.export_records(layer, mesh, group, software, option, context.project())
        self.report(problems, feedback)

        results = {"PROBLEMS": len(problems)}
        fields = QgsFields()
        fields.append(QgsField("culvert", QMetaType.Type.QString))
        fields.append(QgsField("problem", QMetaType.Type.QString))
        sink, dest = self.parameterAsSink(
            parameters, "OUTPUT", context, fields, QgsWkbTypes.Type.MultiLineString, layer.crs()
        )
        if sink is not None:
            for name, message, fid in problems:
                if fid is None:
                    continue
                feature = layer.getFeature(fid)
                feature.setFields(fields, True)
                feature.setAttributes([name, message])
                sink.addFeature(feature, QgsFeatureSink.Flag.FastInsert)
            results["OUTPUT"] = dest
        if not problems:
            feedback.pushInfo(self.tr("All culverts are valid"))
        return results


class ExportCulvertFile(CulvertAlgorithm):
    def name(self):
        return "exportculvertfile"

    def displayName(self):
        return self.tr("Export culvert file")

    def shortHelpString(self):
        return self.tr(
            "Writes the TELEMAC (CULVERTS DATA FILE) or Uhaina culvert file. Nodes, automatic elevations, lengths "
            "and angles are computed again from the mesh and the geometries; the culvert layer is not modified. "
            "Fails if a culvert is not valid."
        )

    def initAlgorithm(self, config=None):
        self.add_culvert_parameters()
        self.addParameter(
            QgsProcessingParameterNumber(
                "RELAXATION",
                self.tr("Relaxation (empty: from the culvert layer)"),
                QgsProcessingParameterNumber.Type.Double,
                optional=True,
                minValue=0.0,
                maxValue=1.0,
            )
        )
        self.addParameter(
            QgsProcessingParameterFileDestination("OUTPUT", self.tr("Culvert file"), self.tr("Text file (*.txt)"))
        )

    def processAlgorithm(self, parameters, context, feedback):
        layer, mesh, group, software, option = self.culvert_inputs(parameters, context)
        records, problems = culvert_core.export_records(layer, mesh, group, software, option, context.project())
        if problems:
            self.report(problems, feedback)
            raise QgsProcessingException(self.tr("File creation is not possible, some culverts are not valid"))

        if parameters.get("RELAXATION") is None:
            relax = culvert_core.culvert_relaxation(layer)
        else:
            relax = self.parameterAsDouble(parameters, "RELAXATION", context)
        path = self.parameterAsFileOutput(parameters, "OUTPUT", context)
        try:
            write_culvert_file(path, records, software, relax, option)
        except (CulvertFileError, OSError) as err:
            raise QgsProcessingException(str(err))
        feedback.pushInfo(self.tr("{} culverts written.").format(len(records)))
        return {"OUTPUT": path}


class CulvertLayerPostProcessor(QgsProcessingLayerPostProcessorInterface):
    """Culvert style and settings on the layer created by the import."""

    instance = None

    def __init__(self, settings):
        super().__init__()
        self.settings = settings

    def postProcessLayer(self, layer, context, feedback):
        culvert_core.apply_style(layer)
        culvert_core.set_layer_settings(layer, **self.settings)

    @classmethod
    def create(cls, settings):
        # Keep a reference: Processing does not take ownership of Python post processors
        cls.instance = cls(settings)
        return cls.instance


class ImportCulvertFile(CulvertAlgorithm):
    def name(self):
        return "importculvertfile"

    def displayName(self):
        return self.tr("Import culvert file")

    def shortHelpString(self):
        return self.tr(
            "Creates a culvert layer from a TELEMAC culvert file (nodes I1 I2, tab or space separated, TELEMAC "
            "column names accepted) or an Uhaina culvert file (coordinates X1 Y1 X2 Y2 in the mesh CRS). The TELEMAC "
            "culvert option is guessed and stored in the new layer with the relaxation."
        )

    def initAlgorithm(self, config=None):
        self.addParameter(
            QgsProcessingParameterFile(
                "INPUT", self.tr("Culvert file"), QgsProcessingParameterFile.Behavior.File, fileFilter="Text (*.txt)"
            )
        )
        self.add_mesh_parameters()
        self.addParameter(
            QgsProcessingParameterCrs("CRS", self.tr("CRS of the culvert layer (empty: mesh CRS)"), optional=True)
        )
        self.addParameter(
            QgsProcessingParameterFeatureSink("OUTPUT", self.tr("Culverts"), QgsProcessing.SourceType.TypeVectorLine)
        )
        self.addOutput(QgsProcessingOutputNumber("IMPORTED", self.tr("Imported culverts")))
        self.addOutput(QgsProcessingOutputNumber("REJECTED", self.tr("Rejected culverts")))

    def processAlgorithm(self, parameters, context, feedback):
        path = self.parameterAsFile(parameters, "INPUT", context)
        mesh, group = self.mesh_inputs(parameters, context)
        crs = self.parameterAsCrs(parameters, "CRS", context)
        if not crs.isValid():
            crs = mesh.crs

        result = culvert_core.import_culvert_file(path, None, mesh, crs, context.project())
        if result.error:
            raise QgsProcessingException(result.error)
        for row, message in result.rejected:
            feedback.reportError(self.tr("Culvert {} rejected : {}").format(row, message))
        for message in result.warnings:
            feedback.pushWarning(message)

        sink, dest = self.parameterAsSink(
            parameters, "OUTPUT", context, culvert_core.culvert_fields(), QgsWkbTypes.Type.MultiLineString, crs
        )
        if sink is None:
            raise QgsProcessingException(self.invalidSinkError(parameters, "OUTPUT"))
        for feature in result.features:
            sink.addFeature(feature, QgsFeatureSink.Flag.FastInsert)

        settings = {"option": result.option, "mesh": mesh.layer.id()}
        if result.relax is not None:
            settings["relaxation"] = result.relax
        if group is not None:
            settings["bottom"] = mesh.layer.dataProvider().datasetGroupMetadata(group).name()
        if context.willLoadLayerOnCompletion(dest):
            context.layerToLoadOnCompletionDetails(dest).setPostProcessor(CulvertLayerPostProcessor.create(settings))

        feedback.pushInfo(
            self.tr("{imported} culverts imported, {rejected} rejected.").format(
                imported=len(result.features), rejected=len(result.rejected)
            )
        )
        return {
            "OUTPUT": dest,
            "IMPORTED": len(result.features),
            "REJECTED": len(result.rejected),
            "UHAINA": result.uhaina,
            "OPTION": result.option,
            "RELAXATION": result.relax,
        }


class MeshToolsProvider(QgsProcessingProvider):
    def id(self):  # noqa: A003 (QgsProcessingProvider API)
        return "meshtools"

    def name(self):
        return "Mesh Tools"

    def icon(self):
        return QIcon(ICON)

    def loadAlgorithms(self):
        for algorithm in (ImportCulvertFile(), CheckCulverts(), ExportCulvertFile()):
            self.addAlgorithm(algorithm)
