# Plotting functions with ggplot()
library(tidyverse)

ggplot() +
  xlim(c(-3, 3)) + 
  geom_function(fun = dnorm)

ggplot() +
  xlim(c(-3, 3)) + 
  geom_function(fun = dnorm, 
                args = list(mean = .1, 
                            sd = 1.5)) +
  labs(y = NULL) +
  theme_bw()

ggplot() + 
  xlim(c(-2, 2)) + 
  geom_function(fun = function(x) x^2) +
  labs(y = NULL) +
  theme_bw()

ggplot() + 
  xlim(c(-2, 2)) + 
  geom_function(fun = function(x) x^2,
                aes(color = "Second degree")) +
  geom_function(fun = function(x) x^3,
                aes(color = "Third degree")) + 
  labs(color = "Degree", 
       y = NULL) +
  theme_bw()

set.seed(1)
data <- rnorm(250)
df <- data.frame(data)
width <- .2
area <- width * length(data)
ggplot(df, aes(x = data)) +
  geom_histogram(binwidth = width, 
                 col = "blue", 
                 fill = "lightblue") + 
  geom_function(fun = function(x) area * dnorm(x), 
                col = "black") +
  theme_bw()


