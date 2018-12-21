library(stringr)
load("rdas/murders_raw/rda")
murders_new <- murders_raw %>% mutate_at(2:3, parse_number)
murders_new %>% head