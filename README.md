# Lietuvos vardadienių kalendorius (JSON / CSV)

Atviri lietuviškų vardadienių duomenys visoms 366 metų dienoms (įskaitant vasario 29 d.) – programėlėms, kalendoriams, botams ir svetainėms.

- `vardadieniai.json` – `{"MM-DD": ["Vardas", ...]}`, 366 dienos;
- `vardadieniai.csv` – `data,vardai` (vardai atskirti `; `);
- `vardai.json` – atvirkštinis indeksas `{"Vardas": ["MM-DD", ...]}` (paieškai pagal vardą).

Dienos viduje pirmi eina vardai, kuriuos nurodo visi tikrinti šaltiniai, toliau – retesni (dažniausiai baltiškos kilmės) vardai.

Paieška pagal vardą, šiandienos ir rytdienos vardadieniai bei spausdinamas PDF kalendorius: **[dovanasuvardu.lt/vardadieniai](https://dovanasuvardu.lt/vardadieniai/)**

## Struktūra

| Failas | Formatas | Kiekis |
|---|---|---|
| `vardadieniai.json` | `{"MM-DD": ["Vardas", ...]}` | 366 dienos (su 02-29) |
| `vardadieniai.csv` | `data,vardai`, UTF-8, vardai atskirti `; ` | 366 eilutės |
| `vardai.json` | `{"Vardas": ["MM-DD", ...]}` | 2 381 skirtingas vardas |

Vardai rašomi vardininku. Tas pats vardas gali būti keliose dienose (keli šventieji / kalendorių tradicijos).

## Vardadieniai pagal mėnesius

[Sausis](https://dovanasuvardu.lt/vardadieniai-sausio/) · [Vasaris](https://dovanasuvardu.lt/vardadieniai-vasario/) · [Kovas](https://dovanasuvardu.lt/vardadieniai-kovo/) · [Balandis](https://dovanasuvardu.lt/vardadieniai-balandzio/) · [Gegužė](https://dovanasuvardu.lt/vardadieniai-geguzes/) · [Birželis](https://dovanasuvardu.lt/vardadieniai-birzelio/) · [Liepa](https://dovanasuvardu.lt/vardadieniai-liepos/) · [Rugpjūtis](https://dovanasuvardu.lt/vardadieniai-rugpjucio/) · [Rugsėjis](https://dovanasuvardu.lt/vardadieniai-rugsejo/) · [Spalis](https://dovanasuvardu.lt/vardadieniai-spalio/) · [Lapkritis](https://dovanasuvardu.lt/vardadieniai-lapkricio/) · [Gruodis](https://dovanasuvardu.lt/vardadieniai-gruodzio/)

Taip pat: [šiandienos ir rytdienos vardadieniai](https://dovanasuvardu.lt/vardadieniai-siandien/), [sveikinimai su vardadieniu](https://dovanasuvardu.lt/sveikinimai-su-vardadieniu/), [2027 metų kalendorius](https://dovanasuvardu.lt/kalendorius-2027/).

## Pavyzdys (JavaScript)

```js
const V = await fetch("https://raw.githubusercontent.com/ello-lithuania/lietuviski-vardadieniai/main/vardadieniai.json").then(r => r.json());
const d = new Intl.DateTimeFormat("en-CA", { timeZone: "Europe/Vilnius", month: "2-digit", day: "2-digit" }).format(new Date());
console.log("Šiandien vardadienius švenčia:", V[d].join(", "));
```

## Šaltiniai

Pagrindinis šaltinis – lietuviškoji Vikipedija (dienų straipsnių skyrius „Vardadieniai“, 2026-10-30), sutikrinta su day.lt ir tv3.lt kalendoriais. Dėl retų vardų kalendoriai kartais skiriasi – laikomasi Vikipedijos sąrašo.

## Kaip cituoti

Žr. [`CITATION.cff`](CITATION.cff) (GitHub rodo mygtuką „Cite this repository“). Trumpai: *dovanasuvardu.lt, Lietuvos vardadienių kalendorius, 2026, CC BY-SA 4.0.*

## Pataisos

Radote klaidą ar trūkstamą vardą? Atidarykite „Issue“ nurodydami dieną, vardą ir šaltinį (pvz., Vikipedijos straipsnį).

## Licencija

Duomenys platinami pagal [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.lt) (kaip ir Vikipedijos turinys). Naudodami nurodykite šaltinį: „Vikipedija / [dovanasuvardu.lt](https://dovanasuvardu.lt/vardadieniai/)“.

---

*Lithuanian name days (vardadieniai) for all 366 days as JSON/CSV. Source: Lithuanian Wikipedia, cross-checked. License: CC BY-SA 4.0. Name search and printable calendar: [dovanasuvardu.lt/vardadieniai](https://dovanasuvardu.lt/vardadieniai/).*
