library(tidyverse)
?mutate

Islands <- data.frame(Island = names(islands), 
                      Area = islands,
                      row.names = NULL)
View(Islands)

Islands <- mutate(Islands, Area_km = Area * 2.59)
Islands2 <- transmute(Islands, Area_km = Area * 2.59)
View(Islands2)

Islands <- Islands %>%
  mutate(Type = "Island",
         Number = 1:48,
         Rank = rank(Area), 
         Previous = lag(Number),
         Next = lead(Number))
