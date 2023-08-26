# scatterplots in R

library(tidyverse)
library(modeldata)

View(penguins)

ggplot(penguins, aes(x = flipper_length_mm,
                     y = bill_length_mm)) + 
  geom_point(size = 2,
             color = "red",
             shape = "square",
             alpha = .5) +
  geom_smooth(method = "lm",
              se = FALSE,
              color = "pink") # not ideal color choices

ggplot(penguins, aes(x = flipper_length_mm,
                     y = bill_length_mm)) + 
  geom_point() +
  geom_smooth(method = "lm",
              se = FALSE)

lm(bill_length_mm ~ flipper_length_mm,
   data = penguins)

ggplot(penguins, aes(x = flipper_length_mm,
                     y = bill_length_mm,
                     color = island)) + 
  geom_point() +
  scale_color_brewer(palette = "Dark2")

ggplot(penguins, aes(x = flipper_length_mm,
                     y = bill_length_mm,
                     color = species)) + 
  geom_point() +
  scale_color_brewer(palette = "Dark2")

table(penguins$species,
      penguins$island)

ggplot(penguins, aes(x = flipper_length_mm,
                     y = bill_length_mm,
                     color = species)) + 
  geom_point() +
  geom_smooth(method = "lm",
              se = FALSE) +
  scale_color_brewer(palette = "Dark2")

ggplot(penguins, aes(x = flipper_length_mm,
                     y = bill_length_mm,
                     color = species)) + 
  geom_point() +
  geom_smooth(method = "lm",
              se = FALSE) +
  scale_color_brewer(palette = "Dark2") +
  labs(x = "Flipper length",
       y = "Bill length",
       color = "Species",
       title = "Penguin measurements") +
  theme_minimal()


