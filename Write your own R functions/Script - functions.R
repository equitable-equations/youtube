# User-defined functions

library(modeldata)
View(penguins)

# A basic example

keep_top <- function(values){
  values[values > mean(values,
                       na.rm = TRUE)]
}

keep_top(penguins$bill_length_mm)

# A second argument with a default value

keep_top_spec <- function(values, cutoff){
  values[values > cutoff]
}

keep_top_spec(penguins$bill_length_mm, cutoff = 40)

keep_top_spec <- function(values, cutoff = 45){
  values[values > cutoff]
}

keep_top_spec(penguins$bill_length_mm, cutoff = 40)
keep_top_spec(penguins$bill_length_mm)

# Errors & warnings

keep_top(penguins$species) # ugly warning and output

keep_top <- function(values){
  if (!is.numeric(values)){
    stop("Input vector must be numeric.",
         call. = FALSE)
  }
  values[values > mean(values,
                       na.rm = TRUE)]
}

keep_top(penguins$species) 

keep_top <- function(values){
  if (!is.numeric(values)){
    warning("Input vector must be numeric.",
            call. = FALSE)
    return(values)
  }
  values[values > mean(values,
                       na.rm = TRUE)]
}

keep_top(penguins$species)

# passing arguments to function as a list

args <- list(penguins$bill_length_mm,
             cutoff = 50)

keep_top_spec(args) # won't work

do.call(keep_top_spec, args)



