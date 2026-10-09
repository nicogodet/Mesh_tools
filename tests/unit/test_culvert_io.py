# -*- coding: utf-8 -*-

import os
import shutil
import subprocess
import tempfile
import unittest

from mesh_tools.libs.culvert_fields import FIELDS, SOFT_TELEMAC, SOFT_UHAINA, exported_fields
from mesh_tools.libs.culvert_io import (
    CulvertFileError,
    field_for_header,
    format_culvert_file,
    parse_value,
    read_culvert_file,
    read_header,
    validate_record,
    write_culvert_file,
)

KIND = {f.name: f.kind for f in FIELDS}


def record(**kwargs):
    rec = {
        "NAME": "culvert 1", "N1": 1, "N2": 2,
        "CE1": 0.5, "CE2": 0.5, "CS1": 1.0, "CS2": 1.0,
        "LARG": 1.2, "HAUT": 1.2, "CLAP": "0", "L12": 1.0, "Z1": 10.0, "Z2": 9.5,
        "CV": 0.0, "C56": 0.0, "CV5": 0.0, "C5": 0.0, "CT": 0.0,
        "HAUT2": 0.0, "FRIC": 0.0, "LENGTH": 12.5, "CIRC": 1,
        "d1": 90.0, "d2": 90.0, "a1": 0.0, "a2": 180.0,
        "AA": 1, "NB_in_//": 1, "AL": 1, "AZ": 0,
        "_xy": (0.0, 0.0, 100.0, 50.0),
    }  # fmt: skip
    rec.update(kwargs)
    return rec


def data_lines(text):
    return text.splitlines()


class TestWrite(unittest.TestCase):
    def test_telemac_columns_match_header_and_fortran_read(self):
        lines = data_lines(format_culvert_file([record()], SOFT_TELEMAC, 0.2))
        header, values = lines[2].split("\t"), lines[3].split("\t")
        self.assertEqual(len(header), len(values))
        # N1 .. AA are the 26 values read by TELEMAC (lecbus.f), AL AZ NAME are ignored
        self.assertEqual(header[:26], [f.name for f in exported_fields(SOFT_TELEMAC)][:26])
        self.assertEqual(header[26:], ["AL", "AZ", "NAME"])
        self.assertEqual(lines[0], "Relaxation\tCulvert count")
        self.assertEqual(lines[1], "0.2\t1")

    def test_haut2_zero_replaced_by_haut_once(self):
        lines = data_lines(format_culvert_file([record(HAUT=1.5, HAUT2=0.0)], SOFT_TELEMAC))
        header, values = lines[2].split("\t"), lines[3].split("\t")
        self.assertEqual(values[header.index("HAUT2")], "1.5")
        self.assertEqual(values[header.index("LENGTH")], "12.5")

    def test_integer_flags_are_integers(self):
        lines = data_lines(format_culvert_file([record(CLAP="2", CIRC=0)], SOFT_TELEMAC))
        header, values = lines[2].split("\t"), lines[3].split("\t")
        for name in ("N1", "N2", "CLAP", "CIRC", "AA"):
            self.assertEqual(values[header.index(name)], str(int(values[header.index(name)])), name)

    def test_empty_name_and_null_text(self):
        for name in (None, ""):
            lines = data_lines(format_culvert_file([record(NAME=name)], SOFT_TELEMAC))
            self.assertTrue(lines[3].endswith("\t"))
            self.assertNotIn("NULL", lines[3])
            self.assertNotIn("None", lines[3])

    def test_name_containing_null_is_untouched(self):
        lines = data_lines(format_culvert_file([record(NAME="NULLable")], SOFT_TELEMAC))
        self.assertTrue(lines[3].endswith("\tNULLable"))

    def test_name_with_tab_or_line_break_stays_on_one_line(self):
        lines = data_lines(format_culvert_file([record(NAME="a\tb\nc")], SOFT_TELEMAC))
        self.assertEqual(len(lines), 4)
        self.assertTrue(lines[3].endswith("\ta b c"))

    def test_empty_numeric_value_is_an_error(self):
        with self.assertRaises(CulvertFileError):
            format_culvert_file([record(CE1=None)], SOFT_TELEMAC)

    def test_uhaina(self):
        lines = data_lines(format_culvert_file([record()], SOFT_UHAINA))
        self.assertEqual(lines[0], "Culvert count")
        header, values = lines[2].split("\t"), lines[3].split("\t")
        self.assertEqual(len(header), len(values))
        self.assertEqual(values[header.index("X1")], "0.0")
        self.assertEqual(values[header.index("Y2")], "50.0")
        self.assertEqual(values[header.index("Z1")], "10.0")

    def test_roundtrip(self):
        folder = tempfile.mkdtemp()
        try:
            path = os.path.join(folder, "culv.txt")
            write_culvert_file(path, [record(), record(NAME="second one", N1=3, N2=4)], SOFT_TELEMAC, 0.3)
            read = read_culvert_file(path)
            self.assertEqual(read.relax, 0.3)
            self.assertEqual(len(read.rows), 2)
            self.assertEqual(read.rows[1]["NAME"], "second one")
            self.assertEqual(parse_value(read.rows[1]["N2"], KIND["N2"], "N2"), 4)
            self.assertEqual(parse_value(read.rows[0]["LENGTH"], KIND["LENGTH"], "LENGTH"), 12.5)
        finally:
            shutil.rmtree(folder)

    @unittest.skipUnless(shutil.which("gfortran"), "gfortran is not available")
    def test_fortran_list_directed_read(self):
        # Same read statement as LECBUS: 26 values, then the rest of the record is ignored
        folder = tempfile.mkdtemp()
        try:
            src = os.path.join(folder, "rd.f90")
            with open(src, "w") as f:
                f.write(
                    "program rd\n integer :: i1,i2,clp,circ,aa,ios\n"
                    " double precision :: v(24)\n"
                    " read(*,*)\n read(*,*)\n read(*,*)\n"
                    " read(*,*,iostat=ios) i1,i2,v(1),v(2),v(3),v(4),v(5),v(6),clp,v(7),v(8),v(9),"
                    "v(10),v(11),v(12),v(13),v(14),v(15),v(16),v(17),circ,v(18),v(19),v(20),v(21),aa\n"
                    " print *, ios\nend program\n"
                )
            exe = os.path.join(folder, "rd")
            subprocess.run(["gfortran", src, "-o", exe], check=True)
            for rec in (record(), record(HAUT2=1.0, LENGTH=3.0)):
                text = format_culvert_file([rec], SOFT_TELEMAC)
                res = subprocess.run([exe], input=text, capture_output=True, text=True, check=True)
                self.assertEqual(res.stdout.strip(), "0")
        finally:
            shutil.rmtree(folder)


class TestRead(unittest.TestCase):
    def setUp(self):
        self.folder = tempfile.mkdtemp()

    def tearDown(self):
        shutil.rmtree(self.folder)

    def write(self, text):
        path = os.path.join(self.folder, "culv.txt")
        with open(path, "w") as f:
            f.write(text)
        return path

    def test_official_space_separated_file(self):
        path = self.write(
            "Relaxation, Number of culverts\n0.2 1\n"
            "I1 I2 CE1 CE2 CS1 CS2 LRG HAUT1 CLP LBUS Z1 Z2 CV C56 CV5 C5 CT HAUT2 FRIC LENGTH CIRC D1 D2 A1 A2 AA\n"
            "198 661 0.5 0.5 1.0 1.0 2.523 2.523 0 0.2 0.3 0.1 0.0 0.0 0.0 0.0 0.0 2.523 0.0 0.0 1 90. 0. 0. 90. 0\n"
        )
        headers = read_header(path)
        self.assertEqual(len(headers), 26)
        self.assertEqual([field_for_header(h) for h in headers[:2]], ["N1", "N2"])
        self.assertEqual(field_for_header("LRG"), "LARG")
        self.assertEqual(field_for_header("LBUS"), "L12")
        self.assertEqual(field_for_header("D1"), "d1")
        self.assertIsNone(field_for_header("whatever"))
        read = read_culvert_file(path)
        self.assertEqual(read.relax, 0.2)
        self.assertEqual(read.rows[0]["I2"], "661")
        self.assertEqual(parse_value(read.rows[0]["D1"], KIND["d1"], "d1"), 90.0)

    def test_trailing_blank_lines_and_old_format(self):
        path = self.write("comment\n0.5\nN1\tN2\n1\t2\n\n   \n")
        read = read_culvert_file(path)
        self.assertEqual(read.relax, 0.5)
        self.assertEqual(len(read.rows), 1)

    def test_tab_file_with_empty_name(self):
        path = self.write("c\n0.2\t1\nN1\tN2\tNAME\n1\t2\t\n")
        self.assertEqual(read_culvert_file(path).rows[0], {"N1": "1", "N2": "2", "NAME": ""})

    def test_name_with_spaces_in_space_separated_file(self):
        path = self.write("c\n0.2 1\nN1 N2 NAME\n1 2 my big culvert\n")
        self.assertEqual(read_culvert_file(path).rows[0]["NAME"], "my big culvert")

    def test_uhaina_has_no_relaxation(self):
        path = self.write("Culvert count\n1\tfoo\nX1\tY1\tX2\tY2\n0\t0\t1\t1\n")
        self.assertIsNone(read_culvert_file(path).relax)

    def test_bad_files(self):
        with self.assertRaises(CulvertFileError):
            read_culvert_file(self.write("only\ntwo lines\n"))
        with self.assertRaises(CulvertFileError):
            read_culvert_file(self.write("c\n0.2 1 3\nN1\n1\n"))
        with self.assertRaises(CulvertFileError):
            read_culvert_file(self.write("c\n0.2 1\n\n1\t2\n"))

    def test_parse_value(self):
        self.assertEqual(parse_value("-1.2", "float"), -1.2)
        self.assertEqual(parse_value("1e-3", "float"), 0.001)
        self.assertEqual(parse_value("90.", "int"), 90)
        self.assertEqual(parse_value("1", "int_text"), "1")
        with self.assertRaises(CulvertFileError):
            parse_value("abc", "float", "CE1")
        with self.assertRaises(CulvertFileError):
            parse_value("1.5", "int", "N1")
        with self.assertRaises(CulvertFileError):
            parse_value("", "float", "CE1")


class TestValidate(unittest.TestCase):
    def test_valid(self):
        self.assertEqual(validate_record(record()), [])

    def test_null_and_zero_height(self):
        problems = validate_record(record(CE1=None, HAUT=0.0))
        self.assertIn(("invalid", "CE1"), problems)
        self.assertIn(("not_positive", "HAUT"), problems)

    def test_uhaina_ignores_telemac_only_fields(self):
        self.assertEqual(validate_record(record(CV=None), SOFT_UHAINA), [])
        self.assertIn(("invalid", "CV"), validate_record(record(CV=None), SOFT_TELEMAC))


if __name__ == "__main__":
    unittest.main()
