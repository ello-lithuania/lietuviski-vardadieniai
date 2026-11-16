//! # vardadieniai
//!
//! Lietuvos vardadienių kalendorius: kurie vardai švenčiami pasirinktą dieną, kada švenčia
//! konkretus vardas ir kas švenčia šiandien (Vilniaus laiku). Lithuanian name day calendar:
//! names by date, dates by name and today's names in Europe/Vilnius time. No dependencies.
//!
//! The calendar for people, with today's and tomorrow's names, greetings and gift ideas:
//! <https://dovanasuvardu.lt/vardadieniai/>
//!
//! ```
//! assert!(vardadieniai::names_on(11, 9).contains(&"Teodoras"));
//! assert!(vardadieniai::days_for("ąžuolas").iter().all(|&(m, _)| (1..=12).contains(&m)));
//! assert_eq!(vardadieniai::format_date(11, 9), "lapkričio 9 d.");
//! ```
//!
//! Code: MIT. Name day data: CC BY-SA 4.0 (source: Lithuanian Wikipedia).
#![forbid(unsafe_code)]
#![warn(missing_docs)]

mod data;
mod date;

pub use date::{days_in_month, is_leap, vilnius_date, vilnius_today, Date};

/// Online name day calendar (Lithuanian).
pub const HOMEPAGE: &str = "https://dovanasuvardu.lt/vardadieniai/";

/// Lithuanian month names in the genitive case (`sausio` … `gruodžio`).
pub const MONTHS_LT: [&str; 12] = ["sausio", "vasario", "kovo", "balandžio", "gegužės", "birželio", "liepos", "rugpjūčio", "rugsėjo", "spalio", "lapkričio", "gruodžio"];

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

/// Names celebrated on the given day (`month` 1–12, `day` 1–31).
/// Returns an empty slice for a date that is not in the calendar.
pub fn names_on(month: u32, day: u32) -> &'static [&'static str] {
    data::DAYS
        .iter()
        .find(|&&(m, d, _)| u32::from(m) == month && u32::from(d) == day)
        .map(|&(_, _, names)| names)
        .unwrap_or(&[])
}

/// Days `(month, day)` on which the name is celebrated. Case and diacritics are ignored,
/// so `"azuolas"` finds `Ąžuolas`.
pub fn days_for(name: &str) -> Vec<(u32, u32)> {
    let wanted = fold(name);
    data::DAYS
        .iter()
        .filter(|(_, _, names)| names.iter().any(|n| fold(n) == wanted))
        .map(|&(m, d, _)| (u32::from(m), u32::from(d)))
        .collect()
}

/// All days of a month (`1..=12`) with their names, in calendar order.
pub fn month(month: u32) -> Vec<(u32, &'static [&'static str])> {
    data::DAYS
        .iter()
        .filter(|&&(m, _, _)| u32::from(m) == month)
        .map(|&(_, d, names)| (u32::from(d), names))
        .collect()
}

/// Names celebrated today in Lithuania.
pub fn today() -> &'static [&'static str] {
    let t = vilnius_today();
    names_on(t.month, t.day)
}

/// Names celebrated tomorrow in Lithuania.
pub fn tomorrow() -> &'static [&'static str] {
    let t = vilnius_today().next_day();
    names_on(t.month, t.day)
}

/// Lithuanian date label, e.g. `format_date(11, 9)` = `"lapkričio 9 d."`.
pub fn format_date(month: u32, day: u32) -> String {
    match month {
        1..=12 => format!("{} {} d.", MONTHS_LT[(month - 1) as usize], day),
        _ => format!("{}-{}", month, day),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn calendar_has_every_day() {
        assert_eq!(data::DAYS.len(), 366);
        for m in 1..=12 {
            assert_eq!(month(m).len() as u32, days_in_month(2024, m));
        }
    }

    #[test]
    fn lookups() {
        assert!(names_on(11, 9).contains(&"Teodoras"));
        assert!(names_on(2, 30).is_empty());
        assert!(days_for("TEODORAS").contains(&(11, 9)));
        assert!(days_for("nera-tokio-vardo").is_empty());
        assert_eq!(fold(" Ąžuolas "), "azuolas");
        assert_eq!(format_date(1, 1), "sausio 1 d.");
    }
}
