library(tidyverse)

colors <- c("#770088",
            "#004CFF",
            "#028121",
            "#FFEE00",
            "#FF8D00",
            "#E50000")
# Or just use "red", "orange", etc. 

cats <- letters[1:6]
cats

df <- tibble(cats)
df

ggplot(df, aes(y = cats, 
               fill = cats)) +
  geom_bar(show.legend = FALSE,
           width = 1) +
  scale_fill_manual(values = colors) +
  theme_void()

# Can you make a progress flag?
# Hint: geom_polygon



