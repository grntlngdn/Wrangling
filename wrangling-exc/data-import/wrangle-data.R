library(tidyverse)

filename = "data/olive.csv"
dest_file = "rdas/olive.rda"
read_lines(filename, n_max = 1)
olive = read_csv(filename, col_names = F, skip = 1) #%>%
  
head(olive)
save(olive, file = dest_file)