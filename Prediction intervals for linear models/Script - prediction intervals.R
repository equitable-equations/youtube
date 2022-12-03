# Prediction intervals for linear models
library(tidyverse)
library(modeldata)
?predict 
data(penguins)

adelie <- penguins %>% 
  filter(species == "Adelie",
         !is.na(bill_length_mm))

View(adelie)

ggplot(adelie, aes(x = bill_depth_mm,
                   y = bill_length_mm)) +
  geom_point() +
  geom_smooth(method = "lm",
              level = .99)

model <- lm(bill_length_mm ~ bill_depth_mm, 
            data = adelie)
plot(model)

adelie_pred <- predict(model, 
                       interval = "prediction")

adelie_new <- cbind(adelie, 
                    adelie_pred)
View(adelie_new)

ggplot(adelie_new, aes(x = bill_depth_mm)) + 
  geom_point(aes(y = bill_length_mm)) +
  geom_line(aes(y = fit),
            col = "blue",
            size = .8) +
  geom_line(aes(y = upr),
            linetype = "dashed",
            col = "blue",
            size = .8) +
  geom_line(aes(y = lwr),
            linetype = "dashed",
            col = "blue", 
            size = .8)  # note 'linewidth' is now used instead of 'size'

adelie_pred <- predict(model, 
                       interval = "prediction",
                       level = .8)
adelie_pred <- cbind(adelie, adelie_pred)

augment(model)

