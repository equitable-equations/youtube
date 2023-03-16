library(tidyverse)
library(tidytuesdayR)
theme_set(theme_minimal())

tuesdata <- tidytuesdayR::tt_load(2022, week = 41)
yarn <- tuesdata$yarn

View(yarn)

# How are NAs distributed?

mean(is.na(yarn$max_gauge))

yarn_na_counts <- yarn |> 
  summarize(across(everything(), 
                   \(x) mean(is.na(x)))) 
View(yarn_na_counts)

# Big idea: can we impute missing NA values for 
# min_gauge using grams and yardage?

# some weirdness:
summary(yarn$yardage)
# Note the min. 

weird <- filter(yarn, yardage == 0)
View(weird)

# Let's replace Kmart Sayelle's yardage with 240

yarn[yarn$permalink == "kmart-sayelle", "yardage"] <- 240

# There are also zeros for grams.
# For brevity, we're going to just filter these out.

yarn_sm <- yarn |> 
  filter(grams > 0,
         yardage > 0) |> 
  mutate(dens = grams / yardage,
         gauge_std = min_gauge / gauge_divisor)

View(yarn_sm)

# How do dens and gauge_std relate in this smaller set?

ggplot(yarn_sm, aes(x = log10(dens), 
                    y = log10(gauge_std))) + 
  geom_point(alpha = .1)

# let's remove the zeroes from gauge_std as well. 

yarn_sm <- yarn_sm |> 
  filter(gauge_std > 0)

ggplot(yarn_sm, aes(x = log10(dens), 
                    y = log10(gauge_std))) + 
  geom_point(alpha = .1) +
  geom_smooth(method = "lm")

# Let's get the actual model now:

model <- lm(log10(gauge_std) ~ log10(dens),
            data = yarn_sm)
summary(model)

# The model says that
# gauge_std = 10 ^ (.495 - .514 * log10(dens) + error)

yarn_new <- yarn |> 
  mutate(gauge_std_imputed = 10 ^ (.495 - .514 * log10(grams / yardage)))
# Note there are some problematics values here. Zeros and infinities. 

ggplot(yarn_new, aes(x = log10(min_gauge / gauge_divisor), 
                     y = log10(gauge_std_imputed))) + 
  geom_point(alpha = .1)

