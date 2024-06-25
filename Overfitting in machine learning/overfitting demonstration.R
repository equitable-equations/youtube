# Overfitting demonstration

library(tidyverse)

# Create the data ---------------------------------------------------------

set.seed(1)
x <- runif(1000, 0, 10)
y <- 6 - .5 * x + rnorm(1000, sd = 2)
df <- data.frame(x, y)

set.seed(0)
df_sample <- df %>% 
  slice_sample(n = 25)

# Visualization -----------------------------------------------------------

ggplot(df, aes(x, y)) + 
  geom_point(color = "lightblue") + 
  geom_abline(slope = -.5, 
              intercept = 6,
              color = "blue",
              linewidth = 1)

ggplot(df, aes(x, y)) + 
  geom_point(color = "lightblue") + 
  geom_abline(slope = -.5, 
              intercept = 6,
              color = "blue",
              linewidth = 1) +
  geom_point(data = df_sample,
             color = "black") +
  geom_smooth(data = df_sample,
              se = FALSE,
              color = "black")

ggplot(df, aes(x, y)) + 
  geom_point(color = "lightblue") + 
  geom_abline(slope = -.5, 
              intercept = 6,
              color = "blue",
              linewidth = 1) +
  geom_point(data = df_sample,
             color = "black") +
  geom_smooth(data = df_sample,
              se = FALSE,
              method = "lm",
              color = "black")

# Model building ----------------------------------------------------------

model_linear <- lm(y ~ x, 
                   data = df_sample)
model_loess <- loess(y ~ x, 
                    data = df_sample)

summary(model_linear)
summary(model_loess)

# Model evaluation --------------------------------------------------------

df_resid <- df %>% 
  mutate(linear_resid = df$y - predict(model_linear, df),
         loess_resid = df$y - predict(model_loess, df)) %>% 
  drop_na()
View(df_resid)

rss_linear <- sum(df_resid$linear_resid^2)
rss_loess <- sum(df_resid$loess_resid^2)

rss_linear
rss_loess
