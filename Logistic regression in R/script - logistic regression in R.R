library(tidyverse)
theme_set(theme_minimal())
admissions <- read_csv("admissions.csv")
View(admissions)

ggplot(admissions, aes(x = gpa, 
                       y = admitted)) +
  geom_jitter(height = .05, 
              alpha = .1)

model <- glm(admitted ~ gpa, 
             data = admissions,
             family = "binomial")
summary(model)

ggplot(admissions, aes(x = gpa, 
                       y = admitted)) +
  geom_jitter(height = .05, 
              alpha = .1) +
  geom_smooth(method = "glm",
              method.args = list(family = "binomial"),
              se = FALSE)

adm_sum <- admissions %>% 
  group_by(gpa) %>% 
  summarize(prop_adm = mean(admitted),
            count = n())
adm_sum

ggplot(adm_sum, aes(x = gpa, 
                    y = prop_adm)) +
  geom_point()

model2 <- glm(prop_adm ~ gpa, 
              family = "binomial",
              data = adm_sum, 
              weights = count)
summary(model2)


ggplot(adm_sum, aes(x = gpa, 
                    y = prop_adm,
                    weight = count)) +
  geom_point() +
  geom_smooth(method = "glm",
              se = FALSE,
              method.args = list(family = "binomial"))





