//! Minimal calendar helpers (no dependencies): civil dates and the Lithuanian time zone.

use std::time::{SystemTime, UNIX_EPOCH};

/// A calendar date (proleptic Gregorian calendar).
#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub struct Date {
    /// Year, e.g. `2026`.
    pub year: i64,
    /// Month `1..=12`.
    pub month: u32,
    /// Day of the month `1..=31`.
    pub day: u32,
}

impl Date {
    /// Creates a date without validation.
    pub fn new(year: i64, month: u32, day: u32) -> Date {
        Date { year, month, day }
    }

    /// Number of days since 1970-01-01.
    pub fn to_days(self) -> i64 {
        days_from_civil(self.year, self.month, self.day)
    }

    /// Date from the number of days since 1970-01-01.
    pub fn from_days(days: i64) -> Date {
        let (year, month, day) = civil_from_days(days);
        Date { year, month, day }
    }

    /// The following day.
    pub fn next_day(self) -> Date {
        Date::from_days(self.to_days() + 1)
    }

    /// Parses `YYYY-MM-DD`.
    pub fn parse(text: &str) -> Option<Date> {
        let mut parts = text.trim().split('-');
        let year: i64 = parts.next()?.parse().ok()?;
        let month: u32 = parts.next()?.parse().ok()?;
        let day: u32 = parts.next()?.parse().ok()?;
        if parts.next().is_some() || !(1..=12).contains(&month) || !(1..=days_in_month(year, month)).contains(&day) {
            return None;
        }
        Some(Date { year, month, day })
    }
}

impl std::fmt::Display for Date {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{:04}-{:02}-{:02}", self.year, self.month, self.day)
    }
}

/// `true` for leap years.
pub fn is_leap(year: i64) -> bool {
    (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
}

/// Number of days in the month.
pub fn days_in_month(year: i64, month: u32) -> u32 {
    match month {
        1 | 3 | 5 | 7 | 8 | 10 | 12 => 31,
        4 | 6 | 9 | 11 => 30,
        2 => {
            if is_leap(year) {
                29
            } else {
                28
            }
        }
        _ => 0,
    }
}

fn days_from_civil(year: i64, month: u32, day: u32) -> i64 {
    let y = if month <= 2 { year - 1 } else { year };
    let era = (if y >= 0 { y } else { y - 399 }) / 400;
    let yoe = y - era * 400;
    let mp = i64::from(if month > 2 { month - 3 } else { month + 9 });
    let doy = (153 * mp + 2) / 5 + i64::from(day) - 1;
    let doe = yoe * 365 + yoe / 4 - yoe / 100 + doy;
    era * 146_097 + doe - 719_468
}

fn civil_from_days(days: i64) -> (i64, u32, u32) {
    let z = days + 719_468;
    let era = (if z >= 0 { z } else { z - 146_096 }) / 146_097;
    let doe = z - era * 146_097;
    let yoe = (doe - doe / 1_460 + doe / 36_524 - doe / 146_096) / 365;
    let doy = doe - (365 * yoe + yoe / 4 - yoe / 100);
    let mp = (5 * doy + 2) / 153;
    let day = (doy - (153 * mp + 2) / 5 + 1) as u32;
    let month = (if mp < 10 { mp + 3 } else { mp - 9 }) as u32;
    let year = yoe + era * 400 + i64::from(month <= 2);
    (year, month, day)
}

/// Day of the last Sunday of a 31-day month.
fn last_sunday(year: i64, month: u32) -> u32 {
    let weekday = (days_from_civil(year, month, 31) + 4).rem_euclid(7) as u32; // 0 = Sunday
    31 - weekday
}

/// The date in Lithuania (Europe/Vilnius: UTC+2, UTC+3 from the last Sunday of March
/// to the last Sunday of October, switching at 01:00 UTC) for a Unix timestamp in seconds.
pub fn vilnius_date(unix_secs: i64) -> Date {
    let utc = Date::from_days(unix_secs.div_euclid(86_400));
    let hour = unix_secs.rem_euclid(86_400) / 3_600;
    let summer = match utc.month {
        4..=9 => true,
        3 => {
            let sunday = last_sunday(utc.year, 3);
            utc.day > sunday || (utc.day == sunday && hour >= 1)
        }
        10 => {
            let sunday = last_sunday(utc.year, 10);
            utc.day < sunday || (utc.day == sunday && hour < 1)
        }
        _ => false,
    };
    let offset: i64 = if summer { 3 } else { 2 };
    Date::from_days((unix_secs + offset * 3_600).div_euclid(86_400))
}

/// Today's date in Lithuania.
pub fn vilnius_today() -> Date {
    let secs = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .map(|d| d.as_secs() as i64)
        .unwrap_or(0);
    vilnius_date(secs)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn civil_round_trip() {
        assert_eq!(Date::from_days(0), Date::new(1970, 1, 1));
        assert_eq!(Date::new(2026, 11, 16).to_days(), 20773);
        assert_eq!(Date::new(2024, 2, 29).next_day(), Date::new(2024, 3, 1));
        assert_eq!(Date::new(2026, 12, 31).next_day(), Date::new(2027, 1, 1));
        for days in -800_000..800_000_i64 {
            if days % 997 == 0 {
                assert_eq!(Date::from_days(days).to_days(), days);
            }
        }
    }

    #[test]
    fn parse_dates() {
        assert_eq!(Date::parse("2010-06-12"), Some(Date::new(2010, 6, 12)));
        assert_eq!(Date::parse("2023-02-29"), None);
        assert_eq!(Date::parse("2024-02-29"), Some(Date::new(2024, 2, 29)));
        assert_eq!(Date::parse("06-12"), None);
        assert_eq!(Date::new(2010, 6, 2).to_string(), "2010-06-02");
    }

    #[test]
    fn vilnius_time_zone() {
        assert_eq!(last_sunday(2026, 3), 29);
        assert_eq!(last_sunday(2026, 10), 25);
        assert_eq!(vilnius_date(1782858600), Date::new(2026, 7, 1)); // 2026-06-30 22:30 UTC
        assert_eq!(vilnius_date(1798756200), Date::new(2027, 1, 1)); // 2026-12-31 22:30 UTC
        assert_eq!(vilnius_date(1774733400), Date::new(2026, 3, 28)); // 2026-03-28 21:30 UTC, winter
        assert_eq!(vilnius_date(1792877400), Date::new(2026, 10, 25)); // 2026-10-24 21:30 UTC, summer
        assert_eq!(vilnius_date(1792963800), Date::new(2026, 10, 25)); // 2026-10-25 21:30 UTC, winter
    }
}
