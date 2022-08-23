1 - pgamma(60, 25, 1/3)
1 - pgamma(60, 25, scale = 3)

qgamma(.95, 5, 1/3)

times <- rgamma(1000, 5, 1/3) 
times # your results may be different here.

library(tidyverse)
qplot(times, bins = 25, xlab = "Waiting times") +
  geom_vline(xintercept = 27.46)
