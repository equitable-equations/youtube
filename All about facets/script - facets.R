# All about facets

library(tidyverse)
library(modeldata)
theme_set(theme_minimal())

# create data set
set.seed(0)
n <- 200
rho <- .2
m <- 2
x <- runif(n, 0, 10)
y <- m *x + 5 + rnorm(n, 0, .71 * sd(x) / rho)
df1 <- data.frame(x, y)

rho <- .5
x <- runif(n, 0, 10)
y <- m *x + 5 + rnorm(n, 0, 1 * sd(x) / rho)
df2 <- data.frame(x, y)

rho <- .8
x <- runif(n, 0, 10)
y <- m *x + 5 + rnorm(n, 0, .79 * sd(x) / rho)
df3 <- data.frame(x, y)

df <- bind_rows(df1, 
                df2, 
                df3, 
                .id = "set")

# faceting scat

p <- ggplot(scat, aes(x = d13C,
                      y = d15N)) +
     geom_point() # starter plot
p + facet_wrap(~Species,
               nrow = 3)

p + facet_wrap(vars(Species))

p + facet_grid(Location~Species)

my_labeller <- as_labeller(c("bobcat" = "Bobcat",
                             "coyote" = "Coyote",
                             "gray_fox" = "Gray Fox"))

p + facet_wrap(~Species, 
               labeller = my_labeller)
  
# R^2 demonstration

glimpse(df)

ggplot(df, aes(x, y)) +
  geom_point(alpha = .6) + 
  geom_smooth(method = "lm",
              se = FALSE) +
  facet_wrap(~set)

df2 <- df %>% 
  mutate(set = fct_recode(set, 
                          "R^2==0.2" = "1",
                          "R^2==0.5" = "2",
                          "R^2==0.8" = "3"))

ggplot(df2, aes(x, y)) +
  geom_point(alpha = .6) + 
  geom_smooth(method = "lm",
              se = FALSE) +
  facet_wrap(~set,
             labeller = "label_parsed")

ggplot(df2, aes(x, y)) +
  geom_point(alpha = .6) + 
  geom_smooth(method = "lm",
              se = FALSE,
              linewidth = 1.8,
              color = "#5798A6") +
  facet_wrap(~set,
             labeller = "label_parsed") +
  theme_minimal() + 
  labs(x = NULL,
       y = NULL) + 
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        panel.background = element_rect(fill = "#E1E1D3",
                                        color = "#E1E1D3"),
        plot.background = element_rect(fill = "#E1E1D3")) 
