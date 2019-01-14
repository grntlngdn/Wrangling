library(tidyverse)

filename = "data/payroll.htm"
dest_file = "rdas/payroll.rda"
payroll = read_html(filename) %>%
  html_table() %>%
  .[[1]]
#  setNames(c())
  
  
head(payroll)
save(payroll, file = dest_file)