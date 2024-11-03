# Analysis of variance
# Is weight independent from feed?

library(tidyverse)
View(chickwts)
?chickwts

ggplot(chickwts, aes(x = feed, 
                     y = weight)) + 
  geom_boxplot(outlier.shape = NA) + 
  geom_jitter() +
  theme_minimal()

model <- aov(chickwts$weight ~ chickwts$feed)
summary(model)

?TukeyHSD
TukeyHSD(model)


