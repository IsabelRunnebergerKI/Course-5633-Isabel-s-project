### Task 6

#1
f_ratio <- function(x) { 
  mean(x) / median(x)
}
  
v <- c(1, 15, 26, 10, 68, 20, 56, 38, 73, 84, 510, 43, 23, 69, 19) # Example vector
f_ratio(v) # Testing my function

#2
f_outliermean <- function(x) {
  tmp <- sort(x) 
  mean(tmp[2:(length(tmp)-1)])
}

v_outliermean <- f_outliermean(v) # Testing my function with same example vector as above

#3
# https://r4ds.had.co.nz/pipes.html#pipes

# Piping uses the operator %>% from the "magrittr" package to streamline and simplify code. In Tidyverse, the operator is loaded automatically. It helps you to get rid on unnecessary object names in between, as you can write the code is easy steps. "First do this, then this, then this."

# Beware, piping does not work for (1) functions that use the current envirnoment and (2) functions with "lazy evaluation". 

#4
#https://uc-r.github.io/apply_family

# The apply family consist of the functions apply(), lapply(), sapply(), tapply(), as well as mapply(), rapply(), and vapply(). apply() is for matrices and data frames, lapply() for lists…output as list, sapply() for lists…output simplified, tapply() for vectors.

# Apply functions are used to apply another function to the rows or columns of data frames or matrices. It works as a loop. Though not faster than a loop, it is easier to write. This is very useful when I need to apply the same function to a whole column in a large data set, which is very common when working with sequencing data sets. 