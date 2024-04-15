library(tidyverse)

iris <- iris %>% 
  mutate(setosa = as.integer(Species == "setosa"))

ggplot(iris, aes(x = Sepal.Length,
                 y = setosa)) + 
  geom_jitter(height = .05,
              alpha = .4) +
  geom_smooth(method = "glm",
              se = FALSE,
              method.args = list(family = "binomial"))

model <- glm(setosa ~ Sepal.Length,
             data = iris,
             family = "binomial")
summary(model)

-2 * (50 * log(1/3) + 100 * log(2/3))

p_hat <- fitted.values(model, type = "response")
p_hat

-2 * (sum(log(p_hat[1:50])) + sum(log(1 - p_hat[51:150])))
