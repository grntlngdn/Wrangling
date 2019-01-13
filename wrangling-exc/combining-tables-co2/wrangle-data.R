library(tidyverse)
library(dslabs)
data(co2)

dest_file = "rdas/co2.rda"
co2 = data.frame(matrix(co2, ncol = 12, byrow = TRUE)) %>% 
  setNames(1:12) %>%
  mutate(year = as.character(1959:1997)) %>%
  gather(month, co2, -year, convert = T)
co2 %>% ggplot(aes(month, co2, color = year)) +
  geom_line()
  
head(co2)
save(co2, file = dest_file)