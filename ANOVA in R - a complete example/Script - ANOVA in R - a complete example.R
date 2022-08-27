library(tidyverse)
library(palmerpenguins)
# Does species help explain flipper length?

glimpse(penguins)
ggplot(penguins, aes(x = species,
                     y = flipper_length_mm)) + 
  geom_boxplot()

ggplot(penguins, aes(x = flipper_length_mm)) + 
  geom_histogram() +
  facet_wrap(~species, ncol = 1)

penguins %>% 
  group_by(species) %>% 
  summarize(var(flipper_length_mm, na.rm = TRUE))

model <- aov(flipper_length_mm ~ species, 
             data = penguins)
summary(model)

TukeyHSD(model)
