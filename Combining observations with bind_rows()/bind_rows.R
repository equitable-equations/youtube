# combining sets using bind_rows
library(tidyverse)
?bind_rows

# construct data sets 

msleep1 <- data.frame(name = c("Cheetah", 
                               "Dog"),
                      genus = c("Acinonyx",
                                "Canis"))
msleep2 <- data.frame(name = c("Cow",
                               "Goat"),
                      genus = c("Bos",
                                "Capri"))
msleep3 <- data.frame(Name = c("Red fox",
                               "Mole rat"),
                      genus = c("Vulpes",
                                "Spalax"))
msleep1
msleep2
msleep3

bind_rows(msleep1, msleep2)
sleep_list <- list(msleep1, msleep2)
sleep_list

bind_rows(sleep_list)
bind_rows(sleep_list,
          .id = "researcher") %>% 
  mutate(researcher = fct_recode(researcher, 
                                 "George" = "1",
                                 "Sarah" = "2"))

bind_rows(msleep2, msleep3)

msleep3 %>% 
  rename("name" = "Name") %>% 
  rbind(msleep2, 
        msleep1)

rbind(msleep2, msleep3)






