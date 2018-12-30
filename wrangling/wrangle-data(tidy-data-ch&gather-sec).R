library(tidyverse)
#ds_theme_set()
filename <- "data/fertility.csv"
dest_file = "rdas/fertility.rda"
wide_data <- read_csv(filename)
new_tidy_data <- wide_data %>%
  gather(year, fertility, `1960`:`2015`)
save(new_tidy_data, file = dest_file)
head(new_tidy_data)