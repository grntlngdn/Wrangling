library(tidyverse)

load("rdas/Batting.rda")
top %>% ggplot(aes(HR, salary, label = paste(nameFirst, ' ', nameLast))) +
  geom_point() +
  geom_text(nudge_x = 2)
ggsave("figs/plot.png")