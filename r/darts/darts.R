score <- function(x, y) {
  coord = sqrt(x^2 + y^2)
  if (coord > 10) {
     0
  } else if (coord <= 10 && coord > 5) {
    1
  } else if (coord <= 5 && coord > 1) {
    5
  } else {
    10
  }
}
