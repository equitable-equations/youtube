# Student floristic quality data analysis
# Question: were the C-values of the 4 transects different from one another?

library(tidyverse)
library(here)
library(readxl)
library(janitor)

file1 <- here("student floristic quality data", "lfc_fqa_team1.xlsx")
file2 <- here("student floristic quality data", "lfc_fqa_team2.xlsx")
file3 <- here("student floristic quality data", "lfc_fqa_team3.xlsx")

team1 <- read_excel(file1)
team2 <- read_excel(file2)
team3 <- read_excel(file3)

view(team1)
view(team2)
view(team3)

fqa_data <- rbind(team1, team2, team3)
view(fqa_data)

fqa_data <- fqa_data |> 
  filter(!is.na(species_name)) |> 
  fill(team:plot_number) |> 
  clean_names()

fqa_data_tidier <- fqa_data |> 
  mutate(c = case_when(c == "NN" ~ "nn",
                       c == "NA" ~ NA_character_,
                       TRUE ~ c
                       ))
view(fqa_data_tidier)

fqa_data_tidier |> count(c)

fqa_data_tidier <- fqa_data_tidier |> 
  mutate(c = as.numeric(c)) |> 
  filter(!is.na(c))

ggplot(fqa_data_tidier, aes(x = c)) + 
  geom_bar() + 
  scale_x_continuous(breaks = seq(from = 0, 
                                  to = 10,
                                  by = 2)) +
  theme_minimal()

# How do c-values compare across sites?

fqa_data_tidier |> count(transect_name)
fqa_data_tidier <- fqa_data_tidier |> 
  mutate(transect_name = case_when(transect_name == "Prarie" ~ "Prairie",
                                   transect_name == "Reverie Prairie"~ "Prairie",
                                   transect_name == "Savannah" ~ "Savanna",
                                   transect_name == "Shooting Star Ravine" ~ "Ravine",
                                   transect_name == "Shooting Star Savanna" ~ "Savanna",
                                   transect_name == "Wetland Restoration" ~ "Wetland",
                                   transect_name == "Wetlands" ~ "Wetland",
                                     TRUE ~ .data$transect_name 
                                     ))

fqa_data_tidier |> group_by(transect_name) |> 
  summarize(mean_c = mean(c),
            sd_c = sd(c),
            count = n()) |> 
  arrange(-mean_c)

# A visualization

ggplot(fqa_data_tidier, aes(x = transect_name, 
                            y = c)) +
  geom_boxplot() +
  geom_jitter(width = .2) + 
  theme_minimal()

model <- aov(c ~ transect_name, data = fqa_data_tidier)
summary(model)

ggplot(fqa_data_tidier, aes(x = transect_name, 
                            y = c)) +
  geom_jitter(width = .2) + 
  theme_minimal()


