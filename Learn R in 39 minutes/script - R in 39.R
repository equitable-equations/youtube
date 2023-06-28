library(tidyverse)

data()
View(mpg)
?mpg
?mean

glimpse(mpg)

?filter
filter(mpg, cty >= 20)
mpg_efficient <- filter(mpg, cty >= 20)
View(mpg_efficient)

mpg_ford <- filter(mpg, manufacturer == "ford")
View(mpg_ford)

mpg_metric <- mutate(mpg, cty_metric = .425144 * cty)
glimpse(mpg_metric)

mpg_metric <- mpg %>% 
  mutate(cty_metric = .425144 * cty)

View(mpg)

mpg %>% 
  group_by(class) %>% 
  summarize(mean(cty),
            median(cty))

# Data viz with ggplot2

ggplot(mpg, aes(x = cty)) +
  geom_histogram() +
  labs(x = "City mileage")

ggplot(mpg, aes(x = cty)) +
  geom_freqpoly() +
  labs(x = "City mileage")

ggplot(mpg, aes(x = cty)) +
  geom_histogram() +
  geom_freqpoly() +
  labs(x = "City mileage")

ggplot(mpg, aes(x = cty, 
                y = hwy)) + 
  geom_point() +
  geom_smooth(method = "lm")

ggplot(mpg, aes(x = cty, 
                y = hwy,
                color = class)) + 
  geom_point() +
  scale_color_brewer(palette = "Dark2")







