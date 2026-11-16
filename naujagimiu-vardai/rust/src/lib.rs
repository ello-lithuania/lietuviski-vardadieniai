//! # naujagimiu-vardai
//!
//! Populiariausi Lietuvos naujagimių vardai (2024 m., VĮ Registrų centras, atviri duomenys
//! data.gov.lt). Most popular newborn names in Lithuania – girls and boys with ranks and the
//! number of babies. No dependencies.
//!
//! Baptism names with meanings and name days: <https://krikstynudovana.lt/kriksto-vardai/>
//!
//! ```
//! use naujagimiu_vardai::{find, top, Gender};
//!
//! assert_eq!(top(Gender::Girls, 1)[0].name, "Sofija");
//! let (gender, entry) = find("lukne").unwrap();
//! assert_eq!(gender, Gender::Girls);
//! assert_eq!(entry.name, "Luknė");
//! ```
//!
//! Code: MIT. Data: CC BY 4.0 (VĮ Registrų centras).
#![forbid(unsafe_code)]
#![warn(missing_docs)]

mod data;

/// Baptism names guide (Lithuanian).
pub const HOMEPAGE: &str = "https://krikstynudovana.lt/kriksto-vardai/";

/// Year of the statistics.
pub const YEAR: u32 = 2024;

/// Which list.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum Gender {
    /// Girls (`mergaitės`).
    Girls,
    /// Boys (`berniukai`).
    Boys,
}

/// A name in the list.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct Name {
    /// Place in the list (names with the same count may share the neighbouring places).
    pub rank: u32,
    /// The name.
    pub name: &'static str,
    /// Number of newborns registered with this name.
    pub babies: u32,
}

/// The full list for a gender, ordered by rank.
pub fn list(gender: Gender) -> &'static [Name] {
    match gender {
        Gender::Girls => data::GIRLS,
        Gender::Boys => data::BOYS,
    }
}

/// The `n` most popular names (or the whole list if it is shorter).
pub fn top(gender: Gender, n: usize) -> &'static [Name] {
    let names = list(gender);
    &names[..n.min(names.len())]
}

/// Lowercases the text and removes Lithuanian diacritics (`Ąžuolas` -> `azuolas`).
pub fn fold(text: &str) -> String {
    text.trim()
        .chars()
        .flat_map(char::to_lowercase)
        .map(|c| match c {
            'ą' | 'à' | 'á' | 'â' | 'ä' | 'ã' | 'å' | 'ā' => 'a',
            'č' | 'ç' | 'ć' => 'c',
            'ę' | 'ė' | 'è' | 'é' | 'ê' | 'ë' | 'ē' => 'e',
            'į' | 'ì' | 'í' | 'î' | 'ï' | 'ī' => 'i',
            'š' | 'ś' => 's',
            'ų' | 'ū' | 'ù' | 'ú' | 'û' | 'ü' => 'u',
            'ž' | 'ź' | 'ż' => 'z',
            'ò' | 'ó' | 'ô' | 'ö' | 'õ' | 'ō' => 'o',
            'ñ' | 'ń' => 'n',
            'ł' => 'l',
            other => other,
        })
        .collect()
}

/// Finds a name in either list. Case and diacritics are ignored, so `"lukne"` finds `Luknė`.
pub fn find(name: &str) -> Option<(Gender, &'static Name)> {
    let wanted = fold(name);
    for gender in [Gender::Girls, Gender::Boys] {
        if let Some(entry) = list(gender).iter().find(|n| fold(n.name) == wanted) {
            return Some((gender, entry));
        }
    }
    None
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn lists() {
        assert_eq!(list(Gender::Girls).len(), 30);
        assert_eq!(list(Gender::Boys).len(), 25);
        assert_eq!(top(Gender::Girls, 3).len(), 3);
        assert_eq!(top(Gender::Boys, 1000).len(), 25);
        assert!(list(Gender::Girls).windows(2).all(|w| w[0].babies >= w[1].babies));
    }

    #[test]
    fn search() {
        assert_eq!(find("SOFIJA").map(|(g, n)| (g, n.rank)), Some((Gender::Girls, 1)));
        assert!(find("nera-tokio").is_none());
        assert_eq!(fold("Lėja"), "leja");
    }
}
