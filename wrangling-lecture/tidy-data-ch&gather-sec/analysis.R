library(tidyverse)
load("rdas/fertility.rda")
fertility %>% ggplot(aes(year, fertility, color = country)) +
  geom_point()
ggsave("figs/plot.png")