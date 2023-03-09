pub fn production_rate_per_hour(speed: u8) -> f64 {
    let unuadjusted_base:f64 = speed as f64 * 221.0;
    match speed {
        0..=4 => unuadjusted_base,
        5..=8 => unuadjusted_base * 0.9,
        9..=u8::MAX => unuadjusted_base * 0.77,
    }
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    (production_rate_per_hour(speed) / 60.0) as u32
}
