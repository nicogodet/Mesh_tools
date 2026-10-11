# -*- coding: utf-8 -*-

import unittest

from .utilities import make_temp_folder, set_canvas_crs, write_mesh  # isort: skip

from qgis.core import (  # noqa: E402
    QgsCoordinateReferenceSystem,
    QgsCoordinateTransform,
    QgsEditFormConfig,
    QgsExpression,
    QgsExpressionContext,
    QgsExpressionContextUtils,
    QgsFeature,
    QgsGeometry,
    QgsMeshLayer,
    QgsPointXY,
    QgsProject,
)

from mesh_tools.libs import culvert_core, culvert_expressions  # noqa: E402

CRS = "EPSG:2154"


class TestMeshExpressions(unittest.TestCase):
    def setUp(self):
        self.project = QgsProject.instance()
        self.project.removeAllMapLayers()
        set_canvas_crs(CRS)
        folder = make_temp_folder(self)
        self.mesh = QgsMeshLayer(write_mesh(folder), "mesh", "mdal")
        self.mesh.setCrs(QgsCoordinateReferenceSystem(CRS))
        self.project.addMapLayer(self.mesh)
        culvert_expressions.register()
        self.layer = culvert_core.memory_culvert_layer(QgsCoordinateReferenceSystem(CRS))
        self.project.addMapLayer(self.layer)
        self.layer.loadNamedStyle(culvert_core.STYLE_FILE)
        culvert_core.set_layer_settings(self.layer, mesh=self.mesh.id(), bottom="Bed Elevation")

    def evaluate(self, text, geometry):
        context = QgsExpressionContext(QgsExpressionContextUtils.globalProjectLayerScopes(self.layer))
        feature = QgsFeature(self.layer.fields())
        feature.setGeometry(geometry)
        context.setFeature(feature)
        expression = QgsExpression(text)
        value = expression.evaluate(context)
        self.assertFalse(expression.hasEvalError(), expression.evalErrorString())
        return value

    def test_functions(self):
        point = QgsGeometry.fromWkt("Point(90 20)")
        self.assertEqual(self.evaluate("mesh_vertex_index(@culvert_mesh, $geometry)", point), 1)
        self.assertEqual(self.evaluate("mesh_vertex_value(@culvert_mesh, @culvert_bottom, $geometry)", point), 11.0)
        self.assertEqual(self.evaluate("mesh_vertex_value('mesh', 0, 3)", point), 13.0)
        outside = QgsGeometry.fromWkt("Point(500 500)")
        self.assertEqual(self.evaluate("mesh_vertex_index(@culvert_mesh, $geometry)", outside), -1)
        self.assertIsNone(self.evaluate("mesh_vertex_index('no such layer', $geometry)", point))

    def test_other_layer_crs(self):
        to_3942 = QgsCoordinateTransform(
            QgsCoordinateReferenceSystem(CRS), QgsCoordinateReferenceSystem("EPSG:3942"), self.project
        )
        layer = culvert_core.memory_culvert_layer(QgsCoordinateReferenceSystem("EPSG:3942"))
        self.project.addMapLayer(layer)
        context = QgsExpressionContext(QgsExpressionContextUtils.globalProjectLayerScopes(layer))
        feature = QgsFeature(layer.fields())
        feature.setGeometry(QgsGeometry.fromPointXY(to_3942.transform(QgsPointXY(90, 20))))
        context.setFeature(feature)
        expression = QgsExpression(f"mesh_vertex_index('{self.mesh.id()}', $geometry)")
        self.assertEqual(expression.evaluate(context), 1)

    def add_culvert(self, **values):
        feature = QgsFeature(self.layer.fields())
        for name, value in {"NAME": "c", "HAUT": 1.0, "LARG": 2.0, "CIRC": 0, "AZ": 1, "AL": 1, "AA": 1,
                            "Z1": -1.0, "Z2": -1.0, "LENGTH": 0.0, "a1": 0.0, "a2": 0.0}.items():  # fmt: skip
            feature[name] = values.get(name, value)
        feature.setGeometry(QgsGeometry.fromWkt("MultiLineString((10 5, 50 5))"))
        self.layer.dataProvider().addFeatures([feature])
        return next(self.layer.getFeatures()).id()

    def test_default_values_follow_the_geometry(self):
        fid = self.add_culvert()
        self.layer.startEditing()
        self.layer.changeGeometry(fid, QgsGeometry.fromWkt("MultiLineString((10 5, 50 15, 90 20))"))
        feature = self.layer.getFeature(fid)
        context = culvert_core.mesh_context(self.mesh)
        expected, errors = culvert_core.auto_values(
            context, context.transform_from(self.layer.crs()), feature, context.dataset_group("Bed Elevation")
        )
        self.assertEqual(errors, [])
        for name in ("N1", "N2", "Z1", "Z2"):
            self.assertEqual(feature[name], expected[name], name)
        for name in ("LENGTH", "a1", "a2"):
            self.assertAlmostEqual(feature[name], expected[name], places=6, msg=name)
        self.layer.rollBack()

    def test_manual_values_are_kept(self):
        fid = self.add_culvert(AZ=0, AL=0, AA=0, Z1=3.5, LENGTH=12.0, a1=45.0)
        self.layer.startEditing()
        self.layer.changeGeometry(fid, QgsGeometry.fromWkt("MultiLineString((10 5, 90 20))"))
        feature = self.layer.getFeature(fid)
        self.assertEqual((feature["Z1"], feature["LENGTH"], feature["a1"]), (3.5, 12.0, 45.0))
        self.assertEqual((feature["N1"], feature["N2"]), (1, 2))
        self.layer.rollBack()

    def test_circular_width_follows_the_height(self):
        fid = self.add_culvert(CIRC=1, HAUT=1.5, LARG=9.0)
        self.layer.startEditing()
        self.layer.changeAttributeValue(fid, self.layer.fields().lookupField("HAUT"), 1.8)
        self.assertEqual(self.layer.getFeature(fid)["LARG"], 1.8)
        self.layer.rollBack()

    def test_without_the_plugin_functions_the_values_are_kept(self):
        fid = self.add_culvert(AZ=1)
        self.layer.startEditing()
        self.layer.changeGeometry(fid, QgsGeometry.fromWkt("MultiLineString((10 5, 90 20))"))
        before = self.layer.getFeature(fid)
        culvert_expressions.unregister()
        self.addCleanup(culvert_expressions.register)
        self.layer.changeGeometry(fid, QgsGeometry.fromWkt("MultiLineString((10 5, 60 50))"))
        after = self.layer.getFeature(fid)
        for name in ("N1", "N2", "Z1", "Z2"):
            self.assertEqual(after[name], before[name], name)
        self.layer.rollBack()

    def test_out_of_mesh_node_is_null(self):
        fid = self.add_culvert()
        self.layer.startEditing()
        self.layer.changeGeometry(fid, QgsGeometry.fromWkt("MultiLineString((10 5, 900 500))"))
        feature = self.layer.getFeature(fid)
        self.assertEqual(feature["N1"], 1)
        self.assertTrue(feature["N2"] is None or str(feature["N2"]) in ("NULL", "None"))
        self.layer.rollBack()

    def test_automatic_fields_are_not_editable(self):
        form = self.layer.editFormConfig()
        properties = form.dataDefinedFieldProperties("Z1")
        self.assertTrue(properties.hasProperty(QgsEditFormConfig.DataDefinedProperty.Editable))
        fid = self.add_culvert(AZ=1)
        context = QgsExpressionContext(QgsExpressionContextUtils.globalProjectLayerScopes(self.layer))
        context.setFeature(self.layer.getFeature(fid))
        editable, _ = properties.valueAsBool(QgsEditFormConfig.DataDefinedProperty.Editable, context, True)
        self.assertFalse(editable)


if __name__ == "__main__":
    unittest.main()
