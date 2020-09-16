### Elegant way to check for missing packages and install them
### from https://stackoverflow.com/questions/4090169/elegant-way-to-check-for-missing-packages-and-install-them

using <- function(...) {
  libs <- unlist(list(...))
  req <- unlist(lapply(libs, require, character.only = TRUE))
  need <- libs[req == FALSE]
  if (length(need) > 0) {
    install.packages(need)
    lapply(need, require, character.only = TRUE)
  }
}

#Example of use
using("knitr",
      "ggplot2",
      "dplyr",
      "plotly",
      "future.apply")

