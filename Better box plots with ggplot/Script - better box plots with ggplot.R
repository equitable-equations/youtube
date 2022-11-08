library(tidyverse)
library(modeldata)
?geom_boxplot

glimpse(msleep)

ggplot(msleep, aes(x = vore, 
                  y = sleep_total,
                  fill = vore)) + 
  geom_boxplot(show.legend = FALSE,
               outlier.shape = NA) +
  geom_jitter(width = .2)


data(penguins)
glimpse(penguins)

ggplot(penguins, aes(x = species, 
                     y = bill_length_mm, 
                     fill = species)) +
  geom_violin(show.legend = FALSE) +
  geom_boxplot(width = .5)
