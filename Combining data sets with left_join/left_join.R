library(tidyverse)
library(babynames)
?left_join

babynames
applicants

left_join(babynames, appllicants)




# Building the states data sets -------------------------------------------

state_geog <- data.frame(state = state.abb,
                          area = state.area,
                          center_long = state.center$x,
                          center_lat = state.center$y)
state_reg = data.frame(name = state.name,
                       abbr = state.abb,
                       region = state.region)
