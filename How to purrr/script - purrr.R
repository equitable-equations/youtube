library(tidyverse)

map(1:5, sqrt)

map_dbl(1:5, sqrt)
sqrt(1:5)

silly_list <- list("foo",
                   1:5,
                   faithful,
                   TRUE)
class(silly_list)

map_chr(silly_list, class)

faithful_chr <- faithful %>% 
  map_df(as.character)
glimpse(faithful_chr)

faithful_chr <- faithful %>% 
  map_chr(as.character) # error

min_to_sec <- function(x){
  x * 60
}

faithful_sec <- faithful %>% 
  map_df(min_to_sec)

glimpse(faithful_sec)

faithful_sec <- faithful %>% 
  map_df(function(x) x * 60)

faithful_sec <- faithful %>% 
  map_df(\(x) x * 60)

# additional arguments

means <- c(1, 10, 20, 50)

map(means, rnorm, n = 5)
map(means, rnorm, nm = 5) # error

map(means, \(m) rnorm(5, m))

# multiple iterations

sds <- c(.1, 1, 3, 5)

map2(means, 
     sds,
     \(m, s) rnorm(5, m, s)) # iterate over 2 vectors

# If you want all combinations, use
?expand_grid
expand_grid(means, sds)

nums <- 1:4

pmap(list(nums, means, sds), rnorm)


