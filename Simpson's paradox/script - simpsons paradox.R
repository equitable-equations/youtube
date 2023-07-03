# Simulate the data -------------------------------------------------------
# (or download from GitHub and load directly)

set.seed(0)

x <- c(rnorm(30, 65, 10),
       rnorm(30, 70, 10),
       rnorm(40, 90, 15))
y <- c(rnorm(30, 75, 10),
       rnorm(30, 50, 10),
       rnorm(40, 35, 15)) + .3 * x
group <- c(rep("A", 30),
           rep("B", 30), 
           rep("C", 40))

xnew <- round(((x - 47) / (112 - 47)) * 20 + 1960)
ynew <- round(((y - 35) / (119 - 35)) * 50 + 250) / 1000

batting <- data.frame(year = xnew, average = ynew, group)

# Simpson's paradox -------------------------------------------------------

library(tidyverse)
View(batting)

ggplot(batting, aes(x = year, 
                    y = average)) +
  geom_point() +
  geom_smooth(method = "lm",
              se = FALSE) +
  scale_y_continuous(labels = scales::label_number(accuracy = .001)) +
  theme_minimal()

ggplot(batting, aes(x = year, 
                    y = average,
                    color = group)) +
  geom_point() +
  geom_smooth(method = "lm",
              se = FALSE) +
  scale_y_continuous(labels = scales::label_number(accuracy = .001)) +
  scale_color_brewer(palette = "Dark2") +
  theme_minimal() 

# Common example ----------------------------------------------------------

ggplot(iris, aes(x = Sepal.Width, 
                 y = Sepal.Length)) + 
  geom_point() +
  geom_smooth(method = "lm",
              se = FALSE)

ggplot(iris, aes(x = Sepal.Width, 
                 y = Sepal.Length,
                 color = Species)) + 
  geom_point() +
  scale_color_brewer(palette = "Dark2") +
  geom_smooth(method = "lm",
              se = FALSE)






