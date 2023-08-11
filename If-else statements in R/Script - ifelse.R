# if-else statements in R
library(tidyverse)

# the basics --------------------------------------------------------------

my_word <- "hello there!"
if (nchar(my_word) <= 5) {
  print("It's a short string")
} else if (nchar(my_word) <= 8){
  print("It's a mid-length string")
} else {
  print("It's a long string")
}

# a handy shortcut --------------------------------------------------------

x <- 4
y <- if (x < 5) 0 else 10

?ifelse

y <- ifelse(x < 5, 0, 10)
y

# practical example -------------------------------------------------------

# import the data (it's on my GitHub)
plant_updates <- read_csv("If-else statements in R/plant_updates.csv")
View(plant_updates)

plants_new <- plant_updates %>% 
  mutate(name_best = ifelse(!is.na(name_2017), 
                            name_2017,
                            scientific_name),
         c_best = ifelse(!is.na(c_2017),
                         c_2017, 
                         c))
View(plants_new)

skimr::skim(plants_new)

