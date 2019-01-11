library(tidyverse)
library(rvest)
filename = "data/murders.html"
dest_file = "rdas/murders.rda"
murders = read_html(filename) %>%
  html_table() %>%
  .[[1]] %>%
  setNames(c("state", "population", "total", "murder_rate")) %>%
  mutate_at(2:3, parse_number) %>%
  mutate(abb = state.abb[match(state,state.name)], region = state.region[match(state,state.name)])
#DC needs abb and region defined seperately
  
head(murders)
save(murders, file = dest_file)