# pivot_longer
library(tidyverse)

Body_temps <- read_excel("03 - Body Temperatures.xlsx") # read in data

?pivot_longer

temps <- pivot_longer(Body_temps, 
                      cols = 3:6,
                      names_to = "Observation",
                      values_to = "Temperature")
View(temps)

# using starts_with to select columns
temps <- pivot_longer(Body_temps, 
                      cols = starts_with("Day"),
                      names_to = "Observation",
                      values_to = "Temperature")
View(temps)

# drop rows without temperature observations
temps <- pivot_longer(Body_temps, 
                      cols = starts_with("Day"),
                      names_to = "Observation",
                      values_to = "Temperature",
                      values_drop_na = TRUE)

ggplot(temps, aes(x = Observation, 
                  y = Temperature,
                  color = Observation)) +
  geom_boxplot()

# breaking up the Observation columns

temps <- pivot_longer(Body_temps, 
                      cols = starts_with("Day"),
                      names_to = c("Day", "Time"),
                      names_sep = "-",
                      values_to = "Temperature",
                      values_drop_na = TRUE)
View(temps)

ggplot(temps, aes(x = "", 
                  y = Temperature)) +
  geom_boxplot() + 
  facet_grid(Day ~ Time) +
  labs(x = "")

