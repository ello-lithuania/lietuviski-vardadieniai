# naujagimiu-vardai (Rust)

Populiariausi Lietuvos naujagimių vardai (2024 m., VĮ Registrų centras, data.gov.lt) – Rust biblioteka ir komandinės eilutės įrankis, be priklausomybių.
Most popular newborn names in Lithuania: girls and boys with ranks and the number of babies.

Krikšto vardai su reikšmėmis ir vardadieniais: **[krikstynudovana.lt/kriksto-vardai](https://krikstynudovana.lt/kriksto-vardai/)**

```rust
use naujagimiu_vardai::{find, top, Gender};

for n in top(Gender::Girls, 5) {
    println!("{}. {} – {}", n.rank, n.name, n.babies);
}
let (gender, entry) = find("lukne").unwrap();   // Luknė, diacritics optional
```

```sh
cargo install naujagimiu-vardai
naujagimiu-vardai --top 5
naujagimiu-vardai --lytis berniukai
naujagimiu-vardai --vardas jonas
```

The same data as a Python package: [github.com/ello-lithuania/lietuviski-vardadieniai](https://github.com/ello-lithuania/lietuviski-vardadieniai/tree/main/naujagimiu-vardai).

Code: MIT. Data: CC BY 4.0 (VĮ Registrų centras).
