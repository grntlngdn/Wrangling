library(tidyverse)
library(pdftools)

filename = "data/mortality.pdf"
dest_file = "rdas/mortality.rda"

mortality = pdf_text(filename) %>%
  str_split("\n")# %>% #                              #turns vector of pages into list of pages represented as vectors of lines
  mortality = lapply (seq_along(mortality), function(page) {
    mortality[[page]] %>% str_trim %>% #              #applies the following to each page of the pdf
      .[(str_which(., "^[A-Z]{3}\\s+2015\\s+2016\\s+2017\\s+2018") + 1):#starts subset selection after header index
          (str_which(., "Total") - 1)] %>% #          #ends subset slection before summary section
      .[1<str_count(., "\\d+")] %>% #                 #deletes rows with just one number (from the y-axis of the plot)
      str_remove_all("[^\\d\\s]") %>% #               #removes text (from right of each page)
      str_split_fixed(" {3,6}", 6) %>% .[,1:5] %>% #  #leaves nearly just table (from left of each page) as matrix
      apply(c(1,2),as.numeric) %>% #                  #converts entries of that matrix to numeric
      as_tibble() %>% #                               #each matrix to tibble
      filter(!(V1 == 1 & V2 == 2 & V3 == 3 & V4 == 4 & V5 == 5)) %>% #removes row that came from x-axis of the plot
      setNames(c('day', 2015, 2016, 2017, 2018)) %>%  #column names
      mutate(month = page) %>% #                      #creates month variable
      gather(year, deaths, header[2:5]) %>% #         #tidies data to make each date a seperate observation
      mutate(date = ISOdate(year, month, day)) %>% #  #creates date variable
      filter(date < ISOdate(2018,5,31)) #             #remove zeroes used as fillers after data stops may 31, 2018
  }
  ) %>% bind_rows() #                                 #bind all months' observations into a single dataframe


mortality

save(mortality, file = dest_file)