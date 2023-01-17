# Contingency tables
library(ISLR2)
?table

t <- table(Carseats$Urban, Carseats$ShelveLoc)
str(t)
dim(t)

addmargins(t)
dim(addmargins(t))

marginSums(t)
marginSums(t, 1)
marginSums(t, 2)

proportions(t)
proportions(t, 1)
proportions(t, 2)

counts <- c(1, 2, 3, 4)
m <- matrix(counts, nrow = 2, byrow = TRUE)
m

addmargins(m)



