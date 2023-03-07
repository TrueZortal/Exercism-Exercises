// This stub file contains items that aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

/// various log levels
#[derive(Clone, PartialEq, Eq, Debug)]
pub enum LogLevel {
    Info,
    Warning,
    Error,
    Debug
}
/// primary function for emitting logs
pub fn log(level: LogLevel, message: &str) -> String {
    match level {
        LogLevel::Info => info(message),
        LogLevel::Warning => warn(message),
        LogLevel::Error => error(message),
        LogLevel::Debug => debug(message)
    }
}
pub fn info(message: &str) -> String {
    let mut level: String = "[INFO]: ".to_owned();
    level.push_str(message);
    level
}
pub fn warn(message: &str) -> String {
    let mut level: String = "[WARNING]: ".to_owned();
    level.push_str(message);
    level
}
pub fn error(message: &str) -> String {
    let mut level: String = "[ERROR]: ".to_owned();
    level.push_str(message);
    level
}
pub fn debug(message: &str) -> String {
    let mut level: String = "[DEBUG]: ".to_owned();
    level.push_str(message);
    level
}