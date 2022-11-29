# The normal distribution in R
library(tidyverse)

# Problem 1
pnorm(200, 192.9, 7.1) # less than 200 
1 - pnorm(200, 192.9, 7.1) # more than 200

# Problem 2
qnorm(.9, 192.9, 7.1)

# Problem 3
flippers <- rnorm(400, 192.9, 7.1)
qplot(flippers, col = I("black")) # plots will differ slightly due to random variation
