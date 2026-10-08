# -*- coding: utf-8 -*-

import os
import unittest

from .utilities import make_temp_folder, set_canvas_crs, write_mesh  # isort: skip

from qgis.core import (  # noqa: E402
    QgsCoordinateReferenceSystem,
    QgsFeature,
    QgsGeometry,
    QgsMeshLayer,
    QgsProject,
    QgsVectorLayer,
)
from qgis.PyQt.QtWidgets import QFileDialog, QMessageBox  # noqa: E402

from mesh_tools.libs.culvert_fields import FIELDS  # noqa: E402
from mesh_tools.libs.culvert_io import field_for_header, read_header  # noqa: E402
from mesh_tools.libs.culvert_manager import CulvertManager  # noqa: E402

CRS = "EPSG:2154"
SIPHON = os.path.join(os.path.dirname(__file__), "data", "fo1_siphon.txt")


class CulvertManagerTestCase(unittest.TestCase):
    mesh_crs = CRS
    culv_crs = CRS
    canvas_crs = CRS

    def setUp(self):
        self.project = QgsProject.instance()
        self.project.removeAllMapLayers()
        set_canvas_crs(self.canvas_crs)
        self.folder = make_temp_folder(self)

        # Popups block a headless run
        self._question = QMessageBox.question
        QMessageBox.question = staticmethod(lambda *a, **k: QMessageBox.StandardButton.Cancel)
        self.addCleanup(setattr, QMessageBox, "question", self._question)

        self.dock = CulvertManager()
        self.addCleanup(self.dock.clean)

    def add_mesh(self, crs=None):
        mesh = QgsMeshLayer(write_mesh(self.folder), "mesh", "mdal")
        self.assertTrue(mesh.isValid())
        mesh.setCrs(QgsCoordinateReferenceSystem(crs or self.mesh_crs))
        self.project.addMapLayer(mesh)
        return mesh

    def add_culvert_layer(self, path=None):
        path = path or os.path.join(self.folder, "culv.shp")
        self.dock.create_new_shp(path, QgsCoordinateReferenceSystem(self.culv_crs))
        return self.dock.lay_culv

    def add_culvert(self, layer, wkt="MultiLineString((10 5, 90 20))", **values):
        ft = QgsFeature(layer.fields())
        defaults = {"NAME": "c1", "CE1": 0.5, "CE2": 0.5, "CS1": 1.0, "CS2": 1.0, "LARG": 1.2, "HAUT": 1.2,
                    "CLAP": "0", "L12": 1.0, "Z1": 10.0, "Z2": 11.0, "CV": 0.0, "C56": 0.0, "CV5": 0.0,
                    "C5": 0.0, "CT": 0.0, "HAUT2": 0.0, "FRIC": 0.0, "LENGTH": 10.0, "CIRC": 1,
                    "d1": 90.0, "d2": 90.0, "a1": 0.0, "a2": 0.0, "AA": 1, "NB_in_//": 1, "AL": 1,
                    "AZ": 0, "N1": 1, "N2": 3}  # fmt: skip
        defaults.update(values)
        for name, value in defaults.items():
            ft[name] = value
        ft.setGeometry(QgsGeometry.fromWkt(wkt))
        layer.dataProvider().addFeatures([ft])

    def export(self, software=0):
        out = os.path.join(self.folder, "out.txt")
        self._save = QFileDialog.getSaveFileName
        QFileDialog.getSaveFileName = staticmethod(lambda *a, **k: (out, ""))
        self.addCleanup(setattr, QFileDialog, "getSaveFileName", self._save)
        self.dock.cb_software_select.setCurrentIndex(software)
        self.dock.create_file()
        if not os.path.exists(out):
            return None
        with open(out) as f:
            return f.read().splitlines()


class TestNodes(CulvertManagerTestCase):
    def test_n_without_rendering_the_mesh(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer, N1=None, N2=None)
        self.dock.update_all_n()
        ft = next(layer.getFeatures())
        self.assertEqual((ft["N1"], ft["N2"]), (1, 2))

    def test_point_outside_mesh_gives_null(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer, "MultiLineString((10 5, 900 500))")
        self.dock.update_all_n(log=False)
        ft = next(layer.getFeatures())
        for name in ("N1", "N2"):
            self.assertTrue(ft[name] is None or str(ft[name]) in ("NULL", "None"), name)

    def test_linestring_layer_is_accepted(self):
        self.add_mesh()
        fields = QgsVectorLayer("LineString?crs=" + CRS, "x", "memory").fields()
        layer = QgsVectorLayer("LineString?crs=" + CRS, "linestring culverts", "memory")
        layer.dataProvider().addAttributes(self.dock_fields())
        layer.updateFields()
        self.assertEqual(fields.count(), 0)
        self.project.addMapLayer(layer)
        self.dock.cb_lay_culv.setCurrentIndex(self.dock.cb_lay_culv.findData(layer.id(), 32))
        self.add_culvert(layer, "LineString(10 5, 90 20)", N1=None, N2=None)
        self.dock.update_all_n()
        ft = next(layer.getFeatures())
        self.assertEqual((ft["N1"], ft["N2"]), (1, 2))

    def dock_fields(self):
        from qgis.core import QgsField

        return [QgsField(f[0], f[1]) for f in self.dock.culv_flds]


class TestExport(CulvertManagerTestCase):
    def setup_layers(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer)
        return layer

    def test_telemac_columns_and_haut2(self):
        self.setup_layers()
        lines = self.export(0)
        self.assertIsNotNone(lines)
        header, values = lines[2].split("\t"), lines[3].split("\t")
        self.assertEqual(len(header), len(values))
        self.assertEqual(values[header.index("HAUT2")], "1.2")
        self.assertEqual(values[header.index("LENGTH")], "10.0")

    def test_uhaina(self):
        self.setup_layers()
        lines = self.export(1)
        self.assertIsNotNone(lines)
        header, values = lines[2].split("\t"), lines[3].split("\t")
        self.assertEqual(len(header), len(values))
        self.assertEqual(float(values[header.index("X1")]), 10.0)
        self.assertEqual(float(values[header.index("Y2")]), 20.0)

    def test_export_does_not_commit_user_edits(self):
        layer = self.setup_layers()
        layer.startEditing()
        fid = next(layer.getFeatures()).id()
        layer.changeAttributeValue(fid, layer.fields().lookupField("CE1"), 0.9)
        self.dock.verif_culvert()
        self.assertTrue(layer.isEditable())
        self.assertEqual(layer.editBuffer().changedAttributeValues()[fid][layer.fields().lookupField("CE1")], 0.9)
        layer.rollBack()


class TestExportCrs(CulvertManagerTestCase):
    """Culvert and mesh in different CRS than the canvas."""

    mesh_crs = CRS
    culv_crs = CRS
    canvas_crs = "EPSG:4326"

    def test_uhaina_when_canvas_crs_differs(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer)
        lines = self.export(1)
        self.assertIsNotNone(lines)
        header, values = lines[2].split("\t"), lines[3].split("\t")
        self.assertAlmostEqual(float(values[header.index("X1")]), 10.0, places=3)
        self.assertAlmostEqual(float(values[header.index("Y2")]), 20.0, places=3)


class TestSignals(CulvertManagerTestCase):
    def test_clean_without_layers(self):
        self.dock.clean()

    def test_mesh_added_after_the_dock_is_taken(self):
        mesh = self.add_mesh()
        self.assertIsNotNone(self.dock.lay_mesh)
        self.assertEqual(self.dock.lay_mesh.id(), mesh.id())

    def test_crs_change_does_not_multiply_connections(self):
        mesh = self.add_mesh()
        calls = []
        original = self.dock.vertices
        from mesh_tools.libs import culvert_manager

        real = culvert_manager.MeshUtils.createVerticesSpatialIndex
        culvert_manager.MeshUtils.createVerticesSpatialIndex = staticmethod(
            lambda *a, **k: calls.append(1) or real(*a, **k)
        )
        self.addCleanup(setattr, culvert_manager.MeshUtils, "createVerticesSpatialIndex", staticmethod(real))
        for authid in ("EPSG:3942", "EPSG:3943", CRS):
            calls.clear()
            mesh.setCrs(QgsCoordinateReferenceSystem(authid))
            self.assertEqual(len(calls), 1, authid)
        self.assertIsNotNone(original)

    def test_switching_culvert_layers_does_not_multiply_connections(self):
        self.add_mesh()
        layer = self.add_culvert_layer(os.path.join(self.folder, "a.shp"))
        self.add_culvert(layer)
        self.add_culvert(self.add_culvert_layer(os.path.join(self.folder, "b.shp")))
        counter = []
        real = type(self.dock).display_culv_info
        type(self.dock).display_culv_info = lambda s: counter.append(1)
        self.addCleanup(setattr, type(self.dock), "display_culv_info", real)
        for name in ("a", "b", "a", "b", "a"):
            idx = self.dock.cb_lay_culv.findText(name)
            self.dock.cb_lay_culv.setCurrentIndex(idx)
        counter.clear()
        self.dock.lay_culv.selectAll()
        self.assertEqual(len(counter), 1)
        self.assertIsNotNone(layer)


class TestImport(CulvertManagerTestCase):
    def items(self, path):
        items = {f.name.lower(): [f.name, ""] for f in FIELDS}
        for header in read_header(path):
            name = field_for_header(header)
            if name:
                items[name.lower()][1] = header
        return items

    def test_official_siphon_file(self):
        # Grid of 30 x 24 nodes, so that nodes 198 and 661 exist and are inside the mesh
        mesh_path = os.path.join(self.folder, "siphon.2dm")
        nx, ny = 30, 24
        with open(mesh_path, "w") as f:
            f.write("MESH2D\n")
            for n in range(1, nx * ny + 1):
                f.write(f"ND {n} {(n - 1) % nx * 10.0} {(n - 1) // nx * 10.0} 1.0\n")
            e = 1
            for j in range(ny - 1):
                for i in range(nx - 1):
                    a = j * nx + i + 1
                    f.write(f"E3T {e} {a} {a + 1} {a + nx} 1\n")
                    f.write(f"E3T {e + 1} {a + 1} {a + nx + 1} {a + nx} 1\n")
                    e += 2
        mesh = QgsMeshLayer(mesh_path, "siphon", "mdal")
        mesh.setCrs(QgsCoordinateReferenceSystem(CRS))
        self.project.addMapLayer(mesh)
        layer = self.dock.import_culvert_file(SIPHON, self.items(SIPHON), "", QgsCoordinateReferenceSystem(CRS))
        self.assertIsNotNone(layer)
        ft = next(layer.getFeatures())
        self.assertEqual((ft["N1"], ft["N2"]), (198, 661))
        self.assertAlmostEqual(ft["LARG"], 2.523)
        self.assertEqual(ft["CIRC"], 1)
        self.assertAlmostEqual(ft["d1"], 90.0)
        self.assertAlmostEqual(self.dock.sb_relax.value(), 0.2)

    def import_text(self, text, layer_path="", layer_crs=CRS):
        self.add_mesh()
        path = os.path.join(self.folder, "culv.txt")
        with open(path, "w") as f:
            f.write(text)
        crs = QgsCoordinateReferenceSystem(layer_crs)
        return self.dock.import_culvert_file(path, self.items(path), layer_path, crs)

    def test_trailing_blank_line_and_rejected_rows(self):
        layer = self.import_text("c\n0.2 3\nN1\tN2\tCE1\tNAME\n1\t3\t0.5\ta\n2\t99\t0.5\tb\n1\t2\tx\tc\n\n")
        self.assertEqual(layer.featureCount(), 1)
        self.assertEqual(next(layer.getFeatures())["NAME"], "a")

    def test_memory_layer_geometry_is_multilinestring(self):
        layer = self.import_text("c\n0.2 1\nN1\tN2\n1\t3\n")
        ft = next(layer.getFeatures())
        self.assertTrue(ft.geometry().isMultipart())
        self.dock.update_all_n()  # used to raise TypeError on LineString parts

    def test_negative_and_decimal_values(self):
        layer = self.import_text("c\n0.2 1\nN1\tN2\tCE1\tz1\n1\t3\t-0.5\t1e-1\n")
        ft = next(layer.getFeatures())
        self.assertAlmostEqual(ft["CE1"], -0.5)
        self.assertAlmostEqual(ft["Z1"], 0.1)

    def test_written_layer_has_the_chosen_crs(self):
        path = os.path.join(self.folder, "imported.shp")
        layer = self.import_text("c\n0.2 1\nN1\tN2\n1\t3\n", layer_path=path, layer_crs="EPSG:3857")
        self.assertEqual(layer.crs().authid(), "EPSG:3857")
        reopened = QgsVectorLayer(path, "x", "ogr")
        self.assertEqual(reopened.crs().authid(), "EPSG:3857")


if __name__ == "__main__":
    unittest.main()
