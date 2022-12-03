library(tidyverse)
library(modeldata)
theme_set(theme_minimal())
data(penguins)
penguins_sm <- filter(penguins, species != "Adelie")

glimpse(penguins_sm)

ggplot(penguins_sm, aes(x = flipper_length_mm,
                        y = body_mass_g,
                        col = species)) + 
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

model <- lm(body_mass_g ~ flipper_length_mm * species,
            data = penguins_sm)
summary(model)

ggplot(penguins_sm, aes(x = flipper_length_mm,
                        y = body_mass_g,
                        col = species)) + 
  geom_point() +
  geom_abline(aes(intercept = -3037.196,
                  slope = 34.573,
                  col = "Chinstrap"))+
  geom_abline(aes(intercept = -3037.196-3750.085,
                  slope = 34.573 + 20.049,
                  col = "Gentoo"))


















# A better plot ----------------------------------------------------

penguin_lines <- penguins_sm %>% 
  group_by(species) %>% 
  summarise(minimum = min(flipper_length_mm, na.rm = TRUE),
            maximum = max(flipper_length_mm, na.rm = TRUE)) %>% 
  pivot_longer(cols = 2:3, 
               names_to = "min_max", 
               values_to = "flipper_length_mm")
penguin_lines <- penguin_lines %>% 
  mutate(fitted = predict(model, penguin_lines)) %>% 
  pivot_wider(names_from = min_max,
              values_from = c(flipper_length_mm,
                              fitted)) 

ggplot(penguins_sm, aes(flipper_length_mm, 
                          body_mass_g,
                          col = species)) + 
  geom_point() +
  geom_segment(data = penguin_lines, 
               aes(x = flipper_length_mm_minimum,
                   y = fitted_minimum,
                   xend = flipper_length_mm_maximum,
                   yend = fitted_maximum,
                   col = species),
               size = 1)
