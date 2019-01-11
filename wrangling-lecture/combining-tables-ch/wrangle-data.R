library(tidyverse)
library(dslabs)
data(murders)
data(polls_us_election_2016)

dest_file = "rdas/population_vs_votes.rda"
population_vs_votes <- left_join(murders, results_us_election_2016, by = "state") %>%
  select(-others)
  
head(population_vs_votes)
save(population_vs_votes, file = dest_file)