# understanding R functions

# from last vid:

keep_top_spec <- function(vals, cutoff = mean(vals)) {
  # returns only elements of vals above cutoff 
  vals[vals > cutoff] 
}

formals(keep_top_spec)
body(keep_top_spec)

View(keep_top_spec)

View(which)
body(which)
?which

body(is.na)
typeof(is.na)

typeof(keep_top_spec)
typeof(which)

just_y <- function(){
  y <- 4
  y
}

just_y()
y

y <- 9

just_y()
y

simpler_y <- function(){
  y
}

simpler_y()

y <- 10
simpler_y()

add_one <- function(){
  if (!exists("u")){
    u <- 0 
  } else {
    u <- u + 1
  }
  u
}

add_one()



