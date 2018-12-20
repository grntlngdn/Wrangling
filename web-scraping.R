library(rvest)
url <- paste0("https://en.wikipedia.org/w/index.php?title=",
              "Gun_violence_in_the_United_States_by_state&oldid=843135608")
h <- read_html(url)
tab <- h %>% html_nodes("table")
tab <- tab[[3]] %>% html_table
tab <- tab %>% setNames(c("state", "population", "total", "murder_rate"))
head(tab)