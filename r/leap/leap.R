leap <- function(year) {
  if (year %% 4 == 0 && (year %% 100 != 0 || year %% 400 == 0)) {
    TRUE
  } else {
    FALSE
  }
}
