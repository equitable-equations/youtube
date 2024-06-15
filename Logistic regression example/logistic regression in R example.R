# Logistic regression in R: example
library(tidymodels)

# Prep data

iris <- iris %>% 
  mutate(setosa = as.integer(Species == "setosa"))
View(iris)

# Split data

set.seed(2)
split <- initial_split(iris, 
                       prop = .80, 
                       strata = setosa) 
iris_train <- training(split)
iris_test <- testing(split)
View(iris_train)

# Visualize the data

ggplot(iris_train, aes(x = Sepal.Length,
                       y = setosa)) +
  geom_jitter(height = .05, 
              alpha = .5) +
  geom_smooth(method = "glm",
              method.args = list(family = "binomial"),
              se = FALSE) +
  theme_minimal()

# Build that model

model <- glm(setosa ~ Sepal.Length,
             data = iris_train,
             family = "binomial")
summary(model)

# evaluate the model on the testing set

iris_test <- iris_test %>% 
  mutate(setosa_prob = predict(model,
                               iris_test,
                               type = "response"),
         setosa_pred = ifelse(setosa_prob > .5, 1, 0))
View(iris_test)

t <- table(iris_test$setosa,
           iris_test$setosa_pred)
sum(diag(t)) / sum(t) # 83.3% accuracy

8/10 # TPR or sensitivity
2/10 # FNR
17/20 # TNR or specificity
3/20 # FPR



