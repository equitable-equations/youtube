library(tidyverse)
?airquality
View(airquality)

qplot(airquality$Wind, geom = "histogram")
t.test(airquality$Wind, mu = 9)

qplot(airquality$Solar.R, geom = "histogram")
t.test(airquality$Solar.R, 
       mu = 175, 
       alternative = "greater")
