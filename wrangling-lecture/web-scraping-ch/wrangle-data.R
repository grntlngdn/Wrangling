library(tidyverse)
filename = "data/murders.csv"
dest_file = "rdas/murders.rda"
murders = read_csv(filename) %>%
  
head(murders)
save(murders, file = dest_file)