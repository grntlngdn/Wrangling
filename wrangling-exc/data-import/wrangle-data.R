library(tidyverse)

filename = "data/olive.csv"
dest_file = "rdas/olive.rda"
read_lines(filename, n_max = 1)
olive = read_csv(filename, col_names = F, skip = 1) #%>%
#as per questions, I will return to use the names I extracted for the tibble columns later

head(olive)
save(olive, file = dest_file)