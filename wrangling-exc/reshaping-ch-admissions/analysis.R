library(tidyverse)
library(reshape2)

load("rdas/admissions.rda")
admissions %>%
  ggplot(aes(x = major, fill=gender)) +
  geom_bar(aes(y = applicants), alpha = .4, stat = "identity", position="dodge")  +
#  scale_fill_manual(values=c("yellow", "orange") +
#  scale_fill_hue(l=40, c=35) +
  geom_bar(aes(y = admitted), alpha = .6, stat = "identity", position="dodge") + 
  ylab("Total applicants (more transparent) vs admitted (more opaque)")
#the key needs improved

#you can see from this graph that more women were admitted to major B than applied. How's that possible?

ggsave("figs/plot.png")