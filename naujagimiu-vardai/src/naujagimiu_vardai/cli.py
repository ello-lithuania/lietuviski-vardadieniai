"""Komandinė eilutė: `naujagimiu-vardai`."""
from __future__ import annotations

import argparse
import json

from . import __version__
from . import core


def main(argv=None) -> int:
    p = argparse.ArgumentParser(
        prog="naujagimiu-vardai",
        description="Populiariausi Lietuvos naujagimių vardai (%d m., %s)." % (core.DATA["metai"], core.DATA["saltinis"]),
        epilog="Krikšto vardai, jų reikšmės ir krikštynų dovanos: " + core.HOMEPAGE + "  Duomenys: CC BY 4.0, kodas: MIT.",
    )
    p.add_argument("--lytis", "-l", default="abi", choices=["abi", "mergaites", "berniukai"], help="kurio sąrašo rodyti")
    p.add_argument("--top", "-n", type=int, default=10, help="kiek vardų (iki 20)")
    p.add_argument("--vardas", "-v", help="kelintas vardas sąraše (galima be diakritikų)")
    p.add_argument("--json", action="store_true", help="išvestis JSON formatu")
    p.add_argument("--version", action="version", version="naujagimiu-vardai " + __version__)
    a = p.parse_args(argv)
    if a.vardas:
        r = core.find(a.vardas)
        if a.json:
            print(json.dumps(r, ensure_ascii=False, indent=2))
        elif r:
            print("%s – %d vieta (%s), %d vaikų TOP 20 ketvirčiuose" % (r["vardas"], r["vieta"], "mergaitės" if r["lytis"] == "mergaites" else "berniukai", r["vaiku"]))
        else:
            print("Vardo nėra tarp populiariausių %d m. vardų." % core.DATA["metai"])
        return 0
    n = max(1, min(a.top, 20))
    lytys = ["mergaites", "berniukai"] if a.lytis == "abi" else [a.lytis]
    out = {k: core.top(k, n) for k in lytys}
    if a.json:
        print(json.dumps(out, ensure_ascii=False, indent=2))
        return 0
    for k in lytys:
        print("Mergaitės:" if k == "mergaites" else "Berniukai:")
        for r in out[k]:
            print("  %2d. %s" % (r["vieta"], r["vardas"]))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
