# Data dredging

library(tidyverse)
theme_set(theme_minimal())

# Generate random data

set.seed(1234)

df1 <- matrix(rnorm(1000), ncol = 10) %>% 
  as.data.frame()

df2 <- data.frame(group = rep(LETTERS[1:10], 
                              each = 100), 
                  value = rnorm(1000))

# Demonstration

View(df2)

ggplot(df2, aes(x = group, 
                y = value)) + 
  geom_boxplot()

df2_sm <- filter(df2, group %in% c("G", "H"))
View(df2_sm)

t.test(value ~ group,  
       data = df2_sm)

# Correlations

View(df1)

cor(df1)

# The cutoff for significance is .197
# Here we have 2. 






