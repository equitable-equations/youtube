# See https://github.com/equitable-equations/youtube 
# for analysis of the College data set.

# Preliminaries:

library(tidyverse)
library(ISLR2)
library(broom)

college_sm <- College %>% 
  mutate(log_full = log(F.Undergrad)) %>% 
  select(Grad.Rate,
         log_full,
         Private,
         Top25perc)


# Build the model:

model_top <- lm(Grad.Rate ~ log_full + 
                  Private + 
                  Top25perc, 
                data = college_sm)

# Summarize the model:

summary(model_top)

# Functions from broom:

tidy(model_top)

model_aug <- augment(model_top)
View(model_aug)

model_glance <- glance(model_top)
View(model_glance)


