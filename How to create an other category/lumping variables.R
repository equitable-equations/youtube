# creating an 'other' category 

library(tidyverse)
?fct_lump

quitting <- read_csv("quitting.csv")
View(quitting)

ggplot(quitting, aes(x = reason,
                     fill = reason)) + 
  geom_bar(show.legend = FALSE) +
  scale_fill_brewer(palette = "Dark2")

quitting <- quitting %>% 
  mutate(reason = fct_infreq(reason))

fct_lump_n(quitting$reason, n = 4, other_level = "other")

quitting <- quitting %>% 
  mutate(reason_lumped = fct_lump_n(quitting$reason, 
                                    n = 4, 
                                    other_level = "other"))

ggplot(quitting, aes(x = reason_lumped,
                     fill = reason_lumped)) + 
  geom_bar(show.legend = FALSE) +
  scale_fill_brewer(palette = "Dark2")

quitting <- quitting %>% 
  mutate(reason_lumped = fct_lump_lowfreq(quitting$reason,  
                                          other_level = "other"))


