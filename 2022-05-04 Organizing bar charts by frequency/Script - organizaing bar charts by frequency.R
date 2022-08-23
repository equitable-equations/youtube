library(tidyverse)
?fct_infreq

glimpse(gss_cat)
ggplot(gss_cat, aes(x = marital)) +
         geom_bar() +
         theme_minimal()

levels(gss_cat$marital)

ggplot(gss_cat, aes(x = fct_infreq(marital),
                    fill = fct_infreq(marital))) +
  geom_bar() +
  labs(x =  "Marital status") +
  scale_fill_brewer(palette = "Set2") +
  theme_minimal() +
  theme(legend.position = "none")
