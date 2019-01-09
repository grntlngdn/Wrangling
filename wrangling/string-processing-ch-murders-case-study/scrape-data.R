library(rvest)

url = paste0("https://en.wikipedia.org/w/index.php?title=",
             "Gun_violence_in_the_United_States_by_state&direction=prev&oldid=810166167")
dest_file = "data/murders.html"

murders = read_html(url) %>%
   html_nodes("table") %>%
   .[[2]]
murders

write_xml(murders, file = dest_file)
browseURL(dest_file)