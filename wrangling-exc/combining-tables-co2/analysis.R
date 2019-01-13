library(tidyverse)

load("rdas/co2.rda")
yearly_avg = co2 %>%
  group_by(year) %>%
  summarize(average = mean(co2))
co2 %>% left_join(yearly_avg, by = "year") %>%
  mutate(residual_co2 = co2 - average) %>%
  ggplot(aes(month, residual_co2, color = year)) +
     geom_line()
ggsave("figs/plot.png")