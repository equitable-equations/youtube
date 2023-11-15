library(tidyverse)
theme_set(theme_minimal())

set.seed(1)
t <- slice_sample(trees, n = 5)

p <- ggplot(t, aes(x = Girth, y = Height)) + 
  geom_point()
p

p + annotate(geom = "text",
             x = 16,
             y = 75.5,
             label = "Outlier")

p + annotate(geom = "label",
             x = 14, 
             y = 71.5, 
             label = "Outlier") +
  annotate(geom = "segment",
           x = 14, 
           y = 72, 
           xend = 16.1, 
           yend = 76.5,
           arrow = arrow()) +
  annotate(geom = "rect",
           xmin = 8,
           xmax = 11.5, 
           ymin = 64.5, 
           ymax = 72.5,
           alpha = .1,
           color = "darkgreen", 
           fill = "green")





