library(tidyverse)
library(ISLR2)

# Do colleges with larger full-time enrollments
# have lower graduation rates?
# Is this different for public/private institutions?
# If it different for more selective schools?

?College
glimpse(College)

# Exploratory graphics

ggplot(College, aes(x = Grad.Rate)) +
  geom_histogram() # Note weird outlier

suspicious <- filter(College, Grad.Rate >= 100)
View(suspicious)

ggplot(College, aes(x = log10(F.Undergrad),
                    y = Grad.Rate)) + 
  geom_point()

college_sm <- College %>% 
  mutate(log_full = log10(F.Undergrad)) %>% 
  select(Grad.Rate,
         log_full,
         Private, 
         Top25perc)
View(college_sm)

# Modeling

ggplot(College, aes(x = log10(F.Undergrad),
                    y = Grad.Rate)) + 
  geom_point() +
  geom_smooth(method = "lm")

model_undergrad <- lm(Grad.Rate ~ log_full,
                      data = college_sm)
summary(model_undergrad)
plot(model_undergrad)

# What about Private?

ggplot(College, aes(x = log10(F.Undergrad),
                    y = Grad.Rate,
                    color = Private)) + 
  geom_point() +
  geom_smooth(method = "lm",
              se = FALSE) +
  scale_color_brewer(palette = "Dark2")

model_private <- lm(Grad.Rate ~ Private + log_full,
                    data = college_sm)
summary(model_private)

# Interaction: private and F.Undergrad

model_private_int <- lm(Grad.Rate ~ Private * log_full,
                    data = college_sm)
summary(model_private_int)
anova(model_private_int)

# What about Top25perc?

model_top <- lm(Grad.Rate ~ Private + 
                  log_full +
                  Top25perc,
                data = college_sm)
summary(model_top)
plot(model_top)



# Inset plot from YouTube thumbnail

ggplot(College, aes(x = log10(F.Undergrad),
                    y = Grad.Rate,
                    color = Private)) + 
  geom_point() +
  geom_smooth(method = "lm",
              se = FALSE) +
  labs(x = "Full-time undergraduates (log scale)",
       y = "Graduation rate",
       color = "Private?",
       title = "Bigger schools, more degrees") +
  scale_color_brewer(palette = "Dark2") +
  theme_minimal()




