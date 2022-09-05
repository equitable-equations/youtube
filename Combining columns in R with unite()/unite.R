library(tidyverse)
library(nycflights13)

?unite

glimpse(flights)

flights_ee <- flights %>% 
  unite(date, 
        year, 
        month, 
        day)
glimpse(flights_ee)

flights_ee <- flights %>% 
  unite(date, 
        year, 
        month, 
        day, 
        remove = FALSE)

flights_ee <- flights %>% 
  unite(date, 
        year, 
        month, 
        day, 
        remove = FALSE,
        sep = "-") %>% 
  mutate(date = as.Date(date))



