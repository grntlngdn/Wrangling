library(tidyverse)
library(ggthemes)
library(ggrepel)
load("rdas/murders.rda")

##this is the analysis from chapter 19 ggplot2

#defines the slope of the line geometry
r = murders %>% 
  summarize(rate = sum(total) /  sum(population) * 10^6) %>% .$rate

murders %>% ggplot(aes(population/10^6, total, label = abb)) +
  geom_abline(lty = 2, color = "darkgrey") +
  geom_point(aes(col=region), size = 3) +  
  geom_text_repel() + 
  scale_x_log10() +
  scale_y_log10() +
  xlab("Populations in millions (log scale)") + 
  ylab("Total number of murders (log scale)") +
  ggtitle("US Gun Murders in 2010") +
  scale_color_discrete(name = "Region") +
  theme_economist()
ggsave("figs/plot.png")