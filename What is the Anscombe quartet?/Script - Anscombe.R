# The Anscombe quartet

library(tidyverse)
theme_set(theme_minimal())

View(anscombe)

# working column-wise:

sapply(anscombe, sd)
summarize(anscombe, 
          across(everything(), sd))

# plotting the first set:

ggplot(anscombe, aes(x = x1, y = y1)) + 
  geom_point() +
  geom_smooth(method = "lm",
              se = FALSE)

# pivoting:
# note: a similar command is also found in the pivot_longer help file.

longer <- anscombe |> 
  pivot_longer(cols = everything(),
               names_pattern = "(.)(.)",
               names_to = c(".value", "set")
               ) 
view(longer)

# plots and summary stats

ggplot(longer, aes(x = x, 
                   y = y,
                   color = set)) + 
  geom_point() + 
  geom_smooth(method = "lm",
              se = FALSE) +
  facet_wrap(~set) +
  scale_color_brewer(palette = "Dark2")

longer |> 
  group_by(set) |> 
  summarize(mean_x = mean(x), 
            mean_y = mean(y), 
            sd_x = sd(x),
            sd_y = sd(y), 
            cor = cor(x, y))
            







