library(tidyverse)
library(broom)
library(GGally)

# Data from Regression Analysis by Example
# by Chatterjee and Hadi (set P060)

performance <- read_csv("performance.csv")
View(performance)

ggpairs(performance)

# I'll use the t-statistic to decide which
# variable to throw away at each step.
# I'll keep going as long as I have a t-statistic
# under 1. 

model_6 <- lm(overall_rating ~ ., 
              data = performance)
summary(model_6)

model_5 <- update(model_6,
                  . ~ . -not_overly_critical)
summary(model_5)

model_4 <- update(model_5,
                  . ~ . - raises_for_performance)
summary(model_4)

model_3 <- update(model_4, 
                  . ~ . -no_special_privileges)
summary(model_3)

# residual plot

perf_aug <- augment(model_3)
View(perf_aug)

ggplot(perf_aug, aes(x = .fitted,
                     y = .resid)) + 
  geom_point() +
  geom_hline(yintercept = 0)

# How does AIC compare between these models?

model_list <- list(model_6, 
                   model_5, 
                   model_4, 
                   model_3)

lapply(model_list, 
       extractAIC)


