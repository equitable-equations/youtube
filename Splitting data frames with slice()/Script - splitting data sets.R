# Slicing a data set

library(tidyverse)
?slice
starwars

slice(starwars, 4:8) # only keep rows 4-8
slice(starwars, c(-4, -5)) # omit rows 4 and 5

slice_tail(starwars, n = 4) # keep the last 4 rows
slice_tail(starwars, prop = .20) # keep the last 20% of rows

starwars %>% slice_max(order_by = mass,
                       n = 4) # keep the row with top 4 values of mass
starwars %>% slice_max(order_by = mass,
                       n = 4, 
                       with_ties = FALSE) # gives exactly 4 rows despite ties

test <- starwars %>% 
  slice_sample(prop = .20) # keep 20% at random
test

training <- starwars %>%
  anti_join(test)
training
