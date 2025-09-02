library(ellmer)
?interpolate

# Simple prompting --------------------------------------------------------

chat <- chat_openai("You are a friendly but terse 
                statistics mentor. Give answers at
                an advanced undergraduate level.",
                    model = "gpt-5-nano")

prompt <- "Briefly explain the central limit theorem."
chat$chat(prompt)


# Interpolation -----------------------------------------------------------

prompt_open <- "Briefly explain {{ topic }}."
interpolate(prompt_open, 
            topic = "the central limit theorem")

prompt_open_g <- "Briefly explain {topic}."
glue::glue(prompt_open_g, 
           topic = "the central limit theorem")

my_topics <- c("the central limit theorem",
               "maximum likelihood estimation")
interpolate(prompt_open, 
            topic = my_topics)


# Functions ---------------------------------------------------------------

stats_help <- function(topic){
  chat <- 
    chat_openai("You are a friendly but terse 
                statistics mentor. Give answers at
                an advanced undergraduate level.",
                model = "gpt-5-nano") 
  chat$chat(interpolate("Briefly explain 
                        {{ topic }}."),
            echo = "none")
  }

stats_help("central limit theorem")

lapply(my_topics, stats_help)
