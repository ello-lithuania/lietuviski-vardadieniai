//! `naujagimiu-vardai` – most popular newborn names in Lithuania on the command line.

use naujagimiu_vardai::{find, top, Gender, YEAR};
use std::env;
use std::process::ExitCode;

const HELP: &str = "naujagimiu-vardai – populiariausi Lietuvos naujagimių vardai

Naudojimas:
  naujagimiu-vardai                     TOP 10 mergaičių ir berniukų vardų
  naujagimiu-vardai --top N             TOP N
  naujagimiu-vardai --lytis mergaites   tik mergaitės (arba: berniukai, abi)
  naujagimiu-vardai --vardas VARDAS     kelintas vardas sąraše (galima be diakritikų)
  naujagimiu-vardai --version

Krikšto vardai su reikšmėmis ir vardadieniais: https://krikstynudovana.lt/kriksto-vardai/
Duomenys: VĮ Registrų centras (data.gov.lt), CC BY 4.0. Kodas: MIT.
";

fn title(gender: Gender) -> &'static str {
    match gender {
        Gender::Girls => "Mergaitės",
        Gender::Boys => "Berniukai",
    }
}

fn fail(message: &str) -> ExitCode {
    eprintln!("{}", message);
    ExitCode::from(2)
}

fn main() -> ExitCode {
    let args: Vec<String> = env::args().skip(1).collect();
    let mut n = 10_usize;
    let mut genders = vec![Gender::Girls, Gender::Boys];
    let mut name: Option<String> = None;
    let mut i = 0;
    while i < args.len() {
        match args[i].as_str() {
            "-h" | "--help" => {
                print!("{}", HELP);
                return ExitCode::SUCCESS;
            }
            "-V" | "--version" => {
                println!("naujagimiu-vardai {}", env!("CARGO_PKG_VERSION"));
                return ExitCode::SUCCESS;
            }
            "-n" | "--top" => {
                i += 1;
                n = match args.get(i).and_then(|v| v.parse().ok()) {
                    Some(v) if v > 0 => v,
                    _ => return fail("--top reikia teigiamo skaičiaus"),
                };
            }
            "-l" | "--lytis" => {
                i += 1;
                genders = match args.get(i).map(|v| v.as_str()) {
                    Some("mergaites") | Some("mergaitės") | Some("m") => vec![Gender::Girls],
                    Some("berniukai") | Some("b") => vec![Gender::Boys],
                    Some("abi") => vec![Gender::Girls, Gender::Boys],
                    _ => return fail("--lytis: mergaites, berniukai arba abi"),
                };
            }
            "-v" | "--vardas" => {
                i += 1;
                name = args.get(i).cloned();
            }
            other => return fail(&format!("Nežinomas parametras: {}. Žr. naujagimiu-vardai --help", other)),
        }
        i += 1;
    }

    if let Some(name) = name {
        return match find(&name) {
            Some((gender, entry)) => {
                println!(
                    "{} – {} vieta tarp {} m. {} vardų ({} naujagimiai).",
                    entry.name,
                    entry.rank,
                    YEAR,
                    if gender == Gender::Girls { "mergaičių" } else { "berniukų" },
                    entry.babies
                );
                ExitCode::SUCCESS
            }
            None => {
                println!("Vardo „{}“ {} m. populiariausių vardų sąraše nėra.", name, YEAR);
                ExitCode::SUCCESS
            }
        };
    }
    for gender in genders {
        println!("{} ({} m.):", title(gender), YEAR);
        for entry in top(gender, n) {
            println!("{:>3}. {} – {}", entry.rank, entry.name, entry.babies);
        }
    }
    println!("Daugiau: {}", naujagimiu_vardai::HOMEPAGE);
    ExitCode::SUCCESS
}
