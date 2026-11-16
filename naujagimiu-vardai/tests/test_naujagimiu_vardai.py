import unittest

from naujagimiu_vardai import core, cli


class T(unittest.TestCase):
    def test_top(self):
        self.assertEqual(core.top("mergaites", 1)[0]["vardas"], "Sofija")
        self.assertEqual(len(core.top("berniukai", 5)), 5)

    def test_find(self):
        self.assertEqual(core.find("sofija")["vieta"], 1)
        self.assertIsNone(core.find("Zzzz"))

    def test_cli(self):
        self.assertEqual(cli.main([]), 0)
        self.assertEqual(cli.main(["--vardas", "Amelija", "--json"]), 0)


if __name__ == "__main__":
    unittest.main()
