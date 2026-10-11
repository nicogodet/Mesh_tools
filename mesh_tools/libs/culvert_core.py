# -*- coding: utf-8 -*-

"""Culvert computations shared by the dock, the Processing algorithms and the expression functions.

QGIS core only: no widget, no iface.
"""

import math
import os

from dataclasses import dataclass, field
from typing import Dict, List, Optional, Tuple

from qgis.core import (
    NULL,
    Qgis,
    QgsCoordinateReferenceSystem,
    QgsCoordinateTransform,
    QgsCsException,
    QgsExpressionContextUtils,
    QgsFeature,
    QgsField,
    QgsFields,
    QgsGeometry,
    QgsMapLayer,
    QgsMesh,
    QgsMeshDatasetIndex,
    QgsMeshLayer,
    QgsPointXY,
    QgsProject,
    QgsVectorFileWriter,
    QgsVectorLayer,
)
from qgis.PyQt.QtCore import QCoreApplication, QMetaType

from .culvert_fields import (
    DEFAULT_OPTION,
    FIELD_NAMES,
    FIELDS,
    KIND_FLOAT,
    KIND_INT,
    KIND_INT_TEXT,
    KIND_STR,
    SOFT_TELEMAC,
)
from .culvert_io import (
    CulvertFileError,
    detect_option,
    field_for_header,
    is_null,
    parse_value,
    read_culvert_file,
    validate_record,
)
from .mesh_locator import MeshNodeLocator
from .MeshUtils import MeshUtils

STYLE_FILE = os.path.join(os.path.dirname(__file__), "..", "styles", "culvert.qml")

QT_TYPES = {
    KIND_STR: QMetaType.Type.QString,
    KIND_INT_TEXT: QMetaType.Type.QString,
    KIND_FLOAT: QMetaType.Type.Double,
    KIND_INT: QMetaType.Type.Int,
}

# Settings stored in the culvert layer (layer variables, saved in the project and in the default style)
OPTION_VARIABLE = "culvert_option"
RELAX_VARIABLE = "culvert_relaxation"
MESH_VARIABLE = "culvert_mesh"
BOTTOM_VARIABLE = "culvert_bottom"
DEFAULT_RELAX = 0.1


def tr(message):
    return QCoreApplication.translate("CulvertCore", message)


######################################################################################
#                                       MESH                                         #
######################################################################################


def is_bottom_dataset(name):
    """TELEMAC names (BOTTOM, FOND) and MDAL name of the elevation of the nodes (Bed Elevation)."""
    return any(key in name.lower() for key in ("fond", "bottom", "bed elevation"))


class MeshContext:
    """Copy of the native mesh of a mesh layer and its node lookup."""

    def __init__(self, layer: QgsMeshLayer):
        self.layer = layer
        self.native = QgsMesh()
        layer.dataProvider().populateMesh(self.native)
        self.locator = MeshNodeLocator(self.native)

    @property
    def crs(self):
        return self.layer.crs()

    def transform_from(self, crs: QgsCoordinateReferenceSystem, project=None):
        """Transform from crs to the mesh CRS, None if one of them is not valid."""
        if not crs.isValid() or not self.crs.isValid():
            return None
        return QgsCoordinateTransform(crs, self.crs, project or QgsProject.instance())

    def usable_datasets(self) -> List[Tuple[int, str]]:
        """(group index, name) of the datasets usable for the elevations: scalar, on the nodes, not empty."""
        provider = self.layer.dataProvider()
        groups = []
        for i in range(provider.datasetGroupCount()):
            metadata = provider.datasetGroupMetadata(i)
            if MeshUtils.isScalarOnVertices(metadata) and provider.datasetCount(i) > 0:
                groups.append((i, metadata.name()))
        return groups

    def dataset_group(self, dataset) -> Optional[int]:
        """Index of a usable dataset group from its name or index, None if not found."""
        for index, name in self.usable_datasets():
            if dataset in (index, name) or str(dataset) == str(index):
                return index
        return None

    def default_dataset(self) -> Optional[str]:
        datasets = self.usable_datasets()
        for _, name in datasets:
            if is_bottom_dataset(name):
                return name
        return datasets[0][1] if datasets else None

    def node_value(self, group: int, node: int) -> Optional[float]:
        """Value of the dataset group at a TELEMAC node (1-based), first timestep, rounded to 0.01."""
        if group is None or node is None or not 1 <= node <= self.native.vertexCount():
            return None
        return MeshUtils.zFromN(self.layer, QgsMeshDatasetIndex(group, 0), node)


_contexts: Dict[str, MeshContext] = {}


def mesh_context(layer: QgsMeshLayer) -> MeshContext:
    """Cached MeshContext of a mesh layer, rebuilt when the mesh changes."""
    context = _contexts.get(layer.id())
    if context is None or context.layer is not layer:
        context = MeshContext(layer)
        _contexts[layer.id()] = context
        for signal in (layer.dataChanged, layer.reloaded, layer.willBeDeleted, layer.dataSourceChanged):
            signal.connect(lambda layer_id=layer.id(): _contexts.pop(layer_id, None))
    return context


def mesh_layer(value) -> Optional[QgsMeshLayer]:
    """Mesh layer from a layer, a layer id or a layer name."""
    if isinstance(value, QgsMeshLayer):
        return value
    if is_null(value) or not value:
        return None
    project = QgsProject.instance()
    layer = project.mapLayer(str(value))
    if layer is None:
        layers = project.mapLayersByName(str(value))
        layer = layers[0] if layers else None
    return layer if isinstance(layer, QgsMeshLayer) else None


######################################################################################
#                                  CULVERT LAYER                                     #
######################################################################################


def culvert_fields() -> QgsFields:
    fields = QgsFields()
    for fld in FIELDS:
        fields.append(QgsField(fld.name, QT_TYPES[fld.kind]))
    return fields


def is_culvert_layer(layer) -> bool:
    """Line layer having all the culvert fields (whatever their case)."""
    if layer is None or layer.type() != Qgis.LayerType.Vector or layer.geometryType() != Qgis.GeometryType.Line:
        return False
    names = {f.name().lower() for f in layer.fields()}
    return all(name.lower() in names for name in FIELD_NAMES)


def layer_setting(layer, name, default=None):
    if layer is None:
        return default
    value = QgsExpressionContextUtils.layerScope(layer).variable(name)
    return default if value in (None, "") or is_null(value) else value


def culvert_option(layer) -> int:
    try:
        return 2 if int(layer_setting(layer, OPTION_VARIABLE, DEFAULT_OPTION)) == 2 else 1
    except (TypeError, ValueError):
        return DEFAULT_OPTION


def culvert_relaxation(layer) -> float:
    try:
        return float(layer_setting(layer, RELAX_VARIABLE, DEFAULT_RELAX))
    except (TypeError, ValueError):
        return DEFAULT_RELAX


def set_layer_settings(layer, persist=True, **settings):
    """Store settings (option, relaxation, mesh, bottom) in the culvert layer.

    With persist, they are also saved in the default style (GeoPackage layer_styles table, or .qml next to a
    shapefile), so they come back when the layer is opened in another project.
    """
    names = {
        "option": OPTION_VARIABLE,
        "relaxation": RELAX_VARIABLE,
        "mesh": MESH_VARIABLE,
        "bottom": BOTTOM_VARIABLE,
    }
    for key, value in settings.items():
        QgsExpressionContextUtils.setLayerVariable(layer, names[key], value)
    if persist and layer.providerType() == "ogr":
        layer.saveDefaultStyle(QgsMapLayer.StyleCategory.AllStyleCategories)


def culvert_name(feature) -> str:
    name = feature["NAME"]
    if is_null(name) or name in [NULL, ""]:
        return tr("Nameless culvert (feature id {})").format(feature.id())
    return name


def record_from_feature(feature) -> dict:
    """Feature attributes as a dict for culvert_io, NULL being None."""
    record = {}
    for name in FIELD_NAMES:
        value = feature[name]
        record[name] = None if is_null(value) or value == NULL else value
    return record


def write_vector_file(layer, path, name=None) -> Tuple[Optional[str], Optional[str]]:
    """Save a layer as a shapefile or as a layer of a GeoPackage, whose other layers are kept.

    Return (source of the saved layer, None) or (None, error).
    """
    extension = os.path.splitext(path)[1].lstrip(".").lower()
    driver = QgsVectorFileWriter.driverForExtension(extension) or "ESRI Shapefile"
    name = name or os.path.splitext(os.path.basename(path))[0]

    options = QgsVectorFileWriter.SaveVectorOptions()
    options.driverName = driver
    options.fileEncoding = "utf-8"
    source = path
    if driver == "GPKG":
        options.layerName = name
        if os.path.exists(path):
            options.actionOnExistingFile = QgsVectorFileWriter.ActionOnExistingFile.CreateOrOverwriteLayer
        source = f"{path}|layername={name}"

    result = QgsVectorFileWriter.writeAsVectorFormatV2(
        layer=layer,
        fileName=path,
        transformContext=QgsProject.instance().transformContext(),
        options=options,
    )
    if result[0] != Qgis.VectorExportResult.Success:
        return None, result[1]
    return source, None


def memory_culvert_layer(crs, name="Culverts") -> QgsVectorLayer:
    layer = QgsVectorLayer(f"MultiLineString?crs={crs.authid()}", name, "memory")
    layer.setCrs(crs)
    layer.dataProvider().addAttributes(culvert_fields().toList())
    layer.updateFields()
    return layer


def load_culvert_layer(source, crs=None, name=None) -> Optional[QgsVectorLayer]:
    """Open a saved culvert layer with the culvert style, None if it is not valid."""
    name = name or os.path.splitext(os.path.basename(source.split("|")[0]))[0]
    layer = QgsVectorLayer(source, name, "ogr")
    if not layer.isValid():
        return None
    if crs is not None:
        layer.setCrs(crs)
    apply_style(layer)
    return layer


def apply_style(layer):
    """Culvert style, keeping the settings already stored in the layer."""
    settings = {
        key: layer_setting(layer, variable)
        for key, variable in (
            ("option", OPTION_VARIABLE),
            ("relaxation", RELAX_VARIABLE),
            ("mesh", MESH_VARIABLE),
            ("bottom", BOTTOM_VARIABLE),
        )
    }
    layer.loadNamedStyle(STYLE_FILE)
    set_layer_settings(layer, **{k: v for k, v in settings.items() if v is not None})


######################################################################################
#                                AUTOMATIC VALUES                                    #
######################################################################################


def mesh_vertices(geometry, culv_to_mesh) -> Optional[List[QgsPointXY]]:
    """Vertices of a culvert in the CRS of the mesh, None if the culvert is not valid or cannot be converted."""
    vertices = MeshUtils.lineVertices(geometry)
    if len(vertices) < 2 or culv_to_mesh is None:
        return None
    try:
        return [culv_to_mesh.transform(vertex) for vertex in vertices]
    except QgsCsException:
        return None


def nodes(context: MeshContext, vertices) -> Tuple[Tuple[Optional[int], Optional[int]], Optional[str]]:
    """((N1, N2), error) of the extremities of a culvert given in the mesh CRS."""
    if vertices is None:
        return (None, None), tr("The culvert geometry is not valid or cannot be converted to the mesh CRS.")
    found = []
    error = None
    for vertex in (vertices[0], vertices[-1]):
        node, err = context.locator.nearest_node(vertex)
        if err is not None:
            error = err
        found.append(node)
    return tuple(found), error


def correct_angle(angle):
    if angle < 0.0:
        angle += 360
    elif angle > 360.0:
        angle = angle - 360
    return angle


def segment_angle(p1, p2):
    return correct_angle(math.degrees(math.atan2(p2.y() - p1.y(), p2.x() - p1.x())))


def angles(vertices):
    """TELEMAC angles A1, A2 of a culvert with the x axis, in degrees."""
    return correct_angle(segment_angle(vertices[0], vertices[1]) - 180), segment_angle(vertices[-2], vertices[-1])


def auto_values(context: MeshContext, culv_to_mesh, feature, dataset_group) -> Tuple[dict, List[str]]:
    """Values computed from the geometry and the mesh, as ({field name: value}, [error messages]).

    N1 and N2 are always computed (None if the extremity is not within the mesh), Z, LENGTH and the angles only
    for the culverts where the automatic option (AZ, AL, AA) is checked.
    """
    vertices = mesh_vertices(feature.geometry(), culv_to_mesh)
    (n1, n2), err = nodes(context, vertices)
    values = {"N1": n1, "N2": n2}
    errors = [] if err is None else [err]
    if vertices is None:
        return values, errors

    if feature["AZ"] == 1 and err is None:
        if dataset_group is None:
            errors.append(tr("No valid mesh dataset for the elevations."))
        else:
            for name, node in (("Z1", n1), ("Z2", n2)):
                z = context.node_value(dataset_group, node)
                if z is None:
                    errors.append(tr("There is no value in the dataset at node {}.").format(node))
                else:
                    values[name] = z

    if feature["AL"] == 1:
        values["LENGTH"] = sum(p1.distance(p2) for p1, p2 in zip(vertices[:-1], vertices[1:]))

    if feature["AA"] == 1:
        values["a1"], values["a2"] = angles(vertices)

    return values, errors


def write_attributes(layer, attrs) -> Optional[str]:
    """Write {feature id: {field index: value}} through the edit buffer, None or an error message.

    If the layer is being edited, the changes stay in the buffer (one undo step) and are never committed for the
    user, otherwise they are committed at once.
    """
    was_editing = layer.isEditable()
    if not was_editing and not layer.startEditing():
        return tr("The culvert layer cannot be edited.")

    layer.beginEditCommand(tr("Culvert automatic values"))
    for fid, values in attrs.items():
        for idx, value in values.items():
            layer.changeAttributeValue(fid, idx, value)
    layer.endEditCommand()

    if not was_editing and not layer.commitChanges():
        errors = " ".join(layer.commitErrors())
        layer.rollBack()
        return tr("Error when saving the culvert layer : {}").format(errors)
    return None


def update_auto_values(layer, context: MeshContext, dataset_group, project=None) -> List[list]:
    """Write the automatic values of all the culverts of a layer; returns the problems [name, message, fid]."""
    culv_to_mesh = context.transform_from(layer.crs(), project)
    fields = layer.fields()
    attrs = {}
    problems = []
    for feature in layer.getFeatures():
        values, errors = auto_values(context, culv_to_mesh, feature, dataset_group)
        problems += [[culvert_name(feature), error, feature.id()] for error in errors]
        attrs[feature.id()] = {
            fields.lookupField(name): (NULL if value is None else value) for name, value in values.items()
        }
    error = write_attributes(layer, attrs)
    if error:
        problems.append([layer.name(), error, None])
    return problems


######################################################################################
#                                  CHECK / EXPORT                                    #
######################################################################################


def export_records(layer, context: MeshContext, dataset_group, software, option, project=None, features=None):
    """Records of the culverts as written in the file, and the list of [culvert name, problem, feature id].

    features: the culverts to check, all the features of the layer by default.

    Nothing is read from the automatic fields: nodes, Z, length and angles are computed again, so the file
    always matches the mesh and the geometries, and the layer is not modified.
    """
    culv_to_mesh = context.transform_from(layer.crs(), project)
    if culv_to_mesh is None:
        return [], [[layer.name(), tr("The culvert layer or the mesh has no valid CRS."), None]]

    records = []
    problems = []
    for feature in layer.getFeatures() if features is None else features:
        name = culvert_name(feature)
        record = record_from_feature(feature)

        values, errors = auto_values(context, culv_to_mesh, feature, dataset_group)
        record.update(values)
        problems += [[name, error, feature.id()] for error in errors]

        # One line per kind of problem and culvert, to keep the list short
        invalid, not_positive = [], []
        for code, field_name in validate_record(record, software, option):
            (not_positive if code == "not_positive" else invalid).append(field_name)
        if invalid:
            message = tr("Values missing or not correct: {}.").format(", ".join(invalid))
            problems.append([name, message, feature.id()])
        if not_positive:
            message = tr("Values that must be strictly positive: {}.").format(", ".join(not_positive))
            problems.append([name, message, feature.id()])

        vertices = mesh_vertices(feature.geometry(), culv_to_mesh)
        if vertices is not None:
            record["_xy"] = (vertices[0].x(), vertices[0].y(), vertices[-1].x(), vertices[-1].y())
        records.append(record)

    return records, problems


######################################################################################
#                                      IMPORT                                        #
######################################################################################


@dataclass
class ImportResult:
    features: List[QgsFeature] = field(default_factory=list)
    # (row number, message)
    rejected: List[Tuple[int, str]] = field(default_factory=list)
    warnings: List[str] = field(default_factory=list)
    relax: Optional[float] = None
    option: int = DEFAULT_OPTION
    uhaina: bool = False
    error: Optional[str] = None


def default_columns(headers) -> Dict[str, str]:
    """Field name -> file column, matched by name and TELEMAC aliases."""
    columns = {}
    for header in headers:
        name = field_for_header(header)
        if name is not None and name not in columns:
            columns[name] = header
    return columns


def import_culvert_file(txt_path, columns: Optional[Dict[str, str]], context: MeshContext, layer_crs, project=None):
    """Culvert features read from a TELEMAC or Uhaina culvert file, in layer_crs.

    columns maps the field names to the file columns (default: matched by name). TELEMAC files give the nodes,
    Uhaina files give the coordinates of the extremities in the mesh CRS.
    """
    result = ImportResult()
    try:
        culv_file = read_culvert_file(txt_path)
    except (CulvertFileError, OSError) as err:
        result.error = tr("Error when reading culvert file : {}").format(err)
        return result

    if columns is None:
        columns = default_columns(culv_file.headers)

    lower = {header.lower(): header for header in culv_file.headers}
    xy_columns = [lower.get(name) for name in ("x1", "y1", "x2", "y2")]
    result.uhaina = all(xy_columns)
    if not result.uhaina and not all(columns.get(name) in culv_file.headers for name in ("N1", "N2")):
        result.error = tr("Columns of the nodes N1 and N2 are not defined.")
        return result

    mesh_to_layer = None
    if context.crs.isValid() and layer_crs.isValid():
        mesh_to_layer = QgsCoordinateTransform(context.crs, layer_crs, project or QgsProject.instance())

    fields = culvert_fields()
    kinds = {fld.name: fld.kind for fld in FIELDS}
    for i, row in enumerate(culv_file.rows, 1):
        try:
            if result.uhaina:
                x1, y1, x2, y2 = (parse_value(row[col], KIND_FLOAT, col) for col in xy_columns)
                points = [QgsPointXY(x1, y1), QgsPointXY(x2, y2)]
                n1, n2 = (context.locator.nearest_node(point)[0] for point in points)
            else:
                n1 = parse_value(row[columns["N1"]], KIND_INT, "N1")
                n2 = parse_value(row[columns["N2"]], KIND_INT, "N2")

            attrs = []
            for fld in FIELDS:
                column = columns.get(fld.name)
                if fld.name == "N1":
                    attrs.append(n1)
                elif fld.name == "N2":
                    attrs.append(n2)
                elif column:
                    attrs.append(parse_value(row[column], kinds[fld.name], fld.name))
                elif fld.kind in (KIND_INT, KIND_FLOAT):
                    attrs.append(0)
                else:
                    attrs.append("")
        except CulvertFileError as error:
            result.rejected.append((i, str(error)))
            continue

        if result.uhaina:
            located = [_to_crs(point, mesh_to_layer) for point in points]
            if n1 is None or n2 is None:
                result.warnings.append(tr("Culvert {}: extremity not within the mesh, N1/N2 left empty.").format(i))
        else:
            located = [MeshUtils.xyFromN(context.native, n, mesh_to_layer) for n in (n1, n2)]
        errors = " ".join(filter(None, (located[0][1], located[1][1])))
        if errors:
            result.rejected.append((i, errors))
            continue

        feature = QgsFeature(fields)
        feature.setGeometry(QgsGeometry.fromMultiPolylineXY([[located[0][0], located[1][0]]]))
        feature.setAttributes(attrs)
        result.features.append(feature)

    result.relax = culv_file.relax
    result.option = detect_option(culv_file.rows, columns)
    return result


def _to_crs(point, transform):
    if transform is None:
        return point, None
    try:
        return transform.transform(point), None
    except QgsCsException:
        return None, tr("The coordinates cannot be converted to the CRS of the layer.")


SOFTWARE_NAMES = {SOFT_TELEMAC: "TELEMAC", 1: "Uhaina"}
