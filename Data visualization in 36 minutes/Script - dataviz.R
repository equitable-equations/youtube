library(tidyverse)
library(modeldata)
?ggplot

?crickets
View(crickets)

# The basics

ggplot(crickets, aes(x = temp, 
                     y = rate)) + 
  geom_point() +
  labs(x = "Temperature",
       y = "Chirp rate",
       title = "Cricket chirps",
       caption = "Source: McDonald (2009)")

ggplot(crickets, aes(x = temp, 
                     y = rate,
                     color = species)) + 
  geom_point() +
  labs(x = "Temperature",
       y = "Chirp rate",
       color = "Species",
       title = "Cricket chirps",
       caption = "Source: McDonald (2009)") +
  scale_color_brewer(palette = "Dark2")

# Modifiying basic properties of the plot

ggplot(crickets, aes(x = temp, 
                     y = rate)) + 
  geom_point(color = "red",
             size = 2,
             alpha = .3,
             shape = "square") +
  labs(x = "Temperature",
       y = "Chirp rate",
       title = "Cricket chirps",
       caption = "Source: McDonald (2009)")

# Learn more about the options for the geom_abline()
# with ?geom_point

# Adding another layer


ggplot(crickets, aes(x = temp, 
                     y = rate)) + 
  geom_point() +
  geom_smooth(method = "lm",
              se = FALSE) +
  labs(x = "Temperature",
       y = "Chirp rate",
       title = "Cricket chirps",
       caption = "Source: McDonald (2009)")

ggplot(crickets, aes(x = temp, 
                     y = rate,
                     color = species)) + 
  geom_point() +
  geom_smooth(method = "lm",
              se = FALSE) +
  labs(x = "Temperature",
       y = "Chirp rate",
       color = "Species",
       title = "Cricket chirps",
       caption = "Source: McDonald (2009)") +
  scale_color_brewer(palette = "Dark2") 

# Other plots

ggplot(crickets, aes(x = rate)) + 
  geom_histogram(bins = 15) # one quantitative variable

ggplot(crickets, aes(x = rate)) + 
  geom_freqpoly(bins = 15)

ggplot(crickets, aes(x = species)) + 
  geom_bar(color = "black",
           fill = "lightblue")

ggplot(crickets, aes(x = species, 
                     fill = species)) + 
  geom_bar(show.legend = FALSE) +
  scale_fill_brewer(palette = "Dark2")

ggplot(crickets, aes(x = species, 
                     y = rate,
                     color = species)) + 
  geom_boxplot(show.legend = FALSE) +
  scale_color_brewer(palette = "Dark2") +
  theme_minimal()

?theme_minimal()

# faceting

# not great:
ggplot(crickets, aes(x = rate, 
                     fill = species)) + 
  geom_histogram(bins = 15) +
  scale_fill_brewer(palette = "Dark2")

ggplot(crickets, aes(x = rate,
                     fill = species)) + 
  geom_histogram(bins = 15,
                 show.legend = FALSE) + 
  facet_wrap(~species) +
  scale_fill_brewer(palette = "Dark2")
?facet_wrap

ggplot(crickets, aes(x = rate,
                     fill = species)) + 
  geom_histogram(bins = 15,
                 show.legend = FALSE) + 
  facet_wrap(~species,
             ncol = 1) +
  scale_fill_brewer(palette = "Dark2") + 
  theme_minimal()
