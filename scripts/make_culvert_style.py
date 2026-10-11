# -*- coding: utf-8 -*-

"""Build mesh_tools/styles/culvert.qml (symbology, fields and form of the culvert layers).

Run it with the Python of QGIS, from the repository root:
    python3 scripts/make_culvert_style.py
"""

import os
import sys

from qgis.core import (
    Qgis,
    QgsAttributeEditorContainer,
    QgsAttributeEditorField,
    QgsDefaultValue,
    QgsEditFormConfig,
    QgsEditorWidgetSetup,
    QgsField,
    QgsFieldConstraints,
    QgsLineSymbol,
    QgsMapLayer,
    QgsMarkerLineSymbolLayer,
    QgsMarkerSymbol,
    QgsOptionalExpression,
    QgsExpression,
    QgsProperty,
    QgsPropertyCollection,
    QgsRuleBasedRenderer,
    QgsSimpleLineSymbolLayer,
    QgsVectorLayer,
)
from qgis.PyQt.QtCore import QMetaType, Qt
from qgis.PyQt.QtGui import QColor
from qgis.testing import start_app

sys.path.insert(0, os.getcwd())
from mesh_tools.libs.culvert_fields import FIELD_INFO, FIELDS, OPTION_1_UNUSED, VALVES  # noqa: E402

QT_TYPES = {
    "str": QMetaType.Type.QString,
    "int_text": QMetaType.Type.QString,
    "float": QMetaType.Type.Double,
    "int": QMetaType.Type.Int,
}

BLUE = QColor(31, 120, 180)
RED = QColor(227, 26, 28)

OPTION_2 = "to_int(coalesce(@culvert_option, 1)) = 2"
LARG_USED = f'({OPTION_2} OR coalesce("CIRC", 0) = 0)'

# fmt: off
DEFAULTS = {
    "D1": "0", "D2": "0", "CE1": "0.5", "CE2": "0.5", "CS1": "1.0", "CS2": "1.0", "LRG": "0", "HAUT1": "0",
    "CLP": "0", "LBUS": "1.0", "Z1": "0", "Z2": "0", "A1": "0", "A2": "0", "CV": "0", "C56": "0",
    "CV5": "0", "C5": "0", "CT": "0", "HAUT2": "0", "FRIC": "0", "LENGTH": "0", "CIRC": "0", "AL": "0",
    "AZ": "0", "AA": "0", "NB_in_//": "1",
}

FORM = [
    ("Culvert", None, ["NAME", "I1", "I2", "CLP", "CIRC", "NB_in_//"]),
    ("Elevations and section", None, ["Z1", "Z2", "AZ", "LRG", "HAUT1", "HAUT2", "D1", "D2"]),
    ("Angles", None, ["A1", "A2", "AA"]),
    ("Head losses", None, ["CE1", "CE2", "CS1", "CS2"]),
    ("Option 1", f"NOT ({OPTION_2})", ["LBUS"]),
    ("Option 2", OPTION_2, ["CV", "C56", "CV5", "C5", "CT", "FRIC", "LENGTH", "AL"]),
]
# fmt: on

INVALID = '"I1" IS NULL OR "I2" IS NULL OR coalesce("HAUT1", 0) <= 0'

# Automatic values, updated whenever a culvert is modified. The mesh functions come from the Mesh Tools plugin:
# they are called through eval() so that without the plugin the stored value is kept (eval gives NULL).
# @culvert_mesh and @culvert_bottom are layer variables set by the plugin.
IN_MESH_CRS = "transform($geometry, @layer_crs, layer_property(@culvert_mesh, 'crs'))"


def node_expression(field, point):
    index = f"eval('mesh_vertex_index(@culvert_mesh, {point}($geometry))')"
    return f'with_variable(\'i\', {index}, if(@i IS NULL, "{field}", if(@i < 0, NULL, @i + 1)))'


def elevation_expression(field, point):
    value = f"eval('mesh_vertex_value(@culvert_mesh, @culvert_bottom, {point}($geometry))')"
    return f'if("AZ" = 1, coalesce({value}, "{field}"), "{field}")'


def angle(first, second):
    """TELEMAC angle with the x axis (counterclockwise, degrees) from the azimuth (clockwise from north)."""
    return f"(450 - degrees(azimuth({first}, {second}))) % 360"


AUTOMATIC_DEFAULTS = {
    "I1": node_expression("I1", "start_point"),
    "I2": node_expression("I2", "end_point"),
    "Z1": elevation_expression("Z1", "start_point"),
    "Z2": elevation_expression("Z2", "end_point"),
    "LENGTH": f'if("AL" = 1, coalesce(length({IN_MESH_CRS}), "LENGTH"), "LENGTH")',
    "A1": (
        f"if(\"AA\" = 1, coalesce(with_variable('g', {IN_MESH_CRS}, "
        f"({angle('point_n(@g, 1)', 'point_n(@g, 2)')} + 180) % 360), \"A1\"), \"A1\")"
    ),
    "A2": (
        f"if(\"AA\" = 1, coalesce(with_variable('g', {IN_MESH_CRS}, "
        f"{angle('point_n(@g, num_points(@g) - 1)', 'point_n(@g, num_points(@g))')}), \"A2\"), \"A2\")"
    ),
    # A circular culvert is as wide as high
    "LRG": 'if("CIRC" = 1, "HAUT1", "LRG")',
}

# Fields computed when the automatic option is checked: not editable then
EDITABLE = {
    "Z1": '"AZ" IS NULL OR "AZ" != 1',
    "Z2": '"AZ" IS NULL OR "AZ" != 1',
    "LENGTH": '"AL" IS NULL OR "AL" != 1',
    "A1": '"AA" IS NULL OR "AA" != 1',
    "A2": '"AA" IS NULL OR "AA" != 1',
    "LRG": '"CIRC" IS NULL OR "CIRC" != 1',
}


def line_symbol(color, dashed=False):
    symbol = QgsLineSymbol()
    symbol.deleteSymbolLayer(0)
    line = QgsSimpleLineSymbolLayer(color, 0.5)
    if dashed:
        line.setPenStyle(Qt.PenStyle.DashLine)
    symbol.appendSymbolLayer(line)
    for placement in (Qgis.MarkerLinePlacement.FirstVertex, Qgis.MarkerLinePlacement.LastVertex):
        ends = QgsMarkerLineSymbolLayer()
        ends.setPlacements(Qgis.MarkerLinePlacements(placement))
        ends.setSubSymbol(QgsMarkerSymbol.createSimple({"name": "circle", "color": color.name(), "size": "2"}))
        symbol.appendSymbolLayer(ends)
    return symbol


def add_center_marker(symbol, shape, angle):
    marker = QgsMarkerLineSymbolLayer(True)
    marker.setPlacements(Qgis.MarkerLinePlacements(Qgis.MarkerLinePlacement.CentralPoint))
    props = {"name": shape, "color": RED.name(), "outline_color": RED.name(), "size": "3", "angle": str(angle)}
    if shape == "line":
        props["outline_width"] = "0.8"
    marker.setSubSymbol(QgsMarkerSymbol.createSimple(props))
    symbol.appendSymbolLayer(marker)


def renderer():
    root = QgsRuleBasedRenderer.Rule(None)

    invalid = line_symbol(RED, dashed=True)
    root.appendChild(QgsRuleBasedRenderer.Rule(invalid, 0, 0, INVALID, "Not valid (node or height)"))

    symbols = {"0": line_symbol(BLUE), "1": line_symbol(BLUE), "2": line_symbol(BLUE), "3": line_symbol(BLUE)}
    add_center_marker(symbols["1"], "filled_arrowhead", 0)
    add_center_marker(symbols["2"], "filled_arrowhead", 180)
    add_center_marker(symbols["3"], "line", 0)
    for value, label in VALVES:
        root.appendChild(
            QgsRuleBasedRenderer.Rule(symbols[value], 0, 0, f"NOT ({INVALID}) AND to_int(\"CLP\") = {value}", label)
        )
    other = QgsRuleBasedRenderer.Rule(line_symbol(BLUE), 0, 0, "", "Other")
    other.setIsElse(True)
    root.appendChild(other)
    return QgsRuleBasedRenderer(root)


def constraint(name):
    """(expression, description) of the soft constraint of a field, None if it has none."""
    if name in ("NAME", "I1", "I2"):
        return None
    if name == "HAUT1":
        return 'coalesce("HAUT1", 0) > 0', "The height must be greater than 0."
    if name == "LRG":
        return (
            f'NOT {LARG_USED} OR coalesce("LRG", 0) > 0',
            "The width must be greater than 0 (rectangular culvert or option 2).",
        )
    if name in OPTION_1_UNUSED:
        return f'NOT ({OPTION_2}) OR "{name}" IS NOT NULL', "Required with culvert option 2."
    if name == "LBUS":
        return f'{OPTION_2} OR "LBUS" IS NOT NULL', "Required with culvert option 1."
    return f'"{name}" IS NOT NULL', "Required."


def main(path):
    start_app()
    layer = QgsVectorLayer("MultiLineString?crs=EPSG:2154", "culvert", "memory")
    layer.dataProvider().addAttributes([QgsField(f.name, QT_TYPES[f.kind]) for f in FIELDS])
    layer.updateFields()
    fields = layer.fields()

    layer.setRenderer(renderer())

    for fld in FIELDS:
        idx = fields.lookupField(fld.name)
        alias, unit = FIELD_INFO[fld.name]
        layer.setFieldAlias(idx, f"{alias} ({unit})" if unit else alias)
        if fld.name in AUTOMATIC_DEFAULTS:
            layer.setDefaultValueDefinition(idx, QgsDefaultValue(AUTOMATIC_DEFAULTS[fld.name], True))
        elif fld.name in DEFAULTS:
            layer.setDefaultValueDefinition(idx, QgsDefaultValue(DEFAULTS[fld.name]))
        if fld.name == "CLP":
            layer.setEditorWidgetSetup(idx, QgsEditorWidgetSetup("ValueMap", {"map": [{lab: v} for v, lab in VALVES]}))
        elif fld.name in ("CIRC", "AA", "AL", "AZ"):
            layer.setEditorWidgetSetup(
                idx, QgsEditorWidgetSetup("CheckBox", {"CheckedState": "1", "UncheckedState": "0"})
            )
        rule = constraint(fld.name)
        if rule is not None:
            layer.setConstraintExpression(idx, *rule)
            layer.setFieldConstraint(
                idx,
                QgsFieldConstraints.Constraint.ConstraintExpression,
                QgsFieldConstraints.ConstraintStrength.ConstraintStrengthSoft,
            )

    form = layer.editFormConfig()
    form.setLayout(Qgis.AttributeFormLayout.DragAndDrop)
    form.clearTabs()
    for title, visibility, names in FORM:
        box = QgsAttributeEditorContainer(title, form.invisibleRootContainer())
        box.setType(Qgis.AttributeEditorContainerType.GroupBox)
        if visibility:
            box.setVisibilityExpression(QgsOptionalExpression(QgsExpression(visibility)))
        for name in names:
            box.addChildElement(QgsAttributeEditorField(name, fields.lookupField(name), box))
        form.addTab(box)
    for name in ("I1", "I2"):
        form.setReadOnly(fields.lookupField(name), True)
    for name, expression in EDITABLE.items():
        properties = QgsPropertyCollection()
        properties.setProperty(QgsEditFormConfig.DataDefinedProperty.Editable, QgsProperty.fromExpression(expression))
        form.setDataDefinedFieldProperties(name, properties)
    layer.setEditFormConfig(form)

    category = QgsMapLayer.StyleCategory
    categories = category.Symbology | category.Fields | category.Forms
    message, ok = layer.saveNamedStyle(path, categories)
    if not ok:
        raise SystemExit(message)
    print("written", path)


if __name__ == "__main__":
    main(os.path.join("mesh_tools", "styles", "culvert.qml"))
