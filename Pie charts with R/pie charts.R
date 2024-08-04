# Pie charts in R

library(tidyverse)
library(modeldata)
View(penguins)

# Bar chart for comparison

ggplot(penguins, aes(x = species,
                     fill = species)) +
  geom_bar(show.legend = FALSE) +
  scale_fill_brewer(palette = "Dark2") +
  labs(x = "Species",
       y = NULL) + 
  theme_minimal() 

# Obtain counts for penguin species

pen_sum <- penguins %>% 
  count(species)
pen_sum

# A stacked bar chart

ggplot(pen_sum, aes(x = "",
                    y = n, 
                    fill = species)) + 
  geom_col() +
  scale_fill_brewer(palette = "Dark2") +
  labs(fill = "Species",
       x = NULL,
       y = NULL) +
  theme_minimal()

# A basic pie chart

ggplot(pen_sum, aes(x = "",
                    y = n, 
                    fill = species)) + 
  geom_col() +
  coord_polar("y") +
  scale_fill_brewer(palette = "Dark2") +
  labs(fill = "Species",
       x = NULL,
       y = NULL) +
  theme_void()

# Adding labels

pen_sum <- penguins %>% 
  count(species)  %>% 
  arrange(desc(species)) %>% 
  mutate(frac = round(n / sum(n), 2),
         percent = paste0(frac * 100, "%"),
         ypos = cumsum(n) - .5*n)
pen_sum

ggplot(pen_sum, aes(x = "",
                y = n,
                fill = species)) + 
  geom_col() +
  geom_text(aes(label = percent, 
                y = ypos)) +
  scale_fill_brewer(palette = "Dark2") +
  labs(fill = "Species") +
  theme_void()

ggplot(pen_sum, aes(x = "",
                    y = n,
                    fill = species)) + 
  geom_col() +
  geom_text(aes(label = percent, 
                y = ypos)) + 
  coord_polar("y") +
  scale_fill_brewer(palette = "Dark2") +
  labs(fill = "Species") +
  theme_void()
