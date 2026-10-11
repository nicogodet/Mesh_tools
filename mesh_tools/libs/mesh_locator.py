# -*- coding: utf-8 -*-

"""Find the mesh node nearest to a point, working in the CRS of the mesh only."""

from typing import Optional, Tuple

from qgis.core import QgsGeometry, QgsMesh, QgsMeshSpatialIndex, QgsPointXY, QgsRectangle
from qgis.PyQt.QtCore import QCoreApplication


class MeshNodeLocator:
    """Node numbers are the TELEMAC ones: index in the native mesh + 1.

    Only the faces are indexed (QgsMeshSpatialIndex is not usable on vertices): the nearest node is searched
    among the faces around the point, which gives the same result as a search on all the vertices.
    """

    def __init__(self, native_mesh: QgsMesh):
        self.mesh = native_mesh
        self.index = QgsMeshSpatialIndex(native_mesh, None, QgsMesh.ElementType.Face)

    def faces_at(self, point: QgsPointXY) -> list:
        geom_point = QgsGeometry.fromPointXY(point)
        faces = []
        for face_id in self.index.intersects(QgsRectangle(point, point)):
            polygon = [QgsPointXY(self.mesh.vertex(v)) for v in self.mesh.face(face_id)]
            if geom_point.intersects(QgsGeometry.fromPolygonXY([polygon])):
                faces.append(face_id)
        return faces

    def nearest_node(self, point: QgsPointXY) -> Tuple[Optional[int], Optional[str]]:
        """(node number, None) or (None, error message). The point is in the CRS of the mesh."""
        faces = self.faces_at(point)
        if not faces:
            return None, self.tr("The point is not within the mesh.")

        best, best_dist = None, None
        for face_id in faces:
            for vertex_id in self.mesh.face(face_id):
                dist = point.sqrDist(QgsPointXY(self.mesh.vertex(vertex_id)))
                if best_dist is None or dist < best_dist:
                    best, best_dist = vertex_id, dist

        # The nearest node is within the distance found above: it belongs to one of the faces of this box
        radius = best_dist**0.5
        box = QgsRectangle(point.x() - radius, point.y() - radius, point.x() + radius, point.y() + radius)
        for face_id in self.index.intersects(box):
            for vertex_id in self.mesh.face(face_id):
                dist = point.sqrDist(QgsPointXY(self.mesh.vertex(vertex_id)))
                if dist < best_dist:
                    best, best_dist = vertex_id, dist

        return best + 1, None

    @staticmethod
    def tr(message):
        return QCoreApplication.translate("MeshNodeLocator", message)
