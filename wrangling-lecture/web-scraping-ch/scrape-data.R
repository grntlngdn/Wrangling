library(rvest)

url = paste0("https://en.wikipedia.org/w/index.php?title=",
             "Gun_violence_in_the_United_States_by_state&oldid=843135608")
murders = read_html(url) %>%
  html_nodes("table") %>%
  .[[3]] %>%
  html_table %>%
  setNames(c("state", "population", "total", "murder_rate"))

dest_file = "data/murders.htm"
head(murders)
save(murders, file = dest_file)