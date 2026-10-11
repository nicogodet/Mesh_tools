# -*- coding: utf-8 -*-

from . import utilities  # noqa: F401 (QGIS application and iface for the docks)  # isort: skip

from qgis.testing import start_app, unittest  # noqa: E402

from mesh_tools.libs.culvert_manager import CulvertManager  # noqa: E402
from mesh_tools.libs.mesh_quality import MeshQuality  # noqa: E402
from mesh_tools.libs.mesh_translation_dlg import MeshTranslation  # noqa: E402
from mesh_tools.libs.source_manager import SourceManager  # noqa: E402

start_app()


class DialogsTest(unittest.TestCase):
    def test_culvert_manager_dialog(self):
        dlg = CulvertManager()
        dlg.show()

    def test_source_manager_dialog(self):
        dlg = SourceManager()
        dlg.show()

    def test_meshquality_dialog(self):
        dlg = MeshQuality()
        dlg.show()

    def test_mesh_translation_dialog(self):
        dlg = MeshTranslation()
        dlg.show()


# ############################################################################
# ####### Stand-alone run ########
# ################################
if __name__ == "__main__":
    unittest.main()
