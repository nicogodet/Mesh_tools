# -*- coding: utf-8 -*-

from qgis.testing import start_app, unittest

from mesh_tools.libs.culvert_manager import CulvertManager
from mesh_tools.libs.mesh_quality import MeshQuality
from mesh_tools.libs.source_manager import SourceManager
from mesh_tools.mesh_tools_dockwidget import MeshToolsDockWidget

start_app()


class DialogsTest(unittest.TestCase):
    def test_culvert_manager_dialog(self):
        dlg = CulvertManager()
        dlg.show()

# ############################################################################
# ####### Stand-alone run ########
# ################################
if __name__ == "__main__":
    unittest.main()
