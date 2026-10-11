# -*- coding: utf-8 -*-

"""Helpers for tests running outside of a QGIS interface (the plugin docks need qgis.utils.iface)."""

import os
import tempfile

import qgis.utils

from qgis.core import QgsCoordinateReferenceSystem, QgsProject
from qgis.testing import start_app

start_app()

if qgis.utils.iface is None:
    from qgis.testing.mocked import get_iface

    qgis.utils.iface = get_iface()

# 2 triangles on a square, nodes 1 to 4, bottom elevation 10 to 13
MESH_2DM = """MESH2D
ND 1 0.0 0.0 10.0
ND 2 100.0 0.0 11.0
ND 3 100.0 100.0 12.0
ND 4 0.0 100.0 13.0
E3T 1 1 2 3 1
E3T 2 1 3 4 1
"""


def write_mesh(folder):
    path = os.path.join(folder, "mesh.2dm")
    with open(path, "w") as mesh_file:
        mesh_file.write(MESH_2DM)
    return path


def make_temp_folder(testcase):
    folder = tempfile.TemporaryDirectory()
    testcase.addCleanup(folder.cleanup)
    return folder.name


def set_canvas_crs(authid):
    crs = QgsCoordinateReferenceSystem(authid)
    qgis.utils.iface.mapCanvas().setDestinationCrs(crs)
    QgsProject.instance().setCrs(crs)


def load_plugin():
    """Load the whole plugin as QGIS does (classFactory + initGui), with the menus and settings it expects.

    The mocked iface of qgis.testing has neither menus nor a user locale.
    """
    from qgis.PyQt.QtCore import QSettings
    from qgis.PyQt.QtWidgets import QMainWindow

    import mesh_tools

    if not QSettings().value("locale/userLocale"):
        QSettings().setValue("locale/userLocale", "en_US")
    window = QMainWindow()
    window.menuBar().addMenu("Mesh").setObjectName("mMeshMenu")
    qgis.utils.iface.mainWindow = lambda: window
    plugin = mesh_tools.classFactory(qgis.utils.iface)
    plugin.initGui()
    plugin._test_window = window
    return plugin
