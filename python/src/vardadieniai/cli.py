"""Komandinė eilutė: `vardadieniai`."""
from __future__ import annotations

import argparse
import json
import re
import sys

from . import __version__
from . import core


def _parser():
    p = argparse.ArgumentParser(
        prog="vardadieniai",
        description="Lietuviški vardadieniai. Be argumentų – šiandien ir rytoj (Vilniaus laiku).",
        epilog="Pilnas kalendorius žmonėms: " + core.HOMEPAGE + "  Duomenys: CC BY-SA 4.0, kodas: MIT.",
    )
    p.add_argument("data", nargs="?", metavar="MM-DD", help="data, pvz. 11-09")
    p.add_argument("--vardas", "-v", metavar="VARDAS", help="kada švenčiamas vardas (be diakritikų: azuolas)")
    p.add_argument("--menuo", "-m", type=int, metavar="1-12", help="visas mėnuo")
    p.add_argument("--json", action="store_true", help="išvestis JSON formatu")
    p.add_argument("--version", action="version", version="vardadieniai " + __version__)
    return p


def _out(args, obj, text):
    if args.json:
        print(json.dumps(obj, ensure_ascii=False, indent=2))
    else:
        print(text)


def _line(key, names):
    return "%s: %s" % (core.format_date(key), ", ".join(names))


def _run(args, p):
    if args.vardas:
        days = core.days_for(args.vardas)
        if not days:
            print("Vardo „%s“ kalendoriuje nerasta." % args.vardas, file=sys.stderr)
            return 1
        _out(args, {"vardas": args.vardas, "datos": days},
             "%s vardadienį švenčia: %s" % (args.vardas, "; ".join(core.format_date(d) for d in days)))
        return 0
    if args.menuo is not None:
        data = core.month(args.menuo)
        _out(args, data, "\n".join(_line(k, v) for k, v in data.items()))
        return 0
    if args.data:
        m = re.fullmatch(r"(?:\d{4}-)?(\d{1,2})[-./](\d{1,2})", args.data.strip())
        if not m:
            p.error("data turi būti MM-DD, pvz. 11-09")
        names = core.names_on(m.group(1), m.group(2))
        key = "%02d-%02d" % (int(m.group(1)), int(m.group(2)))
        _out(args, {"data": key, "vardai": names}, _line(key, names))
        return 0
    t, n = core.today(), core.tomorrow()
    _out(args, {"siandien": {"data": t["date"], "vardai": t["names"]},
                "rytoj": {"data": n["date"], "vardai": n["names"]}},
         "Šiandien (%s): %s\nRytoj (%s): %s" % (core.format_date(t["date"]), ", ".join(t["names"]),
                                                 core.format_date(n["date"]), ", ".join(n["names"])))
    return 0


def main(argv=None):
    try:
        sys.stdout.reconfigure(encoding="utf-8")
        sys.stderr.reconfigure(encoding="utf-8")
    except Exception:
        pass
    p = _parser()
    args = p.parse_args(argv)
    try:
        return _run(args, p)
    except ValueError as e:
        print(str(e), file=sys.stderr)
        return 2
