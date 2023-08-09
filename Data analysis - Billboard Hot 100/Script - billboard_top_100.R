# billboard top 100
# Tidy Tuesday Sept. 14, 2021

library(tidyverse)
library(tidytuesdayR)
tuesdata <- tidytuesdayR::tt_load('2021-09-14')
billboard <- tuesdata$billboard
audio <- tuesdata$audio_features
View(billboard)
View(audio)

# Are number one jams more cheerful, 
# in general?

bb1 <- billboard %>% 
  mutate(no1 = (peak_position == 1),
         week_id = mdy(week_id)) %>% 
  group_by(song_id) %>% 
  arrange(week_position, .by_group = TRUE) %>% 
  filter(!duplicated(song_id)) %>% 
  ungroup() %>% 
  select(song_id, 
         no1)

songs <- bb1 %>% 
  left_join(audio, 
            by = "song_id")

mean(is.na(songs$valence))

map_dbl(songs, \(x) mean(is.na(x)))

ggplot(songs, aes(x = valence, 
                  y = no1)) + 
  geom_boxplot() +
  theme_minimal()

t.test(valence ~ no1, 
       data = songs)

# yes, no1 jams are more valent
# however, the difference is small

# How large an effect is this?
# What is cohen's d?

df <- songs %>% 
  group_by(no1) %>% 
  summarize(avg_val = mean(valence, 
                           na.rm = TRUE),
            var_val = var(valence, 
                          na.rm = TRUE))

pooled_sd <- sqrt(sum(df$var_val) / 2)

cohens_d <- diff(df$avg_val) / pooled_sd
cohens_d

