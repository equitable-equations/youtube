library(tidyverse)

ggplot(penguins,
       aes(x = bill_len, 
           y = body_mass, 
           color = species)) +
  geom_point() +
  labs(title = "Penguin Bill Dimensions",
       x = "Bill Length (mm)",
       y = "Bill Depth (mm)") +
  theme_minimal()
glimpse(penguins)

# a histogram showing body mass for penguins colored by species
# use an accessible color palette and the default position

ggplot(penguins, 
       aes(x = body_mass, 
           fill = species)) +
  geom_histogram(position = "identity", 
                 bins = 30, 
                 alpha = 0.7) +
  labs(title = "Penguin Body Mass Distribution",
       x = "Body Mass (g)",
       y = "Count") +
  scale_fill_brewer(palette = "Set1") +
  theme_minimal()

# load the scooby data set

library(readxl)
scooby <- read_excel("scooby.xlsx")
glimpse(scooby)

# a plot showing imdb ratings vs network for scooby

ggplot(scooby, 
       aes(x = network, 
           y = imdb, 
           color = network)) +
  geom_boxplot() +
  labs(title = "IMDB Ratings by Network",
       x = "Network",
       y = "IMDB Rating") +
  scale_color_brewer(palette = "Set2") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# a data analysis for scooby considering ratings and the gender of the unmasker


