library(tidyverse)
library(ellmer)

glimpse(msleep)

ggplot(msleep, aes(x = bodywt, 
                   y = brainwt)) + 
  geom_point()

?chat_anthropic

claude <- chat_anthropic()

?content_image_plot

claude$chat("Provide suggestions for improving this plot based on dataziv best practice",
            content_image_plot()) 

claude$chat("write r code to implement suggestions 1, 2, 4, and 6. Label the most extreme outlier only as African Elephant. The data set is msleep.")

ggplot(msleep, aes(x = bodywt, y = 
                     brainwt)) +
  # Use log10 scales for both axes
  scale_x_log10(labels = scales::comma) +
  scale_y_log10(labels = scales::comma) +
  # Add points
  geom_point(alpha = 0.7) +
  # Label the African Elephant point only
  geom_text(data = msleep %>% filter(name 
                                     == "African elephant"), 
            aes(label = name), 
            hjust = -0.2, 
            vjust = 0.5,
            size = 3.5) +
  # Add title and proper axis labels
  labs(
    title = "Relationship Between Brain 
Weight and Body Weight in Mammals",
    x = "Body Weight (kg)",
    y = "Brain Weight (kg)",
    caption = "Data source: msleep dataset
from ggplot2 package"
  ) +
  # Use a clean theme
  theme_minimal() +
  # Additional theme customization
  theme(
    plot.title = element_text(face = 
                                "bold", size = 14),
    axis.title = element_text(size = 12),
    plot.caption = element_text(hjust = 0,
                                face = "italic")
  )

live_browser(claude)

# Load libraries
library(ggplot2)
library(dplyr)

# Create improved scatter plot
ggplot(msleep, aes(x = bodywt, y = brainwt)) +
  # Use log scales
  scale_x_log10(labels = scales::comma) +
  scale_y_log10(labels = scales::comma) +
  # Add points
  geom_point(alpha = 0.7) +
  # Label African Elephant only
  geom_text(data = msleep %>% filter(name == "African elephant"), 
            aes(label = name), 
            hjust = -0.2, 
            vjust = 0.5,
            size = 3.5) +
  # Add title and axis labels
  labs(
    title = "Relationship Between Brain Weight and Body Weight in Mammals",
    x = "Body Weight (kg)",
    y = "Brain Weight (kg)",
    caption = "Data source: msleep dataset"
  ) +
  # Apply theme
  theme_minimal() +
  # Customize appearance
  theme(
    plot.title = element_text(face = "bold", size = 14),
    axis.title = element_text(size = 12),
    plot.caption = element_text(hjust = 0, face = "italic")
  )

claude$get_cost()

