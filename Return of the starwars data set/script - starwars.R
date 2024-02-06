# Unnesting Starwars
library(tidyverse)
theme_set(theme_minimal())
View(starwars)
glimpse(starwars)

starwars_sm <- starwars %>% 
  select(name, 
         films, 
         vehicles,
         starships)

sw_films <- starwars_sm %>% 
  unnest(films)
View(sw_films)

sw_films %>% 
  count(name) %>% 
  arrange(-n)

sw_films %>% 
  count(name) %>% 
  filter(n >= 4) %>%
  mutate(name = fct_reorder(name, n)) %>% 
  ggplot(aes(y = name,
             x = n)) + 
  geom_col()

?unnest
sw_ships <- starwars_sm %>% 
  unnest(starships, keep_empty = TRUE)
View(sw_ships)

sw_long <- starwars_sm %>% 
  unnest(c(starships, vehicles)) # error, vectors aren't the same length

sw_long <- starwars_sm %>%
  unnest(starships) %>% 
  unnest(vehicles)
View(sw_long)
