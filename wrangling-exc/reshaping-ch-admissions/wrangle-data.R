library(tidyverse)
library(dslabs)
data(admissions)

dest_file = "rdas/admissions.rda"

head(admissions)

admissions %>%
  select(-applicants) %>%
  spread(major, admitted) %>%
  head()

admissions %>%
  gather(key, value, c('admitted','applicants')) %>%
  unite(column_name, key, gender, sep = '_') %>%
  spread(column_name, value) %>%
  head()

#ended up not saving the suggested changes as it made plotting more difficult

save(admissions, file = dest_file)