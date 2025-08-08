# tool calling with Claude

library(tidyverse)
library(ellmer)
library(rvest)

top_movie <- function(){
  url <- "https://www.boxofficemojo.com/daily/2025/?view=year"
  top_movie_df <- read_html(url) %>% 
    html_table() %>% 
    pluck(1) %>% 
    slice_head(n = 1)
  top_movie_df
}

top_movie()

top_movie_newest <- tool(
  .fun = top_movie,
  .name = "top_movie",
  .description = "Returns the most recently recorded top movie of the day as listed on boxofficemojo.com."
  )

chat <- chat_anthropic(system_prompt = 
                         "you are a terse R assistant")

chat$register_tool(top_movie_newest)

chat$chat("what is the most recent top movie?")

chat$chat("what was the top movie on christmas of 2022?")


top_movies_year <- function(year){
  url <- paste0("https://www.boxofficemojo.com/daily/", year)
  top_movie_df <- read_html(url) %>% 
    html_table() %>% 
    pluck(1) %>% 
    janitor::clean_names()
  top_movie_df
}

df <- top_movies_year(2023)
glimpse(df)

top_movies_year <- tool(
  .fun = top_movies_year,
  .name = "top_movies_year",
  .description = "Returns the top-grossing movies by day for the specified year. Data from boxofficemojo.com.",
  year = type_integer("the year of the date requested")
)

chat$register_tool(top_movies_year)

chat$chat("what was the top movie on christmas of 2022?")

chat$chat("how long was it the top-grossing movie?")

chat$chat("also look at 2023")

chat$chat("give R code to create a single data set showing this movie's performance")

chat$chat("the code should download the data and combine the sets, not create the data from scratch")

chat$get_cost()

