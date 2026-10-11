# -*- coding: utf-8 -*-

import os
import re
import unittest

from .utilities import make_temp_folder, set_canvas_crs  # isort: skip

from qgis import processing  # noqa: E402

from processing.core.Processing import Processing  # noqa: E402
from qgis.core import (  # noqa: E402
    QgsApplication,
    QgsCoordinateReferenceSystem,
    QgsFeature,
    QgsGeometry,
    QgsMeshLayer,
    QgsProcessingContext,
    QgsProcessingException,
    QgsProcessingFeedback,
    QgsProject,
)

from mesh_tools.libs import culvert_core  # noqa: E402
from mesh_tools.libs.culvert_processing import MeshToolsProvider  # noqa: E402

CRS = "EPSG:2154"
SIPHON = os.path.join(os.path.dirname(__file__), "data", "fo1_siphon.txt")

Processing.initialize()
# Keep a reference: the registry does not own Python providers
PROVIDER = QgsApplication.processingRegistry().providerById("meshtools")
if PROVIDER is None:
    PROVIDER = MeshToolsProvider()
    QgsApplication.processingRegistry().addProvider(PROVIDER)


def grid_mesh(path, nx=30, ny=24):
    with open(path, "w") as f:
        f.write("MESH2D\n")
        for n in range(nx * ny):
            f.write(f"ND {n + 1} {n % nx * 10.0} {n // nx * 10.0} {n * 0.01:.2f}\n")
        e = 1
        for j in range(ny - 1):
            for i in range(nx - 1):
                a = j * nx + i + 1
                f.write(f"E3T {e} {a} {a + 1} {a + nx} 1\n")
                f.write(f"E3T {e + 1} {a + 1} {a + nx + 1} {a + nx} 1\n")
                e += 2


class TestCulvertProcessing(unittest.TestCase):
    def setUp(self):
        self.project = QgsProject.instance()
        self.project.removeAllMapLayers()
        set_canvas_crs(CRS)
        self.folder = make_temp_folder(self)
        path = os.path.join(self.folder, "grid.2dm")
        grid_mesh(path)
        self.mesh = QgsMeshLayer(path, "grid", "mdal")
        self.mesh.setCrs(QgsCoordinateReferenceSystem(CRS))
        self.project.addMapLayer(self.mesh)
        self.context = QgsProcessingContext()
        self.context.setProject(self.project)
        self.feedback = QgsProcessingFeedback()

    def tearDown(self):
        # Layers held by the processing context must go before the application, or Python crashes at exit
        self.project.removeAllMapLayers()
        del self.context

    def run_alg(self, name, **parameters):
        return processing.run(f"meshtools:{name}", parameters, context=self.context, feedback=self.feedback)

    def import_siphon(self):
        out = os.path.join(self.folder, "siphon.gpkg")
        result = self.run_alg("importculvertfile", INPUT=SIPHON, MESH=self.mesh, OUTPUT=out)
        return result, self.context.getMapLayer(result["OUTPUT"]) or culvert_core.load_culvert_layer(result["OUTPUT"])

    def test_algorithms_are_registered(self):
        ids = {alg.id() for alg in QgsApplication.processingRegistry().providerById("meshtools").algorithms()}
        expected = {"importculvertfile", "checkculverts", "exportculvertfile", "renumberculvertfile"}
        self.assertEqual(ids, {f"meshtools:{name}" for name in expected})

    def renumbered_mesh(self, shift=0.0):
        """The grid mesh with the nodes numbered backwards (node n -> count + 1 - n), moved by shift."""
        nx, ny = 30, 24
        count = nx * ny
        path = os.path.join(self.folder, f"renumbered{shift}.2dm")
        with open(path, "w") as f:
            f.write("MESH2D\n")
            e = 1
            for j in range(ny - 1):
                for i in range(nx - 1):
                    a = j * nx + i + 1
                    for tri in ((a, a + 1, a + nx), (a + 1, a + nx + 1, a + nx)):
                        f.write(f"E3T {e} " + " ".join(str(count + 1 - n) for n in tri) + " 1\n")
                        e += 1
            for new in range(1, count + 1):
                old = count + 1 - new
                f.write(f"ND {new} {(old - 1) % nx * 10.0 + shift} {(old - 1) // nx * 10.0} 0.0\n")
        mesh = QgsMeshLayer(path, "renumbered", "mdal")
        mesh.setCrs(QgsCoordinateReferenceSystem(CRS))
        self.project.addMapLayer(mesh)
        return mesh, count

    def test_renumber_culvert_file(self):
        new_mesh, count = self.renumbered_mesh()
        text = (
            "Relaxation, Number of culverts\n0.2 2\n"
            "I1\tI2\tCE1\tNAME\n"
            "198\t661\t0.50\tfirst culvert\n"
            "\n"
            "1\t2\t0.25\t\n"
        )
        source = os.path.join(self.folder, "old.txt")
        with open(source, "w") as f:
            f.write(text)
        out = os.path.join(self.folder, "new.txt")
        result = self.run_alg("renumberculvertfile", INPUT=source, MESH=self.mesh, NEW_MESH=new_mesh, OUTPUT=out)
        self.assertEqual((result["CHANGED"], result["WARNINGS"]), (2, 0))
        with open(out) as f:
            written = f.read()
        expected = text.replace("198\t661", f"{count + 1 - 198}\t{count + 1 - 661}").replace(
            "1\t2\t0.25", f"{count}\t{count - 1}\t0.25"
        )
        self.assertEqual(written, expected)

    def test_renumber_space_separated_file_and_moved_mesh(self):
        # shifted to the left: the border nodes of the file (x = 0) stay within the new mesh
        new_mesh, count = self.renumbered_mesh(shift=-2.0)
        out = os.path.join(self.folder, "new.txt")
        result = self.run_alg("renumberculvertfile", INPUT=SIPHON, MESH=self.mesh, NEW_MESH=new_mesh, OUTPUT=out)
        self.assertEqual(result["WARNINGS"], 2)
        with open(SIPHON) as f:
            original = f.read().splitlines()
        with open(out) as f:
            written = f.read().splitlines()
        self.assertEqual(written[:3], original[:3])
        self.assertEqual(written[3].split()[2:], original[3].split()[2:])
        self.assertEqual(written[3].split()[:2], [str(count + 1 - 198), str(count + 1 - 661)])
        # separators kept as written
        self.assertEqual(re.findall(r"\s+", written[3]), re.findall(r"\s+", original[3]))

    def test_renumber_refuses_uhaina_files(self):
        path = os.path.join(self.folder, "uhaina.txt")
        with open(path, "w") as f:
            f.write("Culvert count\n1\nX1\tY1\tZ1\tX2\tY2\tZ2\n0\t0\t1\t10\t0\t1\n")
        with self.assertRaises(QgsProcessingException):
            self.run_alg("renumberculvertfile", INPUT=path, MESH=self.mesh, NEW_MESH=self.mesh, OUTPUT=path + ".out")

    def test_import_check_export(self):
        result, layer = self.import_siphon()
        self.assertEqual((result["IMPORTED"], result["REJECTED"], result["OPTION"]), (1, 0, 1))
        self.assertAlmostEqual(result["RELAXATION"], 0.2)
        ft = next(layer.getFeatures())
        self.assertEqual((ft["I1"], ft["I2"]), (198, 661))

        check = self.run_alg("checkculverts", INPUT=layer, MESH=self.mesh, SOFTWARE=0, OPTION=1)
        self.assertEqual(check["PROBLEMS"], 0)

        out = os.path.join(self.folder, "culverts.txt")
        self.run_alg("exportculvertfile", INPUT=layer, MESH=self.mesh, SOFTWARE=0, OPTION=1, RELAXATION=0.3, OUTPUT=out)
        with open(out) as f:
            lines = f.read().splitlines()
        self.assertEqual(lines[1], "0.3\t1")
        header, values = lines[2].split("\t"), lines[3].split("\t")
        self.assertEqual((values[header.index("I1")], values[header.index("I2")]), ("198", "661"))

    def test_problems_are_reported_and_export_refused(self):
        layer = culvert_core.memory_culvert_layer(QgsCoordinateReferenceSystem(CRS))
        feature = QgsFeature(layer.fields())
        feature["NAME"] = "bad"
        feature["HAUT1"] = 0.0
        feature.setGeometry(QgsGeometry.fromWkt("MultiLineString((10 5, 900 500))"))
        layer.dataProvider().addFeatures([feature])
        self.project.addMapLayer(layer)
        out = os.path.join(self.folder, "bad.gpkg")
        check = self.run_alg("checkculverts", INPUT=layer, MESH=self.mesh, OUTPUT=out)
        self.assertGreater(check["PROBLEMS"], 1)
        problems = culvert_core.QgsVectorLayer(check["OUTPUT"], "p", "ogr")
        self.assertEqual({f["culvert"] for f in problems.getFeatures()}, {"bad"})
        del problems
        with self.assertRaises(QgsProcessingException):
            self.run_alg("exportculvertfile", INPUT=layer, MESH=self.mesh, OUTPUT=os.path.join(self.folder, "x.txt"))

    def test_settings_come_from_the_culvert_layer(self):
        _, layer = self.import_siphon()
        culvert_core.set_layer_settings(layer, persist=False, option=2, relaxation=0.45)
        out = os.path.join(self.folder, "culverts.txt")
        # option 2: FRIC, LENGTH... are needed; the siphon file has 0, so it is valid
        self.run_alg("exportculvertfile", INPUT=layer, MESH=self.mesh, OUTPUT=out)
        with open(out) as f:
            self.assertEqual(f.read().splitlines()[1], "0.45\t1")


if __name__ == "__main__":
    unittest.main()
