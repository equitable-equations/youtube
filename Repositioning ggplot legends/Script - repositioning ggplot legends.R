library(tidyverse)
theme_set(theme_minimal())

ggplot(diamonds, aes(x = cut, fill = cut)) +
  geom_bar() +
  theme(legend.position = "top")

ggplot(diamonds, aes(x = cut, fill = cut)) +
  geom_bar() +
  theme(legend.position = "none")

ggplot(diamonds, aes(x = cut, fill = cut)) +
  geom_bar() +
  theme(legend.position = c(0, 1),
        legend.justification = c(0, 1))
