"""Populiariausi naujagimių vardai (Registrų centras, 2024 m.)."""
from __future__ import annotations

import json
import unicodedata
from importlib import resources

HOMEPAGE = "https://krikstynudovana.lt/kriksto-vardai/"

with resources.files(__package__).joinpath("data/vardai-2024.json").open(encoding="utf-8") as _f:
    DATA = json.load(_f)

LYTYS = {"mergaites": "mergaites", "mergaitės": "mergaites", "m": "mergaites", "berniukai": "berniukai", "b": "berniukai"}


def _norm(s: str) -> str:
    return "".join(c for c in unicodedata.normalize("NFD", s.lower()) if unicodedata.category(c) != "Mn")


def top(lytis: str = "mergaites", n: int = 10):
    """TOP n vardų: lytis – mergaites / berniukai."""
    return DATA[LYTYS[lytis]][:n]


def find(vardas: str):
    """Vardo vieta sąraše (ieško ir be diakritikų) arba None."""
    v = _norm(vardas)
    for k in ("mergaites", "berniukai"):
        for r in DATA[k]:
            if _norm(r["vardas"]) == v:
                return dict(r, lytis=k)
    return None
