library(tidyverse)

ggplot(faithful, aes(x = waiting)) + 
  geom_histogram(color = "black") +
  labs(x = "Waiting time")

quantile(faithful$waiting, .35)
quantile(faithful$waiting, c(.35, .70, .95))

summary(faithful$waiting)

ecdf(faithful$waiting)(79)
