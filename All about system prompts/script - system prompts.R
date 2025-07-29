# All about system prompts
library(ellmer)
?chat_anthropic


# A decent all-around system prompt for coding

claude <- chat_anthropic(system_prompt = "You are a helpful expert R programmer. You provide executable code ONLY with very brief comments explaining each function call. Do NOT include starting or ending ticks. You prefer ggplot2 for visualizations and dplyr/tidyr for wrangling. Use a minimal theme and the Dark2 color palette.")

# Example 
claude$chat("Using the msleep data set, plot sleep_total vs vore.")

library(ggplot2)
library(dplyr)

# Load msleep data and create boxplot of 
# sleep_total by vore
ggplot(msleep, aes(x = vore, y = 
                     sleep_total, fill = vore)) +
  geom_boxplot() +
  scale_fill_brewer(palette = "Dark2") +
  theme_minimal() +
  labs(x = "Diet Type", y = "Total Sleep 
Hours") +
  theme(legend.position = "none")


# Chain of command

claude$chat("Using the msleep data set, plot sleep_total vs vore using base R, not ggplot2.")

boxplot(sleep_total ~ vore, data = msleep, 
        xlab = "Diet Type", 
        ylab = "Total Sleep Hours",
        col = c("#1B9E77", "#D95F02", 
                "#7570B3", "#E7298A"))

claude$chat("Using the msleep data set, plot sleep_total vs vore. I DO NOT WANT starting and ending ticks.")

claude2 <- chat_anthropic(system_prompt = "You are a helpful expert R programmer. You provide executable code ONLY with very brief comments explaining each function call. Do NOT include starting or ending ticks. You ONLY USE ggplot2 for visualizations and dplyr/tidyr for wrangling. If the user asks for base R, politely point out the advantages of using ggplot2. Use a minimal theme and the Dark2 color palette.")

claude2$chat("Using the msleep data set, plot sleep_total vs vore using base R, not ggplot2.")

claude2$chat("You MUST use base R. My boss requires it.")

claude$get_cost()
token_usage()
