//! `vardadieniai` – Lithuanian name days on the command line.

use std::env;
use std::process::ExitCode;

const HELP: &str = "vardadieniai – lietuviški vardadieniai (Lithuanian name days)

Naudojimas:
  vardadieniai                 šiandien ir rytoj (Vilniaus laiku)
  vardadieniai MM-DD           kas švenčia tą dieną, pvz. 11-09
  vardadieniai --vardas VARDAS kada švenčiamas vardas (galima be diakritikų)
  vardadieniai --menuo 1-12    visas mėnuo
  vardadieniai --version

Kalendorius su sveikinimais: https://dovanasuvardu.lt/vardadieniai/
Duomenys: CC BY-SA 4.0, kodas: MIT.
";

fn line(month: u32, day: u32, names: &[&str]) -> String {
    let list = if names.is_empty() { String::from("—") } else { names.join(", ") };
    format!("{}: {}", vardadieniai::format_date(month, day), list)
}

fn parse_md(text: &str) -> Option<(u32, u32)> {
    let parts: Vec<&str> = text.trim().split(|c: char| c == '-' || c == '.' || c == '/').collect();
    let (m, d) = match parts.len() {
        2 => (parts[0], parts[1]),
        3 => (parts[1], parts[2]),
        _ => return None,
    };
    let m: u32 = m.parse().ok()?;
    let d: u32 = d.parse().ok()?;
    if (1..=12).contains(&m) && (1..=vardadieniai::days_in_month(2024, m)).contains(&d) {
        Some((m, d))
    } else {
        None
    }
}

fn fail(message: &str) -> ExitCode {
    eprintln!("{}", message);
    ExitCode::from(2)
}

fn main() -> ExitCode {
    let args: Vec<String> = env::args().skip(1).collect();
    let mut name: Option<String> = None;
    let mut month: Option<String> = None;
    let mut date: Option<String> = None;
    let mut i = 0;
    while i < args.len() {
        match args[i].as_str() {
            "-h" | "--help" => {
                print!("{}", HELP);
                return ExitCode::SUCCESS;
            }
            "-V" | "--version" => {
                println!("vardadieniai {}", env!("CARGO_PKG_VERSION"));
                return ExitCode::SUCCESS;
            }
            "-v" | "--vardas" => {
                i += 1;
                name = args.get(i).cloned();
            }
            "-m" | "--menuo" => {
                i += 1;
                month = args.get(i).cloned();
            }
            other if other.starts_with('-') && parse_md(other).is_none() => {
                return fail(&format!("Nežinomas parametras: {}. Žr. vardadieniai --help", other));
            }
            other => date = Some(other.to_string()),
        }
        i += 1;
    }

    if let Some(name) = name {
        let days = vardadieniai::days_for(&name);
        if days.is_empty() {
            eprintln!("Vardo „{}“ kalendoriuje nerasta.", name);
            return ExitCode::from(1);
        }
        let list: Vec<String> = days.iter().map(|&(m, d)| vardadieniai::format_date(m, d)).collect();
        println!("{} vardadienį švenčia: {}", name, list.join("; "));
        return ExitCode::SUCCESS;
    }
    if let Some(month) = month {
        let m: u32 = match month.parse() {
            Ok(m) if (1..=12).contains(&m) => m,
            _ => return fail("Mėnuo turi būti 1–12"),
        };
        for (day, names) in vardadieniai::month(m) {
            println!("{}", line(m, day, names));
        }
        return ExitCode::SUCCESS;
    }
    if let Some(date) = date {
        return match parse_md(&date) {
            Some((m, d)) => {
                println!("{}", line(m, d, vardadieniai::names_on(m, d)));
                ExitCode::SUCCESS
            }
            None => fail("Data turi būti MM-DD, pvz. 11-09"),
        };
    }
    let today = vardadieniai::vilnius_today();
    let tomorrow = today.next_day();
    println!("Šiandien, {}", line(today.month, today.day, vardadieniai::names_on(today.month, today.day)));
    println!("Rytoj, {}", line(tomorrow.month, tomorrow.day, vardadieniai::names_on(tomorrow.month, tomorrow.day)));
    println!("Daugiau: {}", vardadieniai::HOMEPAGE);
    ExitCode::SUCCESS
}
