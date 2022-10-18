# Notes for separate script
library(tidyverse)
?separate

View(smiths)

separate(smiths,
         col = subject,
         into = c("first", "last"))

separate(smiths,
         col = subject,
         into = c("first", "last"),
         remove = FALSE)

separate(smiths,
         col = subject,
         into = c("first", "last"),
         sep = " ")

separate(smiths,
         col = subject,
         into = c("first", NA))

separate(smiths,
         col = height,
         into = c("m", "cm"),
         convert = TRUE)
