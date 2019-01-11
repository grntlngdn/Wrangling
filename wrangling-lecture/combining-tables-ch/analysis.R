library(tidyverse)
library(ggrepel)
load("rdas/population_vs_votes.rda")
population_vs_votes %>% ggplot(aes(population/10^6, electoral_votes, label = abb)) +
  geom_point() +
  geom_text_repel() + 
  scale_x_continuous(trans = "log2") +
  scale_y_continuous(trans = "log2") +
  geom_smooth(method = "lm", se = FALSE)
ggsave("figs/plot.png")