library(tidyverse)
filename <- "data/fertility.csv"
dest_file = "rdas/fertility.rda"
fertility = read_csv(filename) %>%
  gather(year, fertility, -country, convert = TRUE)
head(fertility)

save(fertility, file = dest_file)