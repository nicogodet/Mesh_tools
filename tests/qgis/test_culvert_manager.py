# -*- coding: utf-8 -*-

import os
import random
import unittest

from .utilities import make_temp_folder, set_canvas_crs, write_mesh  # isort: skip

from qgis.core import (  # noqa: E402
    QgsCoordinateReferenceSystem,
    QgsCoordinateTransform,
    QgsDataProvider,
    QgsFeature,
    QgsField,
    QgsGeometry,
    QgsMesh,
    QgsMeshLayer,
    QgsPointXY,
    QgsProject,
    QgsVectorLayer,
)
from qgis.PyQt.QtCore import QMetaType  # noqa: E402
from qgis.PyQt.QtWidgets import QFileDialog, QMessageBox  # noqa: E402

from mesh_tools.libs.culvert_fields import FIELDS  # noqa: E402
from mesh_tools.libs.culvert_io import field_for_header, read_header  # noqa: E402
from mesh_tools.libs.culvert_manager import CulvertManager  # noqa: E402
from mesh_tools.libs.mesh_locator import MeshNodeLocator  # noqa: E402

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

        # The dock must not ask anything: a popup would block a headless run
        self._question = QMessageBox.question
        QMessageBox.question = staticmethod(lambda *a, **k: self.fail("unexpected popup"))
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
        self.dock.update_all_auto()
        ft = next(layer.getFeatures())
        self.assertEqual((ft["N1"], ft["N2"]), (1, 2))

    def test_point_outside_mesh_gives_null(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer, "MultiLineString((10 5, 900 500))")
        self.dock.update_all_auto()
        ft = next(layer.getFeatures())
        self.assertEqual(ft["N1"], 1)
        self.assertTrue(ft["N2"] is None or str(ft["N2"]) in ("NULL", "None"))

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
        self.dock.update_all_auto()
        ft = next(layer.getFeatures())
        self.assertEqual((ft["N1"], ft["N2"]), (1, 2))

    def test_project_crs_change_does_not_change_nodes(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer, N1=None, N2=None)
        self.dock.update_all_auto()
        before = [(ft["N1"], ft["N2"]) for ft in layer.getFeatures()]
        set_canvas_crs("EPSG:3857")
        self.dock.update_all_auto()
        self.assertEqual([(ft["N1"], ft["N2"]) for ft in layer.getFeatures()], before)
        self.assertEqual(before, [(1, 2)])

    def test_culvert_crs_differs_from_mesh_crs(self):
        self.add_mesh()
        to_3942 = QgsCoordinateTransform(
            QgsCoordinateReferenceSystem(CRS), QgsCoordinateReferenceSystem("EPSG:3942"), self.project
        )
        points = [to_3942.transform(QgsPointXY(x, y)) for x, y in ((10, 5), (90, 20))]
        layer = QgsVectorLayer("MultiLineString?crs=EPSG:3942", "culvert 3942", "memory")
        layer.dataProvider().addAttributes(self.dock_fields())
        layer.updateFields()
        self.project.addMapLayer(layer)
        self.dock.cb_lay_culv.setCurrentIndex(self.dock.cb_lay_culv.findData(layer.id(), 32))
        wkt = QgsGeometry.fromMultiPolylineXY([points]).asWkt()
        self.add_culvert(layer, wkt, N1=None, N2=None)
        self.dock.update_all_auto()
        ft = next(layer.getFeatures())
        self.assertEqual((ft["N1"], ft["N2"]), (1, 2))

    def dock_fields(self):
        from qgis.core import QgsField

        return [QgsField(f[0], f[1]) for f in self.dock.culv_flds]


def grid_mesh(path, nx=15, ny=12, quads=False):
    """Regular mesh (spacing 10), triangles or quads, nodes numbered by rows."""
    with open(path, "w") as f:
        f.write("MESH2D\n")
        for n in range(nx * ny):
            f.write(f"ND {n + 1} {n % nx * 10.0} {n // nx * 10.0} 0.0\n")
        e = 1
        for j in range(ny - 1):
            for i in range(nx - 1):
                a = j * nx + i + 1
                if quads:
                    f.write(f"E4Q {e} {a} {a + 1} {a + nx + 1} {a + nx} 1\n")
                    e += 1
                else:
                    f.write(f"E3T {e} {a} {a + 1} {a + nx} 1\n")
                    f.write(f"E3T {e + 1} {a + 1} {a + nx + 1} {a + nx} 1\n")
                    e += 2
    return nx, ny


class TestLocator(CulvertManagerTestCase):
    def locator(self, quads):
        path = os.path.join(self.folder, "grid.2dm")
        self.nx, self.ny = grid_mesh(path, quads=quads)
        layer = QgsMeshLayer(path, "grid", "mdal")
        native = QgsMesh()
        layer.dataProvider().populateMesh(native)
        return MeshNodeLocator(native)

    def brute_force(self, x, y):
        best = min(
            ((x - i % self.nx * 10.0) ** 2 + (y - i // self.nx * 10.0) ** 2, i + 1) for i in range(self.nx * self.ny)
        )
        return best[1], best[0]

    def check_random_points(self, quads):
        locator = self.locator(quads)
        rng = random.Random(1)
        for _ in range(300):
            x, y = rng.uniform(0, (self.nx - 1) * 10), rng.uniform(0, (self.ny - 1) * 10)
            node, err = locator.nearest_node(QgsPointXY(x, y))
            self.assertIsNone(err)
            expected, dist = self.brute_force(x, y)
            # Ties (points on a bisector) may give another node at the same distance
            got = ((x - (node - 1) % self.nx * 10.0) ** 2 + (y - (node - 1) // self.nx * 10.0) ** 2)
            self.assertAlmostEqual(got, dist, places=6, msg=f"{x} {y} {node} {expected}")

    def test_nearest_node_triangles(self):
        self.check_random_points(False)

    def test_nearest_node_quads(self):
        self.check_random_points(True)

    def test_outside_and_borders(self):
        locator = self.locator(False)
        node, err = locator.nearest_node(QgsPointXY(-1.0, 5.0))
        self.assertIsNone(node)
        self.assertIsNotNone(err)
        self.assertEqual(locator.nearest_node(QgsPointXY(0.0, 0.0))[0], 1)
        self.assertEqual(locator.nearest_node(QgsPointXY(140.0, 110.0))[0], self.nx * self.ny)
        self.assertEqual(locator.nearest_node(QgsPointXY(61.0, 0.0))[0], 7)


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
        # AL = 1: the length is computed from the geometry
        self.assertAlmostEqual(float(values[header.index("LENGTH")]), (80**2 + 15**2) ** 0.5)

    def test_uhaina(self):
        self.setup_layers()
        lines = self.export(1)
        self.assertIsNotNone(lines)
        header, values = lines[2].split("\t"), lines[3].split("\t")
        self.assertEqual(len(header), len(values))
        self.assertEqual(float(values[header.index("X1")]), 10.0)
        self.assertEqual(float(values[header.index("Y2")]), 20.0)

    def test_export_recomputes_automatic_values_without_touching_the_layer(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer, N1=999, N2=998, Z1=-5.0, Z2=-5.0, LENGTH=1.0, a1=7.0, a2=7.0, AZ=1, AL=1, AA=1)
        lines = self.export(0)
        self.assertIsNotNone(lines)
        header, values = lines[2].split("\t"), lines[3].split("\t")
        get = {name: values[header.index(name)] for name in ("N1", "N2", "Z1", "Z2", "LENGTH", "a1", "a2")}
        self.assertEqual((get["N1"], get["N2"]), ("1", "2"))
        self.assertEqual((float(get["Z1"]), float(get["Z2"])), (10.0, 11.0))
        self.assertAlmostEqual(float(get["LENGTH"]), (80**2 + 15**2) ** 0.5)
        self.assertAlmostEqual(float(get["a2"]), 10.6, places=1)
        self.assertAlmostEqual(float(get["a1"]), 190.6, places=1)
        # the layer keeps its own values
        ft = next(layer.getFeatures())
        self.assertEqual((ft["N1"], ft["N2"], ft["Z1"], ft["LENGTH"]), (999, 998, -5.0, 1.0))

    def test_manual_values_are_kept_when_automatic_is_off(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer, Z1=3.5, Z2=4.5, LENGTH=12.5, a1=1.0, a2=2.0, AZ=0, AL=0, AA=0)
        lines = self.export(0)
        header, values = lines[2].split("\t"), lines[3].split("\t")
        for name, expected in (("Z1", 3.5), ("Z2", 4.5), ("LENGTH", 12.5), ("a1", 1.0), ("a2", 2.0)):
            self.assertEqual(float(values[header.index(name)]), expected, name)

    def test_culvert_outside_the_mesh_blocks_the_export(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer, "MultiLineString((10 5, 900 500))")
        self.assertIsNone(self.export(0))

    def test_verification_does_not_modify_the_layer(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer, N1=999, N2=998)
        self.dock.verif_culvert()
        ft = next(layer.getFeatures())
        self.assertEqual((ft["N1"], ft["N2"]), (999, 998))

    def test_update_button_writes_the_automatic_values(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer, N1=999, N2=998, Z1=-5.0, Z2=-5.0, LENGTH=1.0, AZ=1, AL=1, AA=0, a1=7.0)
        self.dock.btn_update_auto.click()
        ft = next(layer.getFeatures())
        self.assertEqual((ft["N1"], ft["N2"], ft["Z1"], ft["Z2"]), (1, 2, 10.0, 11.0))
        self.assertAlmostEqual(ft["LENGTH"], (80**2 + 15**2) ** 0.5)
        self.assertEqual(ft["a1"], 7.0)

    def test_dock_writes_notify_the_layer_and_leave_it_saved(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer, N1=999, N2=998)
        changed = []
        layer.attributeValueChanged.connect(lambda *a: changed.append(a))
        self.dock.btn_update_auto.click()
        self.assertTrue(changed)
        self.assertFalse(layer.isEditable())
        self.assertFalse(layer.isModified())
        # saved in the file
        reopened = QgsVectorLayer(layer.source(), "x", "ogr")
        self.assertEqual(next(reopened.getFeatures())["N1"], 1)

    def test_widget_edit_is_written_and_keeps_the_form_enabled(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer)
        layer.selectAll()
        self.assertEqual(self.dock.cur_culv_id, next(layer.getFeatures()).id())
        self.assertTrue(self.dock.gb_cur_culv.isEnabled())
        self.dock.sb_ce1.setValue(0.8)
        self.assertEqual(next(layer.getFeatures())["CE1"], 0.8)
        self.assertTrue(self.dock.gb_cur_culv.isEnabled())

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
        real = CulvertManager.update_transforms
        CulvertManager.update_transforms = lambda s: calls.append(1) or real(s)
        self.addCleanup(setattr, CulvertManager, "update_transforms", real)
        for authid in ("EPSG:3942", "EPSG:3943", CRS):
            calls.clear()
            mesh.setCrs(QgsCoordinateReferenceSystem(authid))
            self.assertEqual(len(calls), 1, authid)

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
    @staticmethod
    def items_of(path):
        items = {f.name.lower(): [f.name, ""] for f in FIELDS}
        for header in read_header(path):
            name = field_for_header(header)
            if name:
                items[name.lower()][1] = header
        return items

    def items(self, path):
        return self.items_of(path)

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
        self.dock.update_all_auto()  # used to raise TypeError on LineString parts

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


class TestFormats(CulvertManagerTestCase):
    """The same actions on a shapefile and on a GeoPackage."""

    def each_format(self):
        for extension in ("shp", "gpkg"):
            with self.subTest(extension):
                self.project.removeAllMapLayers()
                folder = os.path.join(self.folder, extension)
                os.makedirs(folder)
                yield extension, folder

    def test_create_edit_update_export(self):
        for extension, folder in self.each_format():
            self.add_mesh()
            layer = self.add_culvert_layer(os.path.join(folder, f"culv.{extension}"))
            self.assertIsNotNone(layer)
            self.assertEqual(layer.fields().lookupField("NB_in_//") >= 0, True)
            self.add_culvert(layer, N1=999, N2=998)
            layer.selectAll()
            self.dock.sb_ce1.setValue(0.7)
            self.dock.btn_update_auto.click()
            ft = next(layer.getFeatures())
            self.assertEqual((ft["CE1"], ft["N1"], ft["N2"]), (0.7, 1, 2))
            self.assertFalse(layer.isEditable())
            # saved: read again from the file
            reopened = QgsVectorLayer(layer.source(), "x", "ogr")
            self.assertEqual(next(reopened.getFeatures())["N2"], 2)
            lines = self.export(0)
            self.assertIsNotNone(lines)
            self.assertEqual(len(lines[2].split("\t")), len(lines[3].split("\t")))

    def test_style_is_stored_with_the_data(self):
        for extension, folder in self.each_format():
            self.add_mesh()
            path = os.path.join(folder, f"culv.{extension}")
            layer = self.add_culvert_layer(path)
            reopened = QgsVectorLayer(layer.source(), "x", "ogr")
            self.assertEqual(reopened.renderer().type(), "categorizedSymbol")

    def test_import_in_a_geopackage_keeps_its_other_layers(self):
        self.add_mesh()
        path = os.path.join(self.folder, "several.gpkg")
        other = QgsVectorLayer("Point?crs=" + CRS, "other", "memory")
        other.dataProvider().addAttributes([QgsField("a", QMetaType.Type.Int)])
        other.updateFields()
        ft = QgsFeature(other.fields())
        ft.setGeometry(QgsGeometry.fromWkt("Point(1 1)"))
        other.dataProvider().addFeatures([ft])
        self.assertEqual(self.dock.write_vector_file(other, path, "other"), f"{path}|layername=other")

        txt = os.path.join(self.folder, "culv.txt")
        with open(txt, "w") as f:
            f.write("c\n0.2 1\nN1\tN2\n1\t3\n")
        crs = QgsCoordinateReferenceSystem(CRS)
        layer = self.dock.import_culvert_file(txt, TestImport.items_of(txt), path, crs)
        self.assertEqual(layer.featureCount(), 1)

        container = QgsVectorLayer(path, "x", "ogr")
        sub = container.dataProvider().subLayers()
        names = sorted(s.split(QgsDataProvider.SUBLAYER_SEPARATOR)[1] for s in sub)
        self.assertEqual(names, ["other", "several"])


class TestMeshDataset(CulvertManagerTestCase):
    def test_only_scalar_datasets_on_nodes_are_used_for_z(self):
        from qgis.core import QgsMeshDatasetGroupMetadata as Metadata
        from qgis.PyQt.QtCore import QDateTime

        from mesh_tools.libs.MeshUtils import MeshUtils

        def metadata(scalar, data_type):
            return Metadata("bottom", "", scalar, data_type, 0.0, 1.0, 3, QDateTime(), False, {})

        self.assertTrue(MeshUtils.isScalarOnVertices(metadata(True, Metadata.DataType.DataOnVertices)))
        self.assertFalse(MeshUtils.isScalarOnVertices(metadata(True, Metadata.DataType.DataOnFaces)))
        self.assertFalse(MeshUtils.isScalarOnVertices(metadata(False, Metadata.DataType.DataOnVertices)))

    def test_bottom_dataset_names(self):
        from mesh_tools.libs.culvert_manager import is_bottom_dataset

        for name in ("BOTTOM", "Fond", "bottom", "Bed Elevation"):
            self.assertTrue(is_bottom_dataset(name), name)
        self.assertFalse(is_bottom_dataset("VELOCITY U"))
        self.add_mesh()
        self.assertEqual(self.dock.cb_dataset_mesh.currentText(), "Bed Elevation")


class TestCulvertOption(CulvertManagerTestCase):
    def test_option_stored_in_the_layer_and_greys_widgets(self):
        self.add_mesh()
        a = self.add_culvert_layer(os.path.join(self.folder, "a.shp"))
        b = self.add_culvert_layer(os.path.join(self.folder, "b.shp"))
        for layer in (a, b):
            self.add_culvert(layer, CIRC=0)
        self.assertEqual(self.dock.cb_culv_option.currentIndex(), 0)
        self.dock.cb_culv_option.setCurrentIndex(1)
        self.assertEqual(self.dock.culvert_option(b), 2)
        self.assertEqual(self.dock.culvert_option(a), 1)

        b.selectAll()
        self.assertTrue(self.dock.sb_fric.isEnabled())
        self.assertFalse(self.dock.sb_l12.isEnabled())
        self.dock.cb_lay_culv.setCurrentIndex(self.dock.cb_lay_culv.findData(a.id(), 32))
        self.assertEqual(self.dock.cb_culv_option.currentIndex(), 0)
        a.selectAll()
        self.assertFalse(self.dock.sb_fric.isEnabled())
        self.assertTrue(self.dock.sb_l12.isEnabled())
        # Uhaina: no option, its own fields
        self.dock.cb_software_select.setCurrentIndex(1)
        self.assertFalse(self.dock.cb_culv_option.isEnabled())
        self.assertTrue(self.dock.sb_l12.isEnabled())
        self.assertFalse(self.dock.sb_cv.isEnabled())

    def test_export_with_option_1_accepts_empty_option_2_fields(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer, CV=None, FRIC=None, LENGTH=None, AL=0)
        self.dock.set_culvert_option(layer, 2)
        self.assertIsNone(self.export(0))  # needed by option 2
        self.dock.set_culvert_option(layer, 1)
        lines = self.export(0)
        self.assertIsNotNone(lines)
        header, values = lines[2].split("\t"), lines[3].split("\t")
        self.assertEqual(float(values[header.index("FRIC")]), 0.0)

    def test_import_detects_the_option(self):
        self.add_mesh()
        txt = os.path.join(self.folder, "culv.txt")
        for text, expected in (("c\n0.2 1\nN1\tN2\tFRIC\n1\t3\t0.0\n", 1), ("c\n0.2 1\nN1\tN2\tFRIC\n1\t3\t0.02\n", 2)):
            with open(txt, "w") as f:
                f.write(text)
            layer = self.dock.import_culvert_file(txt, TestImport.items_of(txt), "", QgsCoordinateReferenceSystem(CRS))
            self.assertEqual(self.dock.culvert_option(layer), expected)
            self.assertEqual(self.dock.cb_culv_option.currentIndex() + 1, expected)


class TestResetValues(CulvertManagerTestCase):
    def test_reset_writes_once(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer, CE1=0.9, CS1=0.3, AZ=1)
        layer.selectAll()
        commits = []
        layer.afterCommitChanges.connect(lambda: commits.append(1))
        self.dock.btn_res_val.click()
        self.assertEqual(len(commits), 1)
        ft = next(layer.getFeatures())
        self.assertEqual((ft["CE1"], ft["CS1"], ft["AZ"]), (0.5, 1.0, 0))
        self.assertTrue(self.dock.sb_z1.isEnabled())


class TestImportDialog(CulvertManagerTestCase):
    def test_space_separated_official_file_is_mapped(self):
        from mesh_tools.libs.import_culvert_file_dlg import dlg_import_culvert_file

        dlg = dlg_import_culvert_file([f[0] for f in self.dock.culv_flds], QgsCoordinateReferenceSystem(CRS), self.dock)
        dlg.text_file.setFilePath(SIPHON)
        dlg.parseTextFile()
        self.assertEqual(dlg.items["n1"][1], "I1")
        self.assertEqual(dlg.items["larg"][1], "LRG")
        self.assertEqual(dlg.items["l12"][1], "LBUS")
        self.assertEqual(dlg.items["d1"][1], "D1")
        # a file without any known column resets the mapping
        dlg.text_file.setFilePath("")
        dlg.parseTextFile()
        self.assertEqual(dlg.items["n1"][1], "")


if __name__ == "__main__":
    unittest.main()
