# -*- coding: utf-8 -*-

import unittest

from .utilities import load_plugin  # isort: skip

from qgis.core import QgsApplication, QgsExpression  # noqa: E402


class TestPlugin(unittest.TestCase):
    def test_load_run_unload(self):
        # Another test module may have registered the provider already
        registry = QgsApplication.processingRegistry()
        previous = registry.providerById("meshtools")
        if previous is not None:
            registry.removeProvider(previous)
        plugin = load_plugin()
        self.assertIsNotNone(QgsApplication.processingRegistry().providerById("meshtools"))
        self.assertTrue(QgsExpression.isFunctionName("mesh_vertex_index"))
        for tool in (1, 2, 3, 4):
            plugin.run(tool)
            self.assertIsNotNone(plugin.dockwidget)
        plugin.unload()
        self.assertIsNone(QgsApplication.processingRegistry().providerById("meshtools"))
        self.assertFalse(QgsExpression.isFunctionName("mesh_vertex_index"))


if __name__ == "__main__":
    unittest.main()
