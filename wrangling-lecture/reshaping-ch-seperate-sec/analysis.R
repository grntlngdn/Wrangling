library(tidyverse)
load("rdas/fertility_vs_life_expectancy.rda")
fertility_vs_life_expectancy %>% ggplot(aes(color = country)) +
  geom_point(aes(year, 50/fertility)) +
  geom_point(aes(year, life_expectancy))
ggsave("figs/plot.png")