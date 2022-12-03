# multiple regression with a categorical explainer
library(tidyverse)
library(tidymodels)
data(crickets)
View(crickets)

ggplot(crickets, aes(x = temp, y = rate, col = species)) + 
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

model_additive <- lm(rate ~ temp + species, data = crickets)
summary(model_additive)

ggplot(crickets, aes(x = temp, y = rate, col = species)) + 
  geom_point() +
  geom_abline(aes(intercept = -7.210906, 
                  slope = 3.602753, 
                  col = "O. exclamationis")) +
  geom_abline(aes(intercept = -7.210906 - 10.06529, 
                  slope = 3.602753, 
                  col = "O. niveus")) 

model_interactive <- lm(rate ~ temp * species, data = crickets)
summary(model_interactive)

ggplot(crickets, aes(x = temp, y = rate, col = species)) + 
  geom_point() +
  geom_abline(aes(slope = 3.7514, 
                  intercept = -11.0408, 
                  col = "O. exclamationis")) +
  geom_abline(aes(slope = 3.7514 - .2340, 
                  intercept = -11.0408- 4.3484, 
                  col = "O. niveus")) +
  geom_smooth(method = "lm", se = F)

