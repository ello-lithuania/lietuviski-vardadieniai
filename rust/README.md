# vardadieniai (Rust)

Lietuvos vardadienių kalendorius Rust kalba – biblioteka ir komandinės eilutės įrankis, be priklausomybių.
Lithuanian name day calendar for Rust: names by date, dates by name, today's names in Europe/Vilnius time.

Kalendorius žmonėms – šiandienos ir rytojaus vardadieniai, sveikinimai ir dovanų idėjos:
**[dovanasuvardu.lt/vardadieniai](https://dovanasuvardu.lt/vardadieniai/)**

```rust
let names = vardadieniai::names_on(11, 9);      // ["Dargintas", "Estela", ...]
let days = vardadieniai::days_for("azuolas");   // [(month, day), ...] – diacritics optional
let today = vardadieniai::today();              // today's names in Lithuania
```

```sh
cargo install vardadieniai
vardadieniai                  # šiandien ir rytoj
vardadieniai 11-09            # kas švenčia lapkričio 9 d.
vardadieniai --vardas azuolas # kada švenčia Ąžuolas
vardadieniai --menuo 12       # visas gruodis
```

The same data as JSON / CSV and as a Python package: [github.com/ello-lithuania/lietuviski-vardadieniai](https://github.com/ello-lithuania/lietuviski-vardadieniai).

Code: MIT. Data: CC BY-SA 4.0 (source: Lithuanian Wikipedia).
