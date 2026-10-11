# -*- coding: utf-8 -*-

"""Expression functions to query a mesh from any layer (group "Mesh Tools"), registered while the plugin is loaded.

QGIS has no expression function reading a mesh layer from a vector layer. The culvert layer style uses these ones in
its default values (nodes, automatic elevations), wrapped in eval() so that a project opened without the plugin keeps
the stored values instead of failing.
"""

from qgis.core import QgsCoordinateReferenceSystem, QgsCsException, QgsExpression, QgsGeometry, QgsPointXY
from qgis.utils import qgsfunction

from .culvert_core import mesh_context, mesh_layer

GROUP = "Mesh Tools"


def _point_in_mesh_crs(geometry, context, mesh):
    """First vertex of the geometry (CRS of the layer of the expression context) in the mesh CRS."""
    if not isinstance(geometry, QgsGeometry) or geometry.isNull() or geometry.isEmpty():
        return None
    point = QgsPointXY(geometry.vertexAt(0))
    crs = QgsCoordinateReferenceSystem(context.variable("layer_crs") or "") if context else None
    if crs is not None and crs.isValid() and mesh.crs().isValid() and crs != mesh.crs():
        try:
            point = mesh_context(mesh).transform_from(crs).transform(point)
        except QgsCsException:
            return None
    return point


def _vertex_index(layer, geometry, context):
    mesh = mesh_layer(layer)
    if mesh is None:
        return None, None
    point = _point_in_mesh_crs(geometry, context, mesh)
    if point is None:
        return mesh, None
    node, _ = mesh_context(mesh).locator.nearest_node(point)
    return mesh, -1 if node is None else node - 1


@qgsfunction(group=GROUP, referenced_columns=[], handlesnull=True)
def mesh_vertex_index(layer, geometry, feature, parent, context):
    """
    Index of the mesh vertex nearest to a point, among the faces containing it (Mesh Tools plugin).
    <h4>Syntax</h4>
    <div class="syntax"><code><span class="functionname">mesh_vertex_index</span>(<span class="argument">layer</span>, <span class="argument">geometry</span>)</code></div>
    <h4>Arguments</h4>
    <div class="arguments"><table>
    <tr><td class="argument">layer</td><td>mesh layer, its id or its name</td></tr>
    <tr><td class="argument">geometry</td><td>point (or first vertex of the geometry), in the CRS of the current layer</td></tr>
    </table></div>
    <h4>Returns</h4>
    <div>0-based vertex index (TELEMAC node number - 1), -1 if the point is out of the mesh, NULL if the mesh layer is not found.</div>
    <h4>Example</h4>
    <div class="examples"><code>mesh_vertex_index(@culvert_mesh, start_point($geometry)) + 1</code></div>
    """
    return _vertex_index(layer, geometry, context)[1]


@qgsfunction(group=GROUP, referenced_columns=[], handlesnull=True)
def mesh_vertex_value(layer, dataset, vertex, feature, parent, context):
    """
    Value of a mesh dataset at a vertex, first timestep (Mesh Tools plugin).
    <h4>Syntax</h4>
    <div class="syntax"><code><span class="functionname">mesh_vertex_value</span>(<span class="argument">layer</span>, <span class="argument">dataset</span>, <span class="argument">vertex</span>)</code></div>
    <h4>Arguments</h4>
    <div class="arguments"><table>
    <tr><td class="argument">layer</td><td>mesh layer, its id or its name</td></tr>
    <tr><td class="argument">dataset</td><td>name or index of a scalar dataset group defined on the vertices</td></tr>
    <tr><td class="argument">vertex</td><td>0-based vertex index, or a point (nearest vertex) in the CRS of the current layer</td></tr>
    </table></div>
    <h4>Returns</h4>
    <div>The value, NULL if the vertex, the dataset or the mesh layer is not found.</div>
    <h4>Example</h4>
    <div class="examples"><code>mesh_vertex_value(@culvert_mesh, @culvert_bottom, start_point($geometry))</code></div>
    """
    mesh = mesh_layer(layer)
    if mesh is None:
        return None
    if isinstance(vertex, QgsGeometry):
        _, index = _vertex_index(mesh, vertex, context)
    else:
        try:
            index = int(vertex)
        except (TypeError, ValueError):
            return None
    if index is None or index < 0:
        return None
    mesh_ctx = mesh_context(mesh)
    group = mesh_ctx.dataset_group(dataset)
    return mesh_ctx.node_value(group, index + 1)


FUNCTIONS = (mesh_vertex_index, mesh_vertex_value)


def unregister():
    for function in FUNCTIONS:
        QgsExpression.unregisterFunction(function.name())


def register():
    """qgsfunction registers the functions when this module is imported; this registers them again after unregister."""
    for function in FUNCTIONS:
        if not QgsExpression.isFunctionName(function.name()):
            QgsExpression.registerFunction(function)
