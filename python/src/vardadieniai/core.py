"""Lietuviški vardadieniai: duomenys ir paieška. Kodas – MIT, duomenys – CC BY-SA 4.0."""
from __future__ import annotations

import datetime as _dt
import json
import unicodedata
from functools import lru_cache
from importlib import resources

HOMEPAGE = "https://dovanasuvardu.lt/vardadieniai/"
MONTHS_LT = ["sausio", "vasario", "kovo", "balandžio", "gegužės", "birželio",
             "liepos", "rugpjūčio", "rugsėjo", "spalio", "lapkričio", "gruodžio"]
MONTHS_LT_NOM = ["Sausis", "Vasaris", "Kovas", "Balandis", "Gegužė", "Birželis",
                 "Liepa", "Rugpjūtis", "Rugsėjis", "Spalis", "Lapkritis", "Gruodis"]


def _load(name):
    with resources.files("vardadieniai").joinpath("data", name).open("r", encoding="utf-8") as f:
        return json.load(f)


@lru_cache(maxsize=1)
def _days():
    return _load("vardadieniai.json")


@lru_cache(maxsize=1)
def _names():
    return _load("vardai.json")


def fold(text):
    """Be diakritikų ir didžiųjų raidžių: 'Ąžuolas' -> 'azuolas'."""
    nfd = unicodedata.normalize("NFD", str(text).strip())
    return "".join(c for c in nfd if unicodedata.category(c) != "Mn").casefold()


@lru_cache(maxsize=1)
def _folded():
    idx = {}
    for name, dates in _names().items():
        bucket = idx.setdefault(fold(name), {})
        bucket.setdefault(name, [])
        for d in dates:
            if d not in bucket[name]:
                bucket[name].append(d)
    return idx


def _vilnius_now():
    """Dabar Lietuvoje (Europe/Vilnius); be tzdata – rankinis EET/EEST skaičiavimas."""
    utc = _dt.datetime.now(_dt.timezone.utc)
    try:
        from zoneinfo import ZoneInfo
        return utc.astimezone(ZoneInfo("Europe/Vilnius"))
    except Exception:
        pass

    def last_sunday(year, month):
        d = _dt.datetime(year, month, 31, 1, tzinfo=_dt.timezone.utc)
        return d - _dt.timedelta(days=(d.weekday() + 1) % 7)

    summer = last_sunday(utc.year, 3) <= utc < last_sunday(utc.year, 10)
    return utc.astimezone(_dt.timezone(_dt.timedelta(hours=3 if summer else 2)))


def _key(month, day):
    month, day = int(month), int(day)
    if not (1 <= month <= 12 and 1 <= day <= 31):
        raise ValueError("Neteisinga data: %s-%s" % (month, day))
    key = "%02d-%02d" % (month, day)
    if key not in _days():
        raise ValueError("Tokios dienos nėra: %s" % key)
    return key


def names_on(month, day):
    """Vardai, švenčiantys vardadienį nurodytą dieną (sąrašas)."""
    return list(_days()[_key(month, day)])


def today(now=None):
    """Šiandienos (Vilniaus laiku) vardadieniai: {'date': 'MM-DD', 'names': [...]}."""
    now = now or _vilnius_now()
    key = _key(now.month, now.day)
    return {"date": key, "names": list(_days()[key])}


def tomorrow(now=None):
    now = now or _vilnius_now()
    n = now + _dt.timedelta(days=1)
    key = _key(n.month, n.day)
    return {"date": key, "names": list(_days()[key])}


def days_for(name):
    """Datos ('MM-DD'), kada švenčiamas vardas; ignoruoja diakritikus ir raidžių dydį."""
    found = []
    for dates in _folded().get(fold(name), {}).values():
        for d in dates:
            if d not in found:
                found.append(d)
    return sorted(found)


def month(m):
    """Visas mėnuo: {'MM-DD': [vardai]} (m = 1..12)."""
    m = int(m)
    if not 1 <= m <= 12:
        raise ValueError("Mėnuo turi būti 1–12")
    prefix = "%02d-" % m
    return {k: list(v) for k, v in sorted(_days().items()) if k.startswith(prefix)}


def format_date(key):
    m, d = key.split("-")
    return "%s %s d." % (MONTHS_LT[int(m) - 1], int(d))
