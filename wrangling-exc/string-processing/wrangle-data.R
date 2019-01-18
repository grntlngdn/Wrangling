library(tidyverse)
library(pdftools)

filename = "data/mortality.pdf"
dest_file = "rdas/mortality.rda"

mortality_pdf = pdf_text(filename)

mortality = data.frame()

for(page in 1:length(mortality_pdf)) {
  mortality_raw =  mortality_pdf %>%
    .[[page]] %>%
    str_split("\n") %>%
    .[[1]] %>%
    str_trim()
  
  #removes header and tail
  header_index = str_which(mortality_raw, "^[A-Z]{3}\\s+2015\\s+2016\\s+2017\\s+2018")
  header =  mortality_raw[header_index] %>%
    str_split("\\s+", simplify = T) %>%
    .[1,]
  
  
  tail_index = str_which(mortality_raw, "Total")
  
  mortality_raw = mortality_raw[(header_index+1):(tail_index-1)]
  
  #removes rows with just one number (from the y-axis of the plot)
  n = 1<str_count(mortality_raw, "\\d+")
  
  #removes part of strings from right of each page and converts
  #text from the table on the left of each page into one tidy tibble
  month = header[1]
  header[1] = 'day'
  mortality_raw = mortality_raw[n] %>%
    str_remove_all("[^\\d\\s]") %>%
    str_split_fixed("\\s+", 6) %>%
    .[,1:5] %>%
    apply(c(1,2),as.numeric) %>%
    as_tibble() %>%
    setNames(header) %>%
    mutate(month_abb = month, month = page) %>%
    gather(year, deaths, header[2:5]) %>%
    mutate(date = ISOdate(year, month, day)) %>%
    filter(!is.na(deaths), date < ISOdate(2018,5,31))
  mortality = bind_rows(mortality, mortality_raw)
}


mortality %>%
  filter(deaths < 8)

save(mortality, file = dest_file)