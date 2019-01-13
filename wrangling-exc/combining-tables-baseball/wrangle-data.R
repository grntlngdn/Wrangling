library(tidyverse)
library(Lahman)
data(Batting)
data(Master)
data(Salaries)

dest_file = "rdas/Batting.rda"

salaries = Salaries %>%
  as_tibble() %>%
  filter(yearID == "2016")

top = Batting %>% filter(yearID == 2016) %>%
  as_tibble() %>% 
  filter(yearID == 2016) %>%
  arrange(desc(HR)) %>%
  slice(1:10) %>%
  left_join(as_tibble(Master), by = 'playerID') %>%
  left_join(salaries, by = 'playerID') %>%
  select(nameFirst, nameLast, teamID.x, HR, salary)
top %>%
  tbl_df

#names(top)

save(Batting, file = dest_file)