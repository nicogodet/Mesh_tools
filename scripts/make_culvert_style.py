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
    QgsEditorWidgetSetup,
    QgsField,
    QgsFieldConstraints,
    QgsLineSymbol,
    QgsMapLayer,
    QgsMarkerLineSymbolLayer,
    QgsMarkerSymbol,
    QgsOptionalExpression,
    QgsExpression,
    QgsRuleBasedRenderer,
    QgsSimpleLineSymbolLayer,
    QgsVectorLayer,
)
from qgis.PyQt.QtCore import QMetaType, Qt
from qgis.PyQt.QtGui import QColor
from qgis.testing import start_app

sys.path.insert(0, os.getcwd())
from mesh_tools.libs.culvert_fields import FIELDS, OPTION_1_UNUSED  # noqa: E402

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
ALIASES = {
    "NAME": "Name", "N1": "Node 1", "N2": "Node 2",
    "CE1": "Head loss coef. inflow 1", "CE2": "Head loss coef. inflow 2",
    "CS1": "Head loss coef. outflow 1", "CS2": "Head loss coef. outflow 2",
    "LARG": "Width", "HAUT": "Height 1", "HAUT2": "Height 2 (0: = height 1)",
    "CLAP": "Valve", "L12": "Linear head loss", "Z1": "Elevation 1", "Z2": "Elevation 2",
    "CV": "Valve head loss coef.", "C56": "Flow type 5/6 coef.", "CV5": "Flow type 5 correction",
    "C5": "Flow type 5 coef.", "CT": "Trash screen head loss coef.", "FRIC": "Manning coef.",
    "LENGTH": "Length", "CIRC": "Circular", "d1": "Angle with vertical 1", "d2": "Angle with vertical 2",
    "a1": "Angle with x axis 1", "a2": "Angle with x axis 2", "AA": "Automatic angles",
    "NB_in_//": "Number in parallel (Uhaina)", "AL": "Automatic length", "AZ": "Automatic elevations",
}

DEFAULTS = {
    "d1": "0", "d2": "0", "CE1": "0.5", "CE2": "0.5", "CS1": "1.0", "CS2": "1.0", "LARG": "0", "HAUT": "0",
    "CLAP": "'0'", "L12": "1.0", "Z1": "0", "Z2": "0", "a1": "0", "a2": "0", "CV": "0", "C56": "0",
    "CV5": "0", "C5": "0", "CT": "0", "HAUT2": "0", "FRIC": "0", "LENGTH": "0", "CIRC": "0", "AL": "0",
    "AZ": "0", "AA": "0", "NB_in_//": "1",
}

VALVES = [
    ("0", "No valve (1 <-> 2)"),
    ("1", "Valve, flow 1 -> 2"),
    ("2", "Valve, flow 2 -> 1"),
    ("3", "Closed (no flow)"),
]

FORM = [
    ("Culvert", None, ["NAME", "N1", "N2", "CLAP", "CIRC", "NB_in_//"]),
    ("Elevations and section", None, ["Z1", "Z2", "AZ", "LARG", "HAUT", "HAUT2", "d1", "d2"]),
    ("Angles", None, ["a1", "a2", "AA"]),
    ("Head losses", None, ["CE1", "CE2", "CS1", "CS2"]),
    ("Option 1", f"NOT ({OPTION_2})", ["L12"]),
    ("Option 2", OPTION_2, ["CV", "C56", "CV5", "C5", "CT", "FRIC", "LENGTH", "AL"]),
]
# fmt: on

INVALID = '"N1" IS NULL OR "N2" IS NULL OR coalesce("HAUT", 0) <= 0'


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
            QgsRuleBasedRenderer.Rule(symbols[value], 0, 0, f"NOT ({INVALID}) AND to_int(\"CLAP\") = {value}", label)
        )
    other = QgsRuleBasedRenderer.Rule(line_symbol(BLUE), 0, 0, "", "Other")
    other.setIsElse(True)
    root.appendChild(other)
    return QgsRuleBasedRenderer(root)


def constraint(name):
    """(expression, description) of the soft constraint of a field, None if it has none."""
    if name in ("NAME", "N1", "N2"):
        return None
    if name == "HAUT":
        return 'coalesce("HAUT", 0) > 0', "The height must be greater than 0."
    if name == "LARG":
        return (
            f'NOT {LARG_USED} OR coalesce("LARG", 0) > 0',
            "The width must be greater than 0 (rectangular culvert or option 2).",
        )
    if name in OPTION_1_UNUSED:
        return f'NOT ({OPTION_2}) OR "{name}" IS NOT NULL', "Required with culvert option 2."
    if name == "L12":
        return f'{OPTION_2} OR "L12" IS NOT NULL', "Required with culvert option 1."
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
        layer.setFieldAlias(idx, ALIASES[fld.name])
        if fld.name in DEFAULTS:
            layer.setDefaultValueDefinition(idx, QgsDefaultValue(DEFAULTS[fld.name]))
        if fld.name == "CLAP":
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
    for name in ("N1", "N2"):
        form.setReadOnly(fields.lookupField(name), True)
    layer.setEditFormConfig(form)

    category = QgsMapLayer.StyleCategory
    categories = category.Symbology | category.Fields | category.Forms
    message, ok = layer.saveNamedStyle(path, categories)
    if not ok:
        raise SystemExit(message)
    print("written", path)


if __name__ == "__main__":
    main(os.path.join("mesh_tools", "styles", "culvert.qml"))
