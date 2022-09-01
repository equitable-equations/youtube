library(tidyverse)
library(tidytuesdayR)
library(ISLR2)
tuesdata <- tidytuesdayR::tt_load(2021, week = 41)
nurses <- tuesdata$nurses
theme_set(theme_minimal())

?geom_bar

glimpse(Carseats)
?Carseats

# Basic bar chart:
ggplot(Carseats, aes(x = ShelveLoc,
                     fill = ShelveLoc)) + 
  geom_bar(width = .60,
           show.legend = FALSE) +
  scale_fill_brewer(palette = "Dark2") # added for accessibility

# Adding a second categorical variable in several different ways:
ggplot(Carseats, aes(x = US,
                     fill = ShelveLoc)) + 
  geom_bar() +
  scale_fill_brewer(palette = "Dark2")

ggplot(Carseats, aes(x = US,
                     fill = ShelveLoc)) + 
  geom_bar(position = "fill") +
  scale_fill_brewer(palette = "Dark2")

ggplot(Carseats, aes(x = US,
                     fill = ShelveLoc)) + 
  geom_bar(position = "dodge") +
  scale_fill_brewer(palette = "Dark2")

# Reversing the aesthetics:
ggplot(Carseats, aes(fill = US,
                     x = ShelveLoc)) + 
  geom_bar(position = "dodge") +
  scale_fill_brewer(palette = "Dark2")

# geom_col() for sets with counts:
View(nurses)
nurses_2020 <- nurses %>% 
  filter(Year == 2020)
View(nurses_2020)

ggplot(nurses_2020, aes(y = State,
                        x = `Total Employed RN`)) +
  geom_col()

 nurses_2020 <- nurses %>% 
  filter(Year == 2020) %>% 
  slice_max(order_by = `Total Employed RN`, 
            n = 20)

 ggplot(nurses_2020, aes(y = fct_reorder(State, `Total Employed RN`),
                         x = `Total Employed RN`)) +
   geom_col() +
   labs(y = "State")



