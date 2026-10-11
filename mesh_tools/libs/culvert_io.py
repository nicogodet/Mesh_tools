# -*- coding: utf-8 -*-

"""Read/write culvert text files and check culvert records. No QGIS or Qt import here."""

import math

from dataclasses import dataclass, field
from typing import Dict, List, Optional

from .culvert_fields import (
    FIELDS,
    DEFAULT_OPTION,
    HEADER_ALIASES,
    KIND_FLOAT,
    KIND_INT,
    KIND_INT_TEXT,
    KIND_STR,
    OPTION_1_UNUSED,
    SOFT_TELEMAC,
    SOFT_UHAINA,
    exported_fields,
    used_by_option,
)


class CulvertFileError(ValueError):
    pass


def is_null(value) -> bool:
    """True for None and for QGIS NULL (a QVariant instance, which is not a Python None in every QGIS version)."""
    return value is None or type(value).__name__ == "QVariant"


def _to_number(value, kind):
    if kind == KIND_INT_TEXT:
        return int(value)
    if kind == KIND_INT:
        if isinstance(value, float) and not value.is_integer():
            raise ValueError(value)
        return int(value)
    return float(value)


def format_value(value, kind) -> str:
    if kind == KIND_STR:
        # A tab or a line break would split the record
        return "" if is_null(value) else " ".join(str(value).split())
    return str(_to_number(value, kind))


def is_valid_value(value, kind) -> bool:
    if kind == KIND_STR:
        return True
    if is_null(value) or isinstance(value, bool):
        return False
    try:
        number = _to_number(value, kind)
    except (TypeError, ValueError):
        return False
    return not (isinstance(number, float) and not math.isfinite(number))


def _is_circular(record: dict) -> bool:
    return not is_null(record.get("CIRC")) and record.get("CIRC") == 1


def is_used(name: str, record: dict, software: int, option: int) -> bool:
    """True if the field is used by the computation (TELEMAC option, Uhaina reads all its columns)."""
    return software != SOFT_TELEMAC or used_by_option(name, option, _is_circular(record))


def validate_record(record: dict, software: int = SOFT_TELEMAC, option: int = DEFAULT_OPTION) -> List[tuple]:
    """Return a list of (code, field_name), code being 'invalid' or 'not_positive'.

    With TELEMAC, the fields not used by the culvert option may be empty (written as 0).
    """
    problems = []
    for fld in exported_fields(software):
        if fld.name == "NAME" or fld.name in ("N1", "N2"):
            continue
        if is_used(fld.name, record, software, option) and not is_valid_value(record.get(fld.name), fld.kind):
            problems.append(("invalid", fld.name))

    # TELEMAC sets the flow to zero when a height is null, and option 2 divides by the hydraulic radius,
    # which needs a width even for circular culverts
    positive = ["HAUT"]
    if software == SOFT_TELEMAC and is_used("LARG", record, software, option):
        positive.append("LARG")
    for name in positive:
        if ("invalid", name) not in problems and float(record[name]) <= 0:
            problems.append(("not_positive", name))
    return problems


######################################################################################
#                                      WRITE                                         #
######################################################################################


def _header_names(software: int) -> List[str]:
    names = []
    for fld in exported_fields(software):
        if software == SOFT_UHAINA and fld.name in ("Z1", "Z2"):
            names += [f"X{fld.name[1]}", f"Y{fld.name[1]}"]
        names.append(fld.name)
    return names


def format_culvert_file(
    records: List[dict], software: int, relax: float = 0.2, option: int = DEFAULT_OPTION
) -> str:
    """Text of the culvert file. Uhaina records must have an '_xy' key: (x1, y1, x2, y2).

    TELEMAC reads all its columns whatever the culvert option: an empty field not used by the option is written 0.
    """
    lines = []
    if software == SOFT_TELEMAC:
        lines.append("Relaxation\tCulvert count")
        lines.append(f"{round(relax, 2)}\t{len(records)}")
    else:
        lines.append("Culvert count")
        lines.append(str(len(records)))
    lines.append("\t".join(_header_names(software)))

    for number, rec in enumerate(records, 1):
        cells = []
        for fld in exported_fields(software):
            value = rec.get(fld.name)
            if fld.name == "HAUT2" and (is_null(value) or value == 0):
                # In case HAUT2 is empty, suppose it is equal to HAUT
                value = rec.get("HAUT")
            elif is_null(value) and fld.kind != KIND_STR and not is_used(fld.name, rec, software, option):
                value = 0
            if fld.kind != KIND_STR and is_null(value):
                raise CulvertFileError(f"Culvert {number}: {fld.name} is empty.")
            if software == SOFT_UHAINA and fld.name in ("Z1", "Z2"):
                x1, y1, x2, y2 = rec["_xy"]
                x, y = (x1, y1) if fld.name == "Z1" else (x2, y2)
                cells += [str(x), str(y)]
            try:
                cells.append(format_value(value, fld.kind))
            except (TypeError, ValueError):
                raise CulvertFileError(f"Culvert {number}: {fld.name} value is not correct.")
        lines.append("\t".join(cells))
    return "\n".join(lines) + "\n"


def write_culvert_file(
    path: str, records: List[dict], software: int, relax: float = 0.2, option: int = DEFAULT_OPTION
) -> None:
    # Format first so nothing is written if a record is wrong
    text = format_culvert_file(records, software, relax, option)
    with open(path, "w", encoding="utf-8", newline="\n") as culv_file:
        culv_file.write(text)


######################################################################################
#                                       READ                                         #
######################################################################################


@dataclass
class CulvertFile:
    # None for Uhaina files, which have no relaxation
    relax: Optional[float]
    headers: List[str]
    rows: List[Dict[str, str]] = field(default_factory=list)


def _split(line: str, tab: bool) -> List[str]:
    if tab:
        return [cell.strip() for cell in line.rstrip("\r\n").split("\t")]
    return line.split()


def read_header(path: str) -> List[str]:
    """Column names of a culvert file (3rd line), whatever the separator (tab or spaces)."""
    with open(path, "r", encoding="utf-8", errors="replace") as txt_file:
        txt_file.readline()
        txt_file.readline()
        header = txt_file.readline()
    return _split(header, "\t" in header.strip("\r\n"))


def read_culvert_file(path: str) -> CulvertFile:
    with open(path, "r", encoding="utf-8", errors="replace") as txt_file:
        lines = txt_file.read().splitlines()

    if len(lines) < 3:
        raise CulvertFileError("The file is too short: 3 header lines are expected.")

    tab = "\t" in lines[2]
    headers = _split(lines[2], tab)
    if not any(headers):
        raise CulvertFileError("The 3rd line should contain the column names.")
    lower = [h.lower() for h in headers]
    is_uhaina = "x1" in lower

    values = lines[1].split()
    if is_uhaina:
        relax = None
    elif len(values) in (1, 2):
        # For old culvert files, number of culverts was not specified
        try:
            relax = float(values[0])
        except ValueError:
            raise CulvertFileError(f"Relaxation value is not correct: {values[0]!r}.")
    else:
        raise CulvertFileError("The 2nd line should contain the relaxation and the number of culverts.")

    name_last = lower[-1] == "name"
    rows = []
    for line in lines[3:]:
        if not line.strip():
            continue
        cells = _split(line, tab)
        if not tab and name_last and len(cells) > len(headers):
            # Name containing spaces
            last = len(headers) - 1
            cells = cells[:last] + [" ".join(cells[last:])]
        rows.append({h: (cells[i] if i < len(cells) else "") for i, h in enumerate(headers)})

    return CulvertFile(relax, headers, rows)


def field_for_header(header: str) -> Optional[str]:
    """Plugin field name matching a file column name (case insensitive, TELEMAC aliases), None if unknown."""
    key = HEADER_ALIASES.get(header.lower(), header.lower())
    for fld in FIELDS:
        if fld.name.lower() == key:
            return fld.name
    return None


def detect_option(rows: List[Dict[str, str]], columns: Dict[str, str]) -> int:
    """Culvert option guessed from a file: 2 if a field used only by option 2 has a non-zero value.

    columns maps field names to file columns.
    """
    for row in rows:
        for name in OPTION_1_UNUSED:
            column = columns.get(name)
            if not column:
                continue
            try:
                if float(row.get(column, "") or 0) != 0:
                    return 2
            except ValueError:
                continue
    return DEFAULT_OPTION


def parse_value(text: str, kind: str, name: str = ""):
    """Convert a cell of a culvert file. Empty cell is None for text, an error for the others."""
    text = text.strip()
    if kind == KIND_STR:
        return text
    try:
        number = float(text)
    except ValueError:
        raise CulvertFileError(f"{name}: {text!r} is not a number.")
    if kind == KIND_FLOAT:
        return number
    if not number.is_integer():
        raise CulvertFileError(f"{name}: {text!r} is not an integer.")
    return str(int(number)) if kind == KIND_INT_TEXT else int(number)
