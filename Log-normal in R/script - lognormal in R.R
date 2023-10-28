# Log-normal problems
library(tidyverse)

# Problem 1
plnorm(1000, 6.1, 1.0) - plnorm(500, 6.1, 1.0)

# Problem 2
qlnorm(.99, 6.1, 1.0)

# Problem 3
fresh <- rlnorm(100, 6.1, 1.0)
fresh

qplot(fresh, geom = "histogram")


