tournament <- function(input) {
    scores = list()
  for (result in input) {
    data = strsplit(result,";")
    if (data[2] == "win") {
      formatted_win <- list(Name = data[0], MP = 1, W = 1, D = 0, L = 0, P = 3)
      formatted_loss <- list(Name = data[1], MP = 1, W = 0, D = 0, L = 1, P = 0)
      scores <- append(scores,formatted_win)
      scores <- append(scores,formatted_loss)

    } else if (data[2] == "loss") {
      formatted_loss <- list(Name = data[0], MP = 1, W = 0, D = 0, L = 1, P = 0)
      formatted_win <- list(Name = data[1], MP = 1, W = 1, D = 0, L = 0, P = 3)
      scores <- append(scores,formatted_win)
      scores <- append(scores,formatted_loss)
    } else {
      formatted_draw <- list(Name = data[0], MP = 1, W = 0, D = 1, L = 0, P = 1)
      formatted_draw2 <- list(Name = data[1], MP = 1, W = 0, D = 1, L = 0, P = 1)
      scores <- append(scores,formatted_draw)
      scores <- append(scores,formatted_draw2)
    }
  }
  print(scores)
}

input = c(
    "Allegoric Alaskans;Blithering Badgers;win",
    "Devastating Donkeys;Courageous Californians;draw",
    "Devastating Donkeys;Allegoric Alaskans;win",
    "Courageous Californians;Blithering Badgers;loss",
    "Blithering Badgers;Devastating Donkeys;loss",
    "Allegoric Alaskans;Courageous Californians;win"
  )

tournament(input)
