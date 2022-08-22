# You should be working in a project called sample_project that includes a
# folder called data containing the Scooby.xlsx data set.

library(here)
library(readxl)

file <- here("data", "Scooby.xlsx") 
scoobs <- readexcel(file)


# Data source: 
# https://www.kaggle.com/datasets/williamschooleman/scoobydoo-complete
  