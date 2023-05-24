# binning quantitative variables in R
library(tidyverse)
library(readxl)
theme_set(theme_minimal())

titanic <- read_excel("titanic.xlsx") 
View(titanic)

?cut_number
?cut # more general

cut_number(titanic$age,
           n = 8) %>% 
  table()

titanic <- titanic %>% 
  drop_na(age)

titanic <- titanic %>% 
  mutate(age_binned = cut_interval(age,
                                   n = 8))

count(titanic, age_binned)

titanic_summary <- titanic %>% 
  group_by(age_binned) %>% 
  summarize(survival_rate = mean(survived),
            count = n())
titanic_summary

ggplot(titanic_summary, aes(x = age_binned,
                            y = survival_rate,
                            size = count)) + 
  geom_point()

