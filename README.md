# Lietuvos vardadienių kalendorius (JSON / CSV)

Atviri lietuviškų vardadienių duomenys visoms 366 metų dienoms (įskaitant vasario 29 d.) – programėlėms, kalendoriams, botams ir svetainėms.

- `vardadieniai.json` – `{"MM-DD": ["Vardas", ...]}`, 366 dienos;
- `vardadieniai.csv` – `data,vardai` (vardai atskirti `; `);
- `vardai.json` – atvirkštinis indeksas `{"Vardas": ["MM-DD", ...]}` (paieškai pagal vardą).

Dienos viduje pirmi eina vardai, kuriuos nurodo visi tikrinti šaltiniai, toliau – retesni (dažniausiai baltiškos kilmės) vardai.

Paieška pagal vardą, šiandienos ir rytdienos vardadieniai bei spausdinamas PDF kalendorius: **[dovanasuvardu.lt/vardadieniai](https://dovanasuvardu.lt/vardadieniai/)**

## Pavyzdys (JavaScript)

```js
const V = await fetch("https://raw.githubusercontent.com/ello-lithuania/lietuviski-vardadieniai/main/vardadieniai.json").then(r => r.json());
const d = new Intl.DateTimeFormat("en-CA", { timeZone: "Europe/Vilnius", month: "2-digit", day: "2-digit" }).format(new Date());
console.log("Šiandien vardadienius švenčia:", V[d].join(", "));
```

## Šaltiniai

Pagrindinis šaltinis – lietuviškoji Vikipedija (dienų straipsnių skyrius „Vardadieniai“, 2026-10-30), sutikrinta su day.lt ir tv3.lt kalendoriais. Dėl retų vardų kalendoriai kartais skiriasi – laikomasi Vikipedijos sąrašo.

## Licencija

Duomenys platinami pagal [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.lt) (kaip ir Vikipedijos turinys). Naudodami nurodykite šaltinį: „Vikipedija / [dovanasuvardu.lt](https://dovanasuvardu.lt/vardadieniai/)“.

---

*Lithuanian name days (vardadieniai) for all 366 days as JSON/CSV. Source: Lithuanian Wikipedia, cross-checked. License: CC BY-SA 4.0. Name search and printable calendar: [dovanasuvardu.lt/vardadieniai](https://dovanasuvardu.lt/vardadieniai/).*
