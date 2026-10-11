# -*- coding: utf-8 -*-

import os
import random
import unittest

from .utilities import make_temp_folder, set_canvas_crs, write_mesh  # isort: skip

import qgis.utils  # noqa: E402

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

from mesh_tools.libs import culvert_core  # noqa: E402
from mesh_tools.libs.culvert_fields import FIELDS  # noqa: E402
from mesh_tools.libs.culvert_io import field_for_header, read_header  # noqa: E402
from mesh_tools.libs.culvert_manager import CulvertManager  # noqa: E402
from mesh_tools.libs.mesh_locator import MeshNodeLocator  # noqa: E402
from mesh_tools.libs.MeshUtils import MeshUtils  # noqa: E402

CRS = "EPSG:2154"
SIPHON = os.path.join(os.path.dirname(__file__), "data", "fo1_siphon.txt")


def is_null(value):
    return value is None or str(value) in ("NULL", "None")


def items_of(path):
    """Column mapping as given by the import dialog."""
    items = {f.name.lower(): [f.name, ""] for f in FIELDS}
    for header in read_header(path):
        name = field_for_header(header)
        if name:
            items[name.lower()][1] = header
    return items


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

    def add_mesh(self, crs=None, name="mesh"):
        mesh = QgsMeshLayer(write_mesh(self.folder), name, "mdal")
        self.assertTrue(mesh.isValid())
        mesh.setCrs(QgsCoordinateReferenceSystem(crs or self.mesh_crs))
        self.project.addMapLayer(mesh)
        return mesh

    def add_culvert_layer(self, path=None):
        path = path or os.path.join(self.folder, "culv.shp")
        return self.dock.create_new_shp(path, QgsCoordinateReferenceSystem(self.culv_crs))

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
        self.dock.cur_culv_changed()

    def export(self, software=0):
        out = os.path.join(self.folder, "out.txt")
        if os.path.exists(out):
            os.remove(out)
        save = QFileDialog.getSaveFileName
        QFileDialog.getSaveFileName = staticmethod(lambda *a, **k: (out, ""))
        self.addCleanup(setattr, QFileDialog, "getSaveFileName", save)
        self.dock.cb_software_select.setCurrentIndex(software)
        self.dock.create_file()
        if not os.path.exists(out):
            return None
        with open(out) as f:
            return f.read().splitlines()

    def memory_layer(self, geometry_type="LineString", crs=CRS):
        layer = QgsVectorLayer(f"{geometry_type}?crs={crs}", "memory culverts", "memory")
        layer.dataProvider().addAttributes(culvert_core.culvert_fields().toList())
        layer.updateFields()
        self.project.addMapLayer(layer)
        self.dock.cb_lay_culv.setCurrentIndex(self.dock.cb_lay_culv.findData(layer.id(), 256))
        return layer


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
        self.assertTrue(is_null(ft["N2"]))

    def test_linestring_layer_is_accepted(self):
        self.add_mesh()
        layer = self.memory_layer("LineString")
        self.add_culvert(layer, "LineString(10 5, 90 20)", N1=None, N2=None)
        self.dock.update_all_auto()
        ft = next(layer.getFeatures())
        self.assertEqual((ft["N1"], ft["N2"]), (1, 2))

    def test_project_crs_change_does_not_change_nodes(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer, N1=None, N2=None)
        self.dock.update_all_auto()
        set_canvas_crs("EPSG:3857")
        self.dock.update_all_auto()
        self.assertEqual([(ft["N1"], ft["N2"]) for ft in layer.getFeatures()], [(1, 2)])

    def test_culvert_crs_differs_from_mesh_crs(self):
        self.add_mesh()
        to_3942 = QgsCoordinateTransform(
            QgsCoordinateReferenceSystem(CRS), QgsCoordinateReferenceSystem("EPSG:3942"), self.project
        )
        points = [to_3942.transform(QgsPointXY(x, y)) for x, y in ((10, 5), (90, 20))]
        layer = self.memory_layer("MultiLineString", "EPSG:3942")
        self.add_culvert(layer, QgsGeometry.fromMultiPolylineXY([points]).asWkt(), N1=None, N2=None)
        self.dock.update_all_auto()
        ft = next(layer.getFeatures())
        self.assertEqual((ft["N1"], ft["N2"]), (1, 2))


class TestLocator(unittest.TestCase):
    def locator(self, quads):
        folder = make_temp_folder(self)
        path = os.path.join(folder, "grid.2dm")
        self.nx, self.ny = grid_mesh(path, quads=quads)
        layer = QgsMeshLayer(path, "grid", "mdal")
        native = QgsMesh()
        layer.dataProvider().populateMesh(native)
        return MeshNodeLocator(native)

    def check_random_points(self, quads):
        locator = self.locator(quads)
        rng = random.Random(1)
        for _ in range(300):
            x, y = rng.uniform(0, (self.nx - 1) * 10), rng.uniform(0, (self.ny - 1) * 10)
            node, err = locator.nearest_node(QgsPointXY(x, y))
            self.assertIsNone(err)
            best = min((x - i % self.nx * 10.0) ** 2 + (y - i // self.nx * 10.0) ** 2 for i in range(self.nx * self.ny))
            got = (x - (node - 1) % self.nx * 10.0) ** 2 + (y - (node - 1) // self.nx * 10.0) ** 2
            # Ties (points on a bisector) may give another node at the same distance
            self.assertAlmostEqual(got, best, places=6)

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
    def setup_layers(self, **values):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer, **values)
        return layer

    def test_telemac_columns_and_haut2(self):
        self.setup_layers()
        lines = self.export(0)
        header, values = lines[2].split("\t"), lines[3].split("\t")
        self.assertEqual(len(header), len(values))
        self.assertEqual(values[header.index("HAUT2")], "1.2")
        self.assertAlmostEqual(float(values[header.index("LENGTH")]), (80**2 + 15**2) ** 0.5)

    def test_uhaina(self):
        self.setup_layers()
        lines = self.export(1)
        header, values = lines[2].split("\t"), lines[3].split("\t")
        self.assertEqual(len(header), len(values))
        self.assertEqual(float(values[header.index("X1")]), 10.0)
        self.assertEqual(float(values[header.index("Y2")]), 20.0)

    def test_export_recomputes_automatic_values_without_touching_the_layer(self):
        layer = self.setup_layers(N1=999, N2=998, Z1=-5.0, Z2=-5.0, LENGTH=1.0, a1=7.0, a2=7.0, AZ=1, AL=1, AA=1)
        lines = self.export(0)
        header, values = lines[2].split("\t"), lines[3].split("\t")
        get = {name: values[header.index(name)] for name in ("N1", "N2", "Z1", "Z2", "LENGTH", "a1", "a2")}
        self.assertEqual((get["N1"], get["N2"]), ("1", "2"))
        self.assertEqual((float(get["Z1"]), float(get["Z2"])), (10.0, 11.0))
        self.assertAlmostEqual(float(get["a2"]), 10.6, places=1)
        self.assertAlmostEqual(float(get["a1"]), 190.6, places=1)
        ft = next(layer.getFeatures())
        self.assertEqual((ft["N1"], ft["N2"], ft["Z1"], ft["LENGTH"]), (999, 998, -5.0, 1.0))

    def test_manual_values_are_kept_when_automatic_is_off(self):
        self.setup_layers(Z1=3.5, Z2=4.5, LENGTH=12.5, a1=1.0, a2=2.0, AZ=0, AL=0, AA=0)
        lines = self.export(0)
        header, values = lines[2].split("\t"), lines[3].split("\t")
        for name, expected in (("Z1", 3.5), ("Z2", 4.5), ("LENGTH", 12.5), ("a1", 1.0), ("a2", 2.0)):
            self.assertEqual(float(values[header.index(name)]), expected, name)

    def test_culvert_outside_the_mesh_blocks_the_export(self):
        self.setup_layers(wkt="MultiLineString((10 5, 900 500))")
        self.assertIsNone(self.export(0))
        self.assertFalse(self.dock.lst_problems.isHidden())

    def test_verification_does_not_modify_the_layer(self):
        layer = self.setup_layers(N1=999, N2=998)
        self.dock.verif_culvert()
        ft = next(layer.getFeatures())
        self.assertEqual((ft["N1"], ft["N2"]), (999, 998))

    def test_update_button_writes_and_saves_the_automatic_values(self):
        layer = self.setup_layers(N1=999, N2=998, Z1=-5.0, Z2=-5.0, LENGTH=1.0, AZ=1, AL=1, AA=0, a1=7.0)
        changed = []
        layer.attributeValueChanged.connect(lambda *a: changed.append(a))
        self.dock.btn_update_auto.click()
        ft = next(layer.getFeatures())
        self.assertEqual((ft["N1"], ft["N2"], ft["Z1"], ft["Z2"]), (1, 2, 10.0, 11.0))
        self.assertAlmostEqual(ft["LENGTH"], (80**2 + 15**2) ** 0.5)
        self.assertEqual(ft["a1"], 7.0)
        self.assertTrue(changed)
        self.assertFalse(layer.isEditable())
        reopened = QgsVectorLayer(layer.source(), "x", "ogr")
        self.assertEqual(next(reopened.getFeatures())["N1"], 1)

    def test_update_does_not_commit_user_edits(self):
        layer = self.setup_layers()
        layer.startEditing()
        fid = next(layer.getFeatures()).id()
        layer.changeAttributeValue(fid, layer.fields().lookupField("CE1"), 0.9)
        self.dock.update_all_auto()
        self.assertTrue(layer.isEditable())
        self.assertEqual(layer.editBuffer().changedAttributeValues()[fid][layer.fields().lookupField("CE1")], 0.9)
        layer.rollBack()


class TestExportCrs(CulvertManagerTestCase):
    canvas_crs = "EPSG:4326"

    def test_uhaina_when_canvas_crs_differs(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer)
        lines = self.export(1)
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

    def test_switching_culvert_layers_does_not_multiply_connections(self):
        self.add_mesh()
        a = self.add_culvert_layer(os.path.join(self.folder, "a.shp"))
        self.add_culvert(a)
        self.add_culvert(self.add_culvert_layer(os.path.join(self.folder, "b.shp")))
        for name in ("a", "b", "a", "b", "a"):
            self.dock.cb_lay_culv.setCurrentIndex(self.dock.cb_lay_culv.findText(name))
        calls = []
        real = CulvertManager.culvert_summary
        CulvertManager.culvert_summary = lambda s, f: calls.append(1) or ""
        self.addCleanup(setattr, CulvertManager, "culvert_summary", real)
        a.selectAll()
        self.assertEqual(len(calls), 1)

    def test_removing_the_culvert_layer(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.project.removeMapLayer(layer.id())
        self.assertIsNone(self.dock.lay_culv)


class TestImport(CulvertManagerTestCase):
    def import_text(self, text, layer_path="", layer_crs=CRS):
        self.add_mesh()
        path = os.path.join(self.folder, "culv.txt")
        with open(path, "w") as f:
            f.write(text)
        return self.dock.import_culvert_file(path, items_of(path), layer_path, QgsCoordinateReferenceSystem(layer_crs))

    def test_official_siphon_file(self):
        mesh_path = os.path.join(self.folder, "siphon.2dm")
        grid_mesh(mesh_path, 30, 24)
        mesh = QgsMeshLayer(mesh_path, "siphon", "mdal")
        mesh.setCrs(QgsCoordinateReferenceSystem(CRS))
        self.project.addMapLayer(mesh)
        layer = self.dock.import_culvert_file(SIPHON, items_of(SIPHON), "", QgsCoordinateReferenceSystem(CRS))
        ft = next(layer.getFeatures())
        self.assertEqual((ft["N1"], ft["N2"]), (198, 661))
        self.assertAlmostEqual(ft["LARG"], 2.523)
        self.assertEqual(ft["CIRC"], 1)
        self.assertAlmostEqual(self.dock.sb_relax.value(), 0.2)
        self.assertAlmostEqual(culvert_core.culvert_relaxation(layer), 0.2)

    def test_trailing_blank_line_and_rejected_rows(self):
        layer = self.import_text("c\n0.2 3\nN1\tN2\tCE1\tNAME\n1\t3\t0.5\ta\n2\t99\t0.5\tb\n1\t2\tx\tc\n\n")
        self.assertEqual(layer.featureCount(), 1)
        self.assertEqual(next(layer.getFeatures())["NAME"], "a")

    def test_memory_layer_geometry_is_multilinestring(self):
        layer = self.import_text("c\n0.2 1\nN1\tN2\n1\t3\n")
        self.assertTrue(next(layer.getFeatures()).geometry().isMultipart())
        self.dock.update_all_auto()

    def test_negative_and_decimal_values(self):
        layer = self.import_text("c\n0.2 1\nN1\tN2\tCE1\tz1\n1\t3\t-0.5\t1e-1\n")
        ft = next(layer.getFeatures())
        self.assertAlmostEqual(ft["CE1"], -0.5)
        self.assertAlmostEqual(ft["Z1"], 0.1)

    def test_written_layer_has_the_chosen_crs(self):
        path = os.path.join(self.folder, "imported.shp")
        layer = self.import_text("c\n0.2 1\nN1\tN2\n1\t3\n", layer_path=path, layer_crs="EPSG:3857")
        self.assertEqual(layer.crs().authid(), "EPSG:3857")
        self.assertEqual(QgsVectorLayer(path, "x", "ogr").crs().authid(), "EPSG:3857")

    def test_uhaina_roundtrip(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer, "MultiLineString((12 3, 88 21))", NAME="u 1", CE1=0.7, CIRC=0)
        lines = self.export(1)
        txt = os.path.join(self.folder, "uhaina.txt")
        with open(txt, "w") as f:
            f.write("\n".join(lines) + "\n")
        to_3942 = QgsCoordinateTransform(
            QgsCoordinateReferenceSystem(CRS), QgsCoordinateReferenceSystem("EPSG:3942"), self.project
        )
        imported = self.dock.import_culvert_file(txt, items_of(txt), "", QgsCoordinateReferenceSystem("EPSG:3942"))
        self.assertEqual(self.dock.cb_software_select.currentIndex(), 1)
        ft = next(imported.getFeatures())
        vertices = [QgsPointXY(v) for v in ft.geometry().vertices()]
        for got, (x, y) in zip((vertices[0], vertices[-1]), ((12, 3), (88, 21))):
            expected = to_3942.transform(QgsPointXY(x, y))
            self.assertAlmostEqual(got.x(), expected.x(), places=3)
            self.assertAlmostEqual(got.y(), expected.y(), places=3)
        self.assertEqual((ft["N1"], ft["N2"], ft["NAME"], ft["CE1"], ft["CIRC"]), (1, 2, "u 1", 0.7, 0))

    def test_import_detects_the_option(self):
        for text, expected in (("c\n0.2 1\nN1\tN2\tFRIC\n1\t3\t0.0\n", 1), ("c\n0.2 1\nN1\tN2\tFRIC\n1\t3\t0.02\n", 2)):
            layer = self.import_text(text)
            self.assertEqual(self.dock.culvert_option(layer), expected)
            self.assertEqual(self.dock.cb_culv_option.currentIndex() + 1, expected)

    def test_import_in_a_geopackage_keeps_its_other_layers(self):
        path = os.path.join(self.folder, "several.gpkg")
        other = QgsVectorLayer("Point?crs=" + CRS, "other", "memory")
        other.dataProvider().addAttributes([QgsField("a", QMetaType.Type.Int)])
        other.updateFields()
        self.assertEqual(self.dock.write_vector_file(other, path, "other"), f"{path}|layername=other")
        self.import_text("c\n0.2 1\nN1\tN2\n1\t3\n", layer_path=path)
        container = QgsVectorLayer(path, "x", "ogr")
        names = sorted(s.split(QgsDataProvider.SUBLAYER_SEPARATOR)[1] for s in container.dataProvider().subLayers())
        self.assertEqual(names, ["other", "several"])


class TestFormats(CulvertManagerTestCase):
    """The same actions on a shapefile and on a GeoPackage."""

    def each_format(self):
        for extension in ("shp", "gpkg"):
            with self.subTest(extension):
                self.project.removeAllMapLayers()
                folder = os.path.join(self.folder, extension)
                os.makedirs(folder)
                yield extension, folder

    def test_create_update_export(self):
        for extension, folder in self.each_format():
            self.add_mesh()
            layer = self.add_culvert_layer(os.path.join(folder, f"culv.{extension}"))
            self.add_culvert(layer, N1=999, N2=998)
            self.dock.btn_update_auto.click()
            reopened = QgsVectorLayer(layer.source(), "x", "ogr")
            self.assertEqual(next(reopened.getFeatures())["N2"], 2)
            lines = self.export(0)
            self.assertEqual(len(lines[2].split("\t")), len(lines[3].split("\t")))

    def test_style_and_settings_are_stored_with_the_data(self):
        for extension, folder in self.each_format():
            mesh = self.add_mesh()
            layer = self.add_culvert_layer(os.path.join(folder, f"culv.{extension}"))
            self.dock.cb_culv_option.setCurrentIndex(1)
            self.dock.sb_relax.setValue(0.35)
            # opened again outside of the project: the default style brings the settings back
            reopened = QgsVectorLayer(layer.source(), "x", "ogr")
            self.assertEqual(reopened.renderer().type(), "RuleRenderer")
            self.assertEqual(culvert_core.culvert_option(reopened), 2)
            self.assertAlmostEqual(culvert_core.culvert_relaxation(reopened), 0.35)
            self.assertEqual(culvert_core.layer_setting(reopened, culvert_core.MESH_VARIABLE), mesh.id())
            self.assertEqual(culvert_core.layer_setting(reopened, culvert_core.BOTTOM_VARIABLE), "Bed Elevation")


class TestPanel(CulvertManagerTestCase):
    def test_narrow_and_short_dock(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer)
        layer.selectAll()
        self.assertLessEqual(self.dock.scroll_contents.minimumSizeHint().width(), 360)
        self.assertLessEqual(self.dock.scroll_contents.minimumSizeHint().height(), 600)

    def test_status_tells_what_to_do(self):
        self.assertIn("mesh", self.dock.lbl_status.text())
        self.add_mesh()
        self.assertIn("culvert layer", self.dock.lbl_status.text())
        layer = self.add_culvert_layer()
        self.add_culvert(layer)
        self.add_culvert(layer, NAME="c2", HAUT=0.0)
        self.assertIn("Select a culvert", self.dock.lbl_status.text())
        layer.selectAll()
        self.assertIn("2 culverts", self.dock.lbl_status.text())
        bad = [f.id() for f in layer.getFeatures() if f["NAME"] == "c2"]
        layer.selectByIds(bad)
        self.assertTrue(self.dock.lbl_status.isHidden())
        self.assertTrue(self.dock.gb_cur_culv.isEnabled())
        # nodes computed now from the mesh, not the stored ones (1, 3)
        self.assertIn("1 → 2", self.dock.lbl_selected.text())
        self.assertIn("HAUT", self.dock.lbl_selected.text())

    def test_edit_button_opens_the_native_form(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer)
        layer.selectAll()
        opened = []
        iface = qgis.utils.iface
        real = iface.openFeatureForm
        iface.openFeatureForm = lambda lay, feature, *a: opened.append((lay, feature.id()))
        self.addCleanup(setattr, iface, "openFeatureForm", real)
        self.dock.btn_edit_culv.click()
        self.assertEqual(opened, [(layer, layer.selectedFeatureIds()[0])])
        self.assertTrue(layer.isEditable())
        layer.rollBack()

    def test_problems_list_selects_the_culvert(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer, NAME="good")
        self.add_culvert(layer, NAME="bad", HAUT=0.0)
        self.dock.verif_culvert()
        self.assertEqual(self.dock.lst_problems.count(), 1)
        item = self.dock.lst_problems.item(0)
        self.assertTrue(item.text().startswith("bad"))
        self.dock.lst_problems.itemClicked.emit(item)
        self.assertEqual([ft["NAME"] for ft in layer.getSelectedFeatures()], ["bad"])

    def test_settings_follow_the_culvert_layer(self):
        mesh_a = self.add_mesh(name="mesh a")
        a = self.add_culvert_layer(os.path.join(self.folder, "a.shp"))
        self.dock.sb_relax.setValue(0.35)
        self.dock.cb_culv_option.setCurrentIndex(1)
        mesh_b = self.add_mesh(name="mesh b")
        b = self.add_culvert_layer(os.path.join(self.folder, "b.shp"))
        # changing the mesh binds it to the current culvert layer
        self.dock.cb_lay_mesh.setLayer(mesh_b)
        self.dock.sb_relax.setValue(0.6)
        self.dock.cb_lay_culv.setCurrentIndex(self.dock.cb_lay_culv.findData(a.id(), 256))
        self.assertAlmostEqual(self.dock.sb_relax.value(), 0.35)
        self.assertEqual(self.dock.cb_culv_option.currentIndex(), 1)
        self.assertEqual(self.dock.lay_mesh.id(), mesh_a.id())
        self.dock.cb_lay_culv.setCurrentIndex(self.dock.cb_lay_culv.findData(b.id(), 256))
        self.assertAlmostEqual(self.dock.sb_relax.value(), 0.6)
        self.assertEqual(self.dock.cb_culv_option.currentIndex(), 0)
        self.assertEqual(self.dock.lay_mesh.id(), mesh_b.id())

    def test_uhaina_hides_the_telemac_settings(self):
        self.dock.cb_software_select.setCurrentIndex(1)
        self.assertTrue(self.dock.cb_culv_option.isHidden())
        self.assertTrue(self.dock.sb_relax.isHidden())


class TestCulvertOption(CulvertManagerTestCase):
    def test_export_with_option_1_accepts_empty_option_2_fields(self):
        self.add_mesh()
        layer = self.add_culvert_layer()
        self.add_culvert(layer, CV=None, FRIC=None, LENGTH=None, AL=0)
        self.dock.set_culvert_option(layer, 2)
        self.assertIsNone(self.export(0))  # needed by option 2
        self.dock.set_culvert_option(layer, 1)
        lines = self.export(0)
        header, values = lines[2].split("\t"), lines[3].split("\t")
        self.assertEqual(float(values[header.index("FRIC")]), 0.0)


class TestMeshDataset(CulvertManagerTestCase):
    def test_only_scalar_datasets_on_nodes_are_used_for_z(self):
        from qgis.core import QgsMeshDatasetGroupMetadata as Metadata
        from qgis.PyQt.QtCore import QDateTime

        def metadata(scalar, data_type):
            return Metadata("bottom", "", scalar, data_type, 0.0, 1.0, 3, QDateTime(), False, {})

        self.assertTrue(MeshUtils.isScalarOnVertices(metadata(True, Metadata.DataType.DataOnVertices)))
        self.assertFalse(MeshUtils.isScalarOnVertices(metadata(True, Metadata.DataType.DataOnFaces)))
        self.assertFalse(MeshUtils.isScalarOnVertices(metadata(False, Metadata.DataType.DataOnVertices)))

    def test_bottom_dataset_names(self):
        for name in ("BOTTOM", "Fond", "bottom", "Bed Elevation"):
            self.assertTrue(culvert_core.is_bottom_dataset(name), name)
        self.assertFalse(culvert_core.is_bottom_dataset("VELOCITY U"))
        self.add_mesh()
        self.assertEqual(self.dock.cb_dataset_mesh.currentText(), "Bed Elevation")


class TestImportDialog(CulvertManagerTestCase):
    def test_space_separated_official_file_is_mapped(self):
        from mesh_tools.libs.import_culvert_file_dlg import dlg_import_culvert_file

        dlg = dlg_import_culvert_file([f.name for f in FIELDS], QgsCoordinateReferenceSystem(CRS), self.dock)
        dlg.text_file.setFilePath(SIPHON)
        dlg.parseTextFile()
        self.assertEqual(dlg.items["n1"][1], "I1")
        self.assertEqual(dlg.items["larg"][1], "LRG")
        self.assertEqual(dlg.items["l12"][1], "LBUS")
        self.assertEqual(dlg.items["d1"][1], "D1")
        dlg.text_file.setFilePath("")
        dlg.parseTextFile()
        self.assertEqual(dlg.items["n1"][1], "")


if __name__ == "__main__":
    unittest.main()
