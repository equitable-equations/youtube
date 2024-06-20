# Missing values in the Bikeshare data set

library(tidyverse)
library(ISLR2)
library(broom)

?Bikeshare
glimpse(Bikeshare)

365 * 24 # 8760 hours in a year, 115 missing rows
sum(Bikeshare$bikers == 0) # none

# Add missing rows to Bikeshare

bikes_new <- expand_grid(day = 1:365,
                         hr = as.factor(0:23)) %>% 
  left_join(Bikeshare,
            by = join_by(day,
                         hr))

# Impute missing values as appropriate

bikes_imputed <- bikes_new %>% 
  mutate(bikers = replace_na(bikers, 0),
         temp = ifelse(is.na(temp),
                       (lead(temp) + lag(temp))/2,
                       temp),
         temp = ifelse(is.na(temp),
                       lead(temp),
                       temp),
         temp = ifelse(is.na(temp),
                       lag(temp),
                       temp),
         weathersit = case_when(!is.na(weathersit) ~ weathersit,
                                TRUE ~ lag(weathersit)),
         weathersit = case_when(!is.na(weathersit) ~ weathersit,
                                TRUE ~ lead(weathersit)),
         workingday = mean(workingday, na.rm = TRUE),
         .by = day)

sum(is.na(bikes_imputed$temp))

# Compare poisson models

model_old <- glm(bikers ~ temp + workingday + weathersit,
                 data = Bikeshare, 
                 family = "poisson")

model_new <- glm(bikers ~ temp + workingday + weathersit,
                 data = bikes_imputed, 
                 family = "poisson")

tidy(model_old)
tidy(model_new)

# One test value

new_data <- data.frame(temp = .5,
                       workingday = 0,
                       weathersit = "clear")

predict(model_old, 
        new_data,
        type = "response")

predict(model_new, 
        new_data,
        type = "response")

