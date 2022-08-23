
# Lists in R --------------------------------------------------------------
library(tidyverse)

nums <- 2:6
words <- "hello world!"
logicals <- c(TRUE, FALSE)

l1 <- list(nums, words, logicals)
l1
str(l1)

l1[1]
str(l1[1])

l1[[1]]

l2 <- list(a = 1:10, b = "hi", c = letters)
l2
l2$a

l3 <- list(letters, l1, msleep)
str(l3)

mammals_list <- msleep %>% 
  group_by(vore) %>% 
  group_split()
str(mammals_list)
