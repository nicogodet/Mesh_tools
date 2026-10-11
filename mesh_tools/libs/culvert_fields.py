# -*- coding: utf-8 -*-

"""Culvert fields schema. No QGIS or Qt import here, so it can be unit-tested alone."""

from dataclasses import dataclass
from typing import Optional

KIND_STR = "str"
KIND_FLOAT = "float"
KIND_INT = "int"

SOFT_TELEMAC = 0
SOFT_UHAINA = 1


@dataclass(frozen=True)
class CulvertField:
    # TELEMAC name (CULVERTS DATA FILE, telemac2d lecbus.f)
    name: str
    kind: str
    # Column index in the exported file, None if the software does not read it
    telemac_col: Optional[int]
    uhaina_col: Optional[int]
    # Name used by the plugin before its version 1: still read in older layers and files, and written in the
    # Uhaina file header
    legacy: Optional[str] = None

    def col(self, software: int) -> Optional[int]:
        return self.uhaina_col if software == SOFT_UHAINA else self.telemac_col


# fmt: off
FIELDS = (
    CulvertField("NAME",     KIND_STR,   28,   23),
    CulvertField("I1",       KIND_INT,   0,    None, "N1"),
    CulvertField("I2",       KIND_INT,   1,    None, "N2"),
    CulvertField("CE1",      KIND_FLOAT, 2,    6),
    CulvertField("CE2",      KIND_FLOAT, 3,    7),
    CulvertField("CS1",      KIND_FLOAT, 4,    8),
    CulvertField("CS2",      KIND_FLOAT, 5,    9),
    CulvertField("LRG",      KIND_FLOAT, 6,    17,   "LARG"),
    CulvertField("HAUT1",    KIND_FLOAT, 7,    18,   "HAUT"),
    CulvertField("CLP",      KIND_INT,   8,    20,   "CLAP"),
    CulvertField("LBUS",     KIND_FLOAT, 9,    10,   "L12"),
    CulvertField("Z1",       KIND_FLOAT, 10,   2),
    CulvertField("Z2",       KIND_FLOAT, 11,   5),
    CulvertField("CV",       KIND_FLOAT, 12,   None),
    CulvertField("C56",      KIND_FLOAT, 13,   None),
    CulvertField("CV5",      KIND_FLOAT, 14,   None),
    CulvertField("C5",       KIND_FLOAT, 15,   None),
    CulvertField("CT",       KIND_FLOAT, 16,   None),
    CulvertField("HAUT2",    KIND_FLOAT, 17,   19),
    CulvertField("FRIC",     KIND_FLOAT, 18,   None),
    CulvertField("LENGTH",   KIND_FLOAT, 19,   None),
    CulvertField("CIRC",     KIND_INT,   20,   16),
    CulvertField("D1",       KIND_FLOAT, 21,   11,   "d1"),
    CulvertField("D2",       KIND_FLOAT, 22,   12,   "d2"),
    CulvertField("A1",       KIND_FLOAT, 23,   14,   "a1"),
    CulvertField("A2",       KIND_FLOAT, 24,   15,   "a2"),
    CulvertField("AA",       KIND_INT,   25,   13),
    CulvertField("NB_in_//", KIND_INT,   None, 21),
    CulvertField("AL",       KIND_INT,   26,   None),
    CulvertField("AZ",       KIND_INT,   27,   22),
)
# fmt: on

FIELD_NAMES = tuple(f.name for f in FIELDS)
FIELD_BY_NAME = {f.name: f for f in FIELDS}

# Other column names accepted in culvert files and layers (lower case): names of the plugin before its version 1
HEADER_ALIASES = {f.legacy.lower(): f.name.lower() for f in FIELDS if f.legacy}


# TELEMAC keyword OPTION FOR CULVERTS (1 by default): fields read in the file but not used by the computation
# (telemac2d buse.f). The file format is the same for both options.
OPTION_1_UNUSED = frozenset({"CV", "C56", "CV5", "C5", "CT", "FRIC", "LENGTH"})
OPTION_2_UNUSED = frozenset({"LBUS"})
DEFAULT_OPTION = 1


def used_by_option(name: str, option: int, circular: bool = False) -> bool:
    """True if the field is used by the TELEMAC computation with this culvert option."""
    if option == 2:
        return name not in OPTION_2_UNUSED
    # Option 1 does not use the width of circular culverts
    return name not in OPTION_1_UNUSED and not (name == "LRG" and circular)


# Description and unit of each field, used by the dock and the layer style
# fmt: off
FIELD_INFO = {
    "NAME": ("Name", ""), "I1": ("Node 1", ""), "I2": ("Node 2", ""),
    "CE1": ("Head loss coef. inflow 1", ""), "CE2": ("Head loss coef. inflow 2", ""),
    "CS1": ("Head loss coef. outflow 1", ""), "CS2": ("Head loss coef. outflow 2", ""),
    "LRG": ("Width", "m"), "HAUT1": ("Height 1", "m"), "HAUT2": ("Height 2 (0: same as height 1)", "m"),
    "CLP": ("Valve", ""), "LBUS": ("Linear head loss coef.", ""), "Z1": ("Elevation 1", "m"),
    "Z2": ("Elevation 2", "m"), "CV": ("Valve head loss coef.", ""), "C56": ("Flow type 5/6 coef.", ""),
    "CV5": ("Flow type 5 correction coef.", ""), "C5": ("Flow type 5 coef.", ""),
    "CT": ("Trash screen head loss coef.", ""), "FRIC": ("Manning coef.", ""), "LENGTH": ("Length", "m"),
    "CIRC": ("Circular", ""), "D1": ("Angle with the vertical 1", "°"), "D2": ("Angle with the vertical 2", "°"),
    "A1": ("Angle with the x axis 1", "°"), "A2": ("Angle with the x axis 2", "°"),
    "AA": ("Automatic angles", ""), "NB_in_//": ("Number in parallel", ""), "AL": ("Automatic length", ""),
    "AZ": ("Automatic elevations", ""),
}
# fmt: on

# TELEMAC flag CLP
VALVES = (
    ("0", "No valve (1 <-> 2)"),
    ("1", "Valve, flow 1 -> 2"),
    ("2", "Valve, flow 2 -> 1"),
    ("3", "Closed (no flow)"),
)


def exported_fields(software: int):
    """Fields written in the culvert file, in column order."""
    return sorted((f for f in FIELDS if f.col(software) is not None), key=lambda f: f.col(software))
