import datetime
import io
import json
import unittest
from contextlib import redirect_stdout

import vardadieniai as v
from vardadieniai import cli, core


class CoreTests(unittest.TestCase):
    def test_366_days(self):
        self.assertEqual(len(core._days()), 366)
        self.assertIn("02-29", core._days())

    def test_names_on(self):
        self.assertIn("Justas", v.names_on(5, 28))
        self.assertIn("Andrius", v.names_on(11, 10))
        self.assertTrue(v.names_on("02", "29"))

    def test_bad_date(self):
        with self.assertRaises(ValueError):
            v.names_on(2, 30)
        with self.assertRaises(ValueError):
            v.names_on(13, 1)

    def test_days_for_folding(self):
        self.assertEqual(v.days_for("Justas"), v.days_for("JUSTAS"))
        self.assertEqual(v.days_for("Ąžuolas"), v.days_for("azuolas"))
        self.assertEqual(v.days_for("azuolas"), ["06-02"])
        self.assertIn("05-28", v.days_for(" justas "))
        self.assertEqual(v.days_for("nera-tokio-vardo"), [])

    def test_index_consistent(self):
        for name, dates in core._names().items():
            for d in dates:
                self.assertIn(name, core._days()[d])

    def test_month(self):
        m = v.month(2)
        self.assertEqual(len(m), 29)
        self.assertTrue(all(k.startswith("02-") for k in m))
        with self.assertRaises(ValueError):
            v.month(0)

    def test_today_tomorrow(self):
        now = datetime.datetime(2026, 12, 31, 12, tzinfo=datetime.timezone.utc)
        self.assertEqual(v.today(now)["date"], "12-31")
        self.assertEqual(v.tomorrow(now)["date"], "01-01")
        t = v.today()
        self.assertRegex(t["date"], r"^\d\d-\d\d$")
        self.assertTrue(t["names"])


class CliTests(unittest.TestCase):
    def run_cli(self, *argv):
        buf = io.StringIO()
        with redirect_stdout(buf):
            code = cli.main(list(argv))
        return code, buf.getvalue()

    def test_default(self):
        code, out = self.run_cli()
        self.assertEqual(code, 0)
        self.assertIn("Šiandien", out)
        self.assertIn("Rytoj", out)

    def test_date(self):
        code, out = self.run_cli("11-09")
        self.assertEqual(code, 0)
        self.assertIn("lapkričio 9 d.", out)

    def test_name(self):
        code, out = self.run_cli("--vardas", "azuolas")
        self.assertEqual(code, 0)
        self.assertIn("d.", out)

    def test_name_missing(self):
        self.assertEqual(self.run_cli("--vardas", "Xyzzy")[0], 1)

    def test_month_json(self):
        code, out = self.run_cli("--menuo", "12", "--json")
        self.assertEqual(code, 0)
        self.assertEqual(len(json.loads(out)), 31)

    def test_bad_month(self):
        self.assertEqual(self.run_cli("--menuo", "13")[0], 2)


if __name__ == "__main__":
    unittest.main()

