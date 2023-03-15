# Nested data frames, multiple models

library(tidymodels)

glimpse(penguins)

penguins_nested <- penguins |> 
  group_by(species) |> 
  nest()

View(penguins_nested)
View(penguins_nested[[1]])

penguins_lm <- function(df){
  lm(bill_length_mm ~ bill_depth_mm, 
     data = df)
}

penguins_nested <- penguins_nested |> 
  mutate(model = map(data, penguins_lm), 
         model_tidy = map(model, tidy),
         model_glance = map(model, glance))

summary(penguins_nested$model[[1]])
View(penguins_nested$model_glance[[1]])

penguins_m <- penguins_nested |> 
  unnest(model_tidy)
View(penguins_m)

penguins_g <- penguins_nested |> 
  unnest(model_glance)
View(penguins_g)

# Let's get a plot showing the linear models in the 3 groups.

penguins_wide <- penguins_m |> 
  pivot_wider(names_from = term,
              values_from = estimate:model_glance)
View(penguins_wide)

ggplot() +
  geom_point(data = penguins, 
             aes(x = bill_depth_mm,
                 y = bill_length_mm, 
                 color = species)) + 
  geom_abline(data = penguins_wide, 
              aes(slope = estimate_bill_depth_mm,
                  intercept = `estimate_(Intercept)`,
                  color = species)) +
  scale_color_brewer(palette = "Dark2")


