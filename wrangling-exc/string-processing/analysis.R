library(tidyverse)

load("rdas/mortality.rda")
mortality %>% ggplot(aes(date, deaths)) +
  geom_smooth()
ggsave("figs/plot.png")