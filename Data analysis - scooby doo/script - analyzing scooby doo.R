# Scooby dooby doo!

library(tidyverse)
theme_set(theme_minimal())

library(tidytuesdayR)
tuesdata <- tidytuesdayR::tt_load('2021-07-13')
scooby <- tuesdata$scoobydoo

glimpse(scooby)

scooby_sm <- scooby |> 
  select(series_name:format) |> 
  mutate(imdb = as.double(imdb))

# A preliminary visualization of imdb ratings over time

ggplot(scooby_sm, aes(x = date_aired,
                      y = imdb,
                      color = format)) +
  geom_point() +
  scale_color_brewer(palette = "Dark2")

# Exploring format

table(scooby_sm$format)

crossover <- filter(scooby_sm, format == "Crossover")
View(crossover)

# Let's filter all non-TV series episodes

scooby_sm <- scooby_sm |> 
  filter(format != "Crossover",
         format != "Movie", 
         format != "Movie (Theatrical)")
table(scooby_sm$format)

View(scooby_sm)

# Let's combine the segmented episodes for the purposes
# of considering imdb ratings.

segmented <- scooby_sm |> 
  filter(format == "TV Series (segmented)") |> 
  group_by(date_aired) |> 
  summarize(imdb = mean(imdb),
            network = unique(network),
            series_name = unique(series_name),
            total_runtime = sum(run_time))
View(segmented)

non_seg <- scooby_sm |> 
  filter(format != "TV Series (segmented)") |> 
  select(date_aired,
         imdb,
         network,
         series_name,
         total_runtime = run_time)

scooby_tidied <- rbind(non_seg,
                       segmented)
View(scooby_tidied)

# A new ggplot:

ggplot(scooby_tidied, aes(x = date_aired,
                          y = imdb,
                          col = network)) +
  geom_point() +
  scale_color_brewer(palette = "Dark2")

cw <- scooby_tidied |> 
  filter(network == "The CW")
View(cw)

# Does network inform imdb? Is The CW really so bad?

model <- aov(imdb ~ network, 
             data = scooby_tidied)
summary(model)

TukeyHSD(model)

# Yep. The CW was bad.

# Let's get an awesome bar chart for average imdb ratings
# for the various networks. 

scooby_tidied |> 
  group_by(network) |> 
  summarize(mean_imdb = mean(imdb, na.rm = TRUE)) |> 
  ggplot(aes(x = fct_reorder(network, -mean_imdb), 
             y = mean_imdb,
             fill = network)) + 
  geom_col() +
  geom_text(aes(label = round(mean_imdb, 1)),
            nudge_y = .3) +
  scale_fill_brewer(palette = "Dark2") +
  labs(x = "Network",
       y = "Mean imdb rating",
       title = "Scooby dooby doo!") +
  theme(legend.position = "none",
        axis.text.x = element_text(angle = 15))






