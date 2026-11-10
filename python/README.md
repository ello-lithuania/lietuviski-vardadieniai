# vardadieniai

Lithuanian name days (*vardadieniai*) for all 366 days: a dependency-free Python library and command-line tool.
Pure Python >= 3.9, data bundled as JSON.

**Full calendar for humans** (name search, today/tomorrow, printable PDF): <https://dovanasuvardu.lt/vardadieniai/>

## Install

```
pip install vardadieniai
```

## Python API

```python
import vardadieniai as v

v.today()                 # {'date': '11-10', 'names': [...]}  (Europe/Vilnius time)
v.tomorrow()
v.names_on(6, 2)          # ['Justas', ...]
v.days_for("Ąžuolas")     # ['MM-DD', ...]; "azuolas" and "AZUOLAS" give the same result
v.month(12)               # {'12-01': [...], ..., '12-31': [...]}
```

## CLI

```
vardadieniai                    # today and tomorrow (Vilnius time)
vardadieniai 11-09              # a given date
vardadieniai --vardas Justas    # when is a name celebrated (diacritics optional)
vardadieniai --menuo 12         # whole month
vardadieniai --json             # JSON output
vardadieniai --help
```

Example:

```
$ vardadieniai
Šiandien (lapkričio 10 d.): Andrius, Leonas, Vaišviltas, Evelina, Dainius, Galvydė, Vaišvilas, Vaišvilė
Rytoj (lapkričio 11 d.): ...
```

## Data and licence

- **Code: MIT** (`LICENSE`).
- **Data: CC BY-SA 4.0** (`DATA_LICENSE`). Source: Lithuanian Wikipedia (day articles, "Vardadieniai" section, 2026-10-30), cross-checked with day.lt and tv3.lt. Please credit "Wikipedia / dovanasuvardu.lt (https://dovanasuvardu.lt/vardadieniai/)".

Dataset (JSON/CSV) repository: <https://github.com/ello-lithuania/lietuviski-vardadieniai>

Author: KokybiskaSvetaine.lt (Justas Arbatauskis), info@kokybiskasvetaine.lt

## Trumpai lietuviškai

Lietuviškų vardadienių kalendorius Python programoms ir komandinei eilutei: šiandienos ir rytojaus vardai (pagal Vilniaus laiką), vardai pagal datą, datos pagal vardą (diakritikai nebūtini: „Ąžuolas“ = „azuolas“), visas mėnuo. Be priklausomybių, duomenys įpakuoti. Kodas – MIT, duomenys – CC BY-SA 4.0 (šaltinis: lietuviškoji Vikipedija). Pilną kalendorių žmonėms rasite čia: <https://dovanasuvardu.lt/vardadieniai/>.
