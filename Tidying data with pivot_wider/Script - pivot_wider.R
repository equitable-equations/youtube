# tidying data with pivot_wider
library(tidyverse)
?pivot_wider

FQA <- read_csv("FQA.csv")
View(FQA)

FQA_wide <- pivot_wider(FQA, 
                        names_from = variable,
                        values_from = value)

library(GLMsData)
data(blocks)

blocks_wide <- blocks %>%
  pivot_wider(names_from = Shape,
              values_from = c(Number, Time))
View(blocks_wide)

blocks_wide <- blocks_wide %>%
  mutate(Difference = Number_Cube - Number_Cylinder)

ggplot(blocks_wide, aes(Difference)) +
  geom_histogram(binwidth = 1,
                 color = "black") +
  theme_minimal()

blocks_wide <- blocks %>%
  pivot_wider(names_from = c(Trial, Shape),
              values_from = c(Number, Time))
View(blocks_wide)

blocks_wide <- blocks %>%
  pivot_wider(names_from = c(Trial, Shape),
              values_from = c(Number, Time),
              names_glue = "Trial.{Trial}_{Shape}_{.value}")

