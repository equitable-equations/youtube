# W.E.B. Du Bois data portraits plate 25
# Ref: Battle-Baptiste and Rusert (book)
# Ref: AJ Starks (style guide)

library(tidyverse)

data <- data.frame(value =  c(1434975,
                              1322694,
                              1173624,
                              736170,
                              498532,
                              21186),
                   color =  c("#dc143c",
                              "#e5e5e5",
                              "#ffd700",
                              "#7e7683",
                              "#4682b4",
                              "#ffc0cb"),
                   label = c("1899---$ 1,434,975   ",
                             "1895---$ 1,322,694   ",
                             "1890---$ 1,173,624   ",
                             "1885---$    736,170   ",
                             "1880---$    498,532   ",
                             "1875---$      21,186   "))


# Bar charts --------------------------------------------------------------


# Super basic
ggplot(data, aes(y = label,
                 x = value,
                 fill = label)) +
  geom_col(width = 1,
           orientation = "y")

# Add color palette
ggplot(data, aes(y = label,
                 x = value,
                 fill = label)) +
  geom_col(width = 1,
           orientation = "y") +
  scale_fill_manual(values = data$color)

# Fix ordering of labels
data <- data %>% 
  mutate(label = fct_reorder(label, 1:6))

# Add boundaries
ggplot(data, aes(y = label,
                 x = value,
                 fill = label)) +
  geom_col(width = 1,
           orientation = "y",
           linewidth = .1,
           color = "black") +
  scale_fill_manual(values = data$color)

# Radial plot
ggplot(data, aes(y = label,
                 x = value,
                 fill = label)) +
  geom_col(width = 1,
           orientation = "y",
           linewidth = .1,
           color = "black") +
  scale_fill_manual(values = data$color) +
  coord_radial() +
  theme_void()



# Angled bar chart --------------------------------------------------------



# add columns to data set with coordinates of vertices

m <- -6/(2*pi) # slope wrt theta

data <- data %>% 
  mutate(theta = (value/max(value)) * (15/8) * (2*pi),
         y_ll = 20:25,
         y_ul = 21:26,
         y_ur = y_ul + m * theta,
         y_lr = y_ll + m * theta,
         x_ll = rep(0, times = 6),
         x_ul = rep(0, times = 6),
         x_ur = theta,
         x_lr = theta)

bar_data <- data %>% 
  pivot_longer(cols = contains("_"),
               names_to = c(".value", "vertex"),
               names_sep = "_")

# Super basic
ggplot(bar_data, 
       aes(x = x, 
           y = y, 
           fill = label)) + 
  geom_polygon()

# Preview of radial version
ggplot(bar_data, 
       aes(x, 
           y, 
           fill = label)) + 
  geom_polygon() +
  coord_radial()

ggplot(bar_data, 
       aes(x, 
           y, 
           fill = label)) + 
  geom_polygon() +
  coord_radial(end = 15*pi/4) +
  theme_void()

# fix colors and improve overall look
ggplot(bar_data, 
       aes(x = x, 
           y = y, 
           fill = label)) + 
  geom_polygon(color = "black",
               linewidth = .1) +
  scale_fill_manual(values = data$color)

# Add labels
ggplot(bar_data, 
       aes(x = x, 
           y = y, 
           fill = label)) + 
  geom_polygon(color = "black",
               linewidth = .1) +
  geom_text(data = data,
            aes(x = 0,
                y = y_ll + 0.5,
                label = label),
            hjust = "right",
            size = 2) +
  scale_fill_manual(values = data$color) 

# preview radial version
ggplot(bar_data, 
       aes(x = x, 
           y = y, 
           fill = label)) + 
  geom_polygon(color = "black",
               linewidth = .1) +
  geom_text(data = data,
            aes(x = 0,
                y = y_ll + 0.5,
                label = label),
            hjust = "right",
            size = 2) +
  scale_fill_manual(values = data$color) +
  coord_radial(end = 15*pi/4) +
  theme_void()



# Beautification ----------------------------------------------------------



# need y-axis ranging from 0 to 26
ggplot(bar_data, 
       aes(x = x, 
           y = y, 
           fill = label)) + 
  geom_polygon(color = "black",
               linewidth = .1) +
  geom_text(data = data,
            aes(x = 0,
                y = y_ll + 0.5,
                label = label),
            hjust = "right",
            size = 2) +
  ylim(c(0, 26)) + 
  scale_fill_manual(values = data$color) 

# radial version
ggplot(bar_data, 
       aes(x = x, 
           y = y, 
           fill = label)) + 
  geom_polygon(color = "black",
               linewidth = .1) +
  geom_text(data = data,
            aes(x = 0,
                y = y_ll + 0.5,
                label = label),
            hjust = "right",
            size = 2) +
  ylim(c(0, 26)) + 
  scale_fill_manual(values = data$color) +
  coord_radial(end = 15*pi/4) +
  theme_void()

# start plot on y-axis
ggplot(bar_data, 
       aes(x = x, 
           y = y, 
           fill = label)) + 
  geom_polygon(color = "black",
               linewidth = .1) +
  geom_text(data = data,
            aes(x = 0,
                y = y_ll + 0.5,
                label = label),
            hjust = "right",
            size = 2) +
  ylim(c(0, 26)) + 
  scale_x_continuous(expand = c(0,0)) +
  scale_fill_manual(values = data$color) +
  coord_radial(start = 0,
               end = 15*pi/4) +
  theme_void()

# Small rotation correction, remove legend
ggplot(bar_data, 
       aes(x = x, 
           y = y, 
           fill = label)) + 
  geom_polygon(color = "black",
               linewidth = .1,
               show.legend = FALSE) +
  geom_text(data = data,
            aes(x = 0,
                y = y_ll + 0.5,
                label = label),
            hjust = "right",
            size = 2) +
  ylim(c(0, 26)) + 
  scale_x_continuous(expand = c(0,0)) +
  scale_fill_manual(values = data$color) +
  coord_radial(start = .02,
               end = 15*pi/4) +
  theme_void()

# title and background color

ggplot(bar_data, 
       aes(x = x, 
           y = y, 
           fill = label)) + 
  geom_polygon(color = "black",
               linewidth = .1,
               show.legend = FALSE) +
  geom_text(data = data,
            aes(x = 0,
                y = y_ll + 0.5,
                label = label),
            hjust = "right",
            size = 2) +
  ylim(c(0, 26)) + 
  scale_x_continuous(expand = c(0,0)) +
  scale_fill_manual(values = data$color) +
  coord_radial(start = .02,
               end = 15*pi/4) +
  labs(title = "ASSESSED VALUE OF HOUSEHOLD AND KITCHEN FURNITURE \n OWNED BY GEORGIA NEGROES") +
  theme_void() +
  theme(plot.background = element_rect(fill = "#f9f1e7")) 

# center and bold title
ggplot(bar_data, 
       aes(x = x, 
           y = y, 
           fill = label)) + 
  geom_polygon(color = "black",
               linewidth = .1,
               show.legend = FALSE) +
  geom_text(data = data,
            aes(x = 0,
                y = y_ll + 0.5,
                label = label),
            hjust = "right",
            size = 2) +
  ylim(c(0, 26)) + 
  scale_x_continuous(expand = c(0,0)) +
  scale_fill_manual(values = data$color) +
  coord_radial(start = .02,
               end = 15*pi/4) +
  labs(title = "ASSESSED VALUE OF HOUSEHOLD AND KITCHEN FURNITURE \n OWNED BY GEORGIA NEGROES") +
  theme_void() +
  theme(plot.background = element_rect(fill = "#f9f1e7")) +
  theme(plot.title = element_text(hjust = 0.5,
                                  face = "bold",
                                  size = 9))

# change font (final for now)
ggplot(bar_data, 
       aes(x = x, 
           y = y, 
           fill = label)) + 
  geom_polygon(color = "black",
               linewidth = .1,
               show.legend = FALSE) +
  geom_text(data = data,
            aes(x = 0,
                y = y_ll + 0.5,
                label = label),
            hjust = "right",
            size = 2) +
  ylim(c(0, 26)) + 
  scale_x_continuous(expand = c(0,0)) +
  scale_fill_manual(values = data$color) +
  coord_radial(start = .02,
               end = 15*pi/4) +
  labs(title = "ASSESSED VALUE OF HOUSEHOLD AND KITCHEN FURNITURE \n OWNED BY GEORGIA NEGROES") +
  theme_void() +
  theme(plot.background = element_rect(fill = "#f9f1e7")) +
  theme(plot.title = element_text(hjust = 0.5,
                                  face = "bold",
                                  size = 9),
        text = element_text(family = "Charter")) 



# For export --------------------------------------------------------------


ggplot(bar_data,
       aes(x = x,
           y = y,
           fill = label)) +
  geom_polygon(color = "black",
               linewidth = .1,
               show.legend = FALSE) +
  geom_text(data = data,
            aes(x = 0,
                y = y_ll + 0.5,
                label = label),
            hjust = "right",
            size = 10) +
  ylim(c(0, 26)) +
  scale_x_continuous(expand = c(0,0)) +
  scale_fill_manual(values = data$color) +
  coord_radial(start = .02,
               end = 15*pi/4) +
  labs(title = "ASSESSED VALUE OF HOUSEHOLD AND KITCHEN FURNITURE \n OWNED BY GEORGIA NEGROES") +
  theme_void() +
  theme(plot.background = element_rect(fill = "#f9f1e7")) +
  theme(plot.title = element_text(hjust = 0.5,
                                  face = "bold",
                                  size = 50),
        text = element_text(family = "Charter"))

ggsave("dubois25_gard.png",
       width = 22,
       height = 24,
       bg = "white")




