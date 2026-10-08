# -*- coding: utf-8 -*-

"""Culvert fields schema. No QGIS or Qt import here, so it can be unit-tested alone."""

from dataclasses import dataclass
from typing import Optional

KIND_STR = "str"
KIND_FLOAT = "float"
KIND_INT = "int"
# Integer flag kept in a text field (CLAP)
KIND_INT_TEXT = "int_text"

SOFT_TELEMAC = 0
SOFT_UHAINA = 1


@dataclass(frozen=True)
class CulvertField:
    name: str
    kind: str
    widget: Optional[str]
    # Column index in the exported file, None if the software does not read it
    telemac_col: Optional[int]
    uhaina_col: Optional[int]

    def col(self, software: int) -> Optional[int]:
        return self.uhaina_col if software == SOFT_UHAINA else self.telemac_col


# fmt: off
FIELDS = (
    CulvertField("NAME",     KIND_STR,      "txt_name",  28, 23),
    CulvertField("N1",       KIND_INT,      None,        0,  None),
    CulvertField("N2",       KIND_INT,      None,        1,  None),
    CulvertField("CE1",      KIND_FLOAT,    "sb_ce1",    2,  6),
    CulvertField("CE2",      KIND_FLOAT,    "sb_ce2",    3,  7),
    CulvertField("CS1",      KIND_FLOAT,    "sb_cs1",    4,  8),
    CulvertField("CS2",      KIND_FLOAT,    "sb_cs2",    5,  9),
    CulvertField("LARG",     KIND_FLOAT,    "sb_larg",   6,  17),
    CulvertField("HAUT",     KIND_FLOAT,    "sb_haut1",  7,  18),
    CulvertField("CLAP",     KIND_INT_TEXT, "cb_clapet", 8,  20),
    CulvertField("L12",      KIND_FLOAT,    "sb_l12",    9,  10),
    CulvertField("Z1",       KIND_FLOAT,    "sb_z1",     10, 2),
    CulvertField("Z2",       KIND_FLOAT,    "sb_z2",     11, 5),
    CulvertField("CV",       KIND_FLOAT,    "sb_cv",     12, None),
    CulvertField("C56",      KIND_FLOAT,    "sb_c56",    13, None),
    CulvertField("CV5",      KIND_FLOAT,    "sb_cv5",    14, None),
    CulvertField("C5",       KIND_FLOAT,    "sb_c5",     15, None),
    CulvertField("CT",       KIND_FLOAT,    "sb_ct",     16, None),
    CulvertField("HAUT2",    KIND_FLOAT,    "sb_haut2",  17, 19),
    CulvertField("FRIC",     KIND_FLOAT,    "sb_fric",   18, None),
    CulvertField("LENGTH",   KIND_FLOAT,    "sb_length", 19, None),
    CulvertField("CIRC",     KIND_INT,      "cb_circ",   20, 16),
    CulvertField("d1",       KIND_FLOAT,    "sb_d1",     21, 11),
    CulvertField("d2",       KIND_FLOAT,    "sb_d2",     22, 12),
    CulvertField("a1",       KIND_FLOAT,    "sb_a1",     23, 14),
    CulvertField("a2",       KIND_FLOAT,    "sb_a2",     24, 15),
    CulvertField("AA",       KIND_INT,      "cb_auto_a", 25, 13),
    CulvertField("NB_in_//", KIND_INT,      "sb_nbre",   None, 21),
    CulvertField("AL",       KIND_INT,      "cb_auto_l", 26, None),
    CulvertField("AZ",       KIND_INT,      "cb_auto_z", 27, 22),
)
# fmt: on

FIELD_NAMES = tuple(f.name for f in FIELDS)

# Header names used in TELEMAC documentation/examples, mapped to the plugin field names (lower case)
HEADER_ALIASES = {
    "i1": "n1",
    "i2": "n2",
    "lrg": "larg",
    "haut1": "haut",
    "clp": "clap",
    "lbus": "l12",
}


def exported_fields(software: int):
    """Fields written in the culvert file, in column order."""
    return sorted((f for f in FIELDS if f.col(software) is not None), key=lambda f: f.col(software))
