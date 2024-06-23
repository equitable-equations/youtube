# Understanding geom_smooth

library(tidyverse)
library(broom)
theme_set(theme_minimal())

ggplot(mtcars, aes(x = wt, 
                   y = mpg)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

?loess

cars_model <- loess(mpg ~ wt, 
                    data = mtcars,
                    span = .5)
summary(cars_model)

mt_aug <- augment(cars_model)
View(mt_aug)

ggplot(mt_aug) +
  geom_point(aes(x = wt, 
                 y = mpg)) +
  geom_line(aes(x = wt, 
                y = .fitted))

ggplot(mtcars, aes(x = wt, 
                   y = mpg)) + 
  geom_point() + 
  geom_smooth(se = FALSE,
              span = 10000)

ggplot(mtcars, aes(x = wt, 
                   y = mpg)) + 
  geom_point() + 
  geom_smooth(se = FALSE,
              method = "lm",
              formula = y ~ poly(x, 2))



