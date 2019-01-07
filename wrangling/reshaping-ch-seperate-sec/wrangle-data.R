library(tidyverse)
filename <- "data/fertility_vs_life_expectancy.csv"
dest_file = "rdas/fertility_vs_life_expectancy.rda"
fertility_vs_life_expectancy = read_csv(filename) %>%
  gather(key, value, -country) %>%
  separate(key, c("year", "variable_name"), extra = "merge") %>%
  spread(variable_name, value)

head(fertility_vs_life_expectancy)
save(fertility_vs_life_expectancy, file = dest_file)