library(tidyverse)
filename = "data/murders.htm"
dest_file = "rdas/murders.rda"
murders = read_html(filename) %>%
  
head(murders)
save(murders, file = dest_file)