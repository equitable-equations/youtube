# Assigning letter grades using case_when
library(tidyverse)
gradebook <- read_csv("Mutating data frames with case_when/gradebook.csv")
View(gradebook)

?case_when
# generalizes ifelse()

gradebook_new <- gradebook %>% 
  mutate(grade = case_when(score >= 90 ~ "A",
                           score >= 80 ~ "B",
                           score >= 70 ~ "C",
                           score >= 60 ~ "D",
                           .default = "F"))
view(gradebook_new)
