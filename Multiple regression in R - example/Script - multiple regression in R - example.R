library(tidyverse)
library(broom)
library(GGally)

# Download the LSR data sets from https://learningstatisticswithr.com/. 
# The following command likely won't work on your machine. Replace with the
# file's full path or import directly using the RStudio file browser.
# load("parenthood.Rdata")  

parenthood <- select(parenthood, 1:3)
glimpse(parenthood)

ggpairs(parenthood)
model <- lm(dan.grump ~ ., 
            data = parenthood)
summary(model)

model_baby <- lm(dan.grump ~ baby.sleep,
                 data = parenthood)
summary(model_baby)

model_dan <- lm(dan.grump ~ dan.sleep, 
                data = parenthood)
summary(model_dan)

glance(model)
glance(model_baby)
glance(model_dan)
