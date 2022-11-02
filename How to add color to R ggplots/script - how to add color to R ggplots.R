# Better use of color in R

library(tidyverse)
theme_set(theme_minimal())
view(mpg)

ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point(color = "seashell")

colors()

ggplot(mpg, aes(x = cty)) + 
  geom_histogram(color = "red",
                 fill = "pink")

ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point(color = "#6e31d6")

ggplot(mpg, aes(x = cty)) + 
  geom_histogram(color = "#be1529",
                 fill = "#b6a960")

qplot(mpg$cty, 
      geom = "histogram", 
      fill = I("#be1529"))



