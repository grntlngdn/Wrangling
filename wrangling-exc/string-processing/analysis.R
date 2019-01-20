library(tidyverse)

load("rdas/mortality.rda")
mortality %>% ggplot(aes(date, deaths)) +
  geom_point(alpha = 0.2) +
  geom_smooth()
ggsave("figs/plot.png")