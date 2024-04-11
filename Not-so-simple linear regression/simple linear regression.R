# Simple linear regression - deep dive

library(tidymodels)
theme_set(theme_minimal())
set.seed(0)

View(airquality)

# split data

aq_split <- initial_split(airquality)
aq_train <- training(aq_split)
aq_test <- testing(aq_split)

# visualize the data

ggplot(aq_train, aes(x = Wind,
                     y = Temp)) + 
  geom_point() +
  geom_smooth(method = "lm",
              se = FALSE)

# building the model

model <- lm(Temp ~ Wind, 
            data = aq_train)
names(model)

model$coefficients
model$residuals
model$fitted.values

summary(model)
fitted.values(model)
confint(model, level = .90)

plot(model)

# the broom package

tidy(model)
glance(model)
aq_aug <- augment(model)
View(aq_aug)

# model performance

predict(model, 
        aq_test,
        interval = "prediction")

sqrt(mean((aq_test$Temp - predict(model, aq_test))^2))






