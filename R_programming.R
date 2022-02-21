# Creating Vectors
# The c() function can be used to create vectors of objects.
x <- c(0.5, 0.6)	## numeric
x <- c(TRUE, FALSE)	## logical
x <- c(T, F)	## logical
x <- c("a", "b", "c")	## character
x <- 9:29	## integer
x <- c(1+0i, 2+4i)	## complex
Using the vector() function
x <- vector("numeric", length = 10)
x
# Mixing Objects
# What happens with the following vectors?
  y <- c(1.7, "a")	## character
y <- c(TRUE, 2)	## numeric
y <- c("a", TRUE)	## character
#When different objects are mixed in a vector, coercion occurs so that every element in the vector is of the same class.
x <- 0:6
class(x)
as.numeric(x) 
[1] 0 1 2 3 4 5 6
as.logical(x)
as.character(x)

x <- c("a", "b", "c")
as.numeric(x) 
as.logical(x)  
as.complex(x) 

# NAs introduced by coercion

# Creating Matrices
# Matrices are vectors with a dimension attribute. The dimension attribute is itself an integer vector of length 2 (nrow, ncol)
m <- matrix (nrow = 2, ncol = 3)
m
## [,1] [,2] [,3] [1,]  NA  NA  NA [2,]  NA  NA  NA
dim(m)  

attributes(m)
$dim

# Matrices are constructed column-wise, so entries can be thought of starting in the "upper left" corner and running down the columns.
m <- matrix(1:6, nrow = 2, ncol = 3)
m

# Matrices can also be created directly from vectors by adding a dimension attribute.
m <- 1:10
m

dim(m) <- c(2, 5)
m

# cbind-ing and rbind-ing
# Matrices can be created by column-binding or row-binding with cbind() and rbind().
x <- 1:3
y <- 10:12
cbind (x, y)

rbind (x, y) 

# Creating Lists
# Lists are a special type of vector that can contain elements of different classes. Lists are a very important data type in R and you should get to know them well.
x <- list(1, "a", TRUE, 1 + 4i)
x [[1]] 

x[[2]] 

x[[3]]

x[[4]]

# Creating Factors
# Factors are used to represent categorical data. Factors can be unordered or ordered. One can think of a factor as an integer vector where each integer has a label.
  # .	Factors are treated specially by modelling functions like lm() and glm()
  # .	Using factors with labels is better than using integers because factors are self-describing; having a variable that has values
# "Male" and "Female" is better than a variable that has values 1 and 2.

x <- factor (c("yes", "yes", "no", "yes", "no"))
x

table(x)

unclass(x) 

# The order of the levels can be set using the levels argument to factor(). This can be important in linear modelling because the first level is used as the baseline level.
x <- factor (c("yes", "yes", "no", "yes", "no"),
             levels = c("yes", "no"))
x

# Data Frames
# The data frame, or dataframe, is a key data type used in R . It is used to store tabular data. Tabular data accounts for much of what we do in statistics. Of course, not all types of data are tabular, but much data of the data we use becomes a tabular form.

# Dataframes can also be created using the data.frame() function. 
x <- data.frame (foo = 1:4, bar = c(T, T, F, F))
x

nrow(x)

ncol(x)

# Missing Values
# Missing values are denoted by NA or NaN for undefined mathematical operations.
  # is.na() is used to test objects if they are NA
  # is.nan() is used to test for NaN
  # .	NA values have a class also, so there are integer NA, character NA, etc.
  # .	A NaN value is also NA but the converse is not true
x <- c(1, 2, NA, 10, 3)
is.na(x)

is.nan(x)

x <- c(1, 2, NaN, NA, 4)
is.na(x)

is.nan(x) 

# Subsetting - Basics
# There are a number of operators that can be used to extract subsets of R objects.
  # .	[ always returns an object of the same class as the original; can be used to select more than one element (there is one exception)
  # .	[[ is used to extract elements of a list or a data frame; it can only be used to extract a single element and the class of the returned object will not necessarily be a list or data frame
  # .	$ is used to extract elements of a list or data frame by name; semantics are similar to that of [[.

x <- c("a", "b", "c", "c", "d", "a")
x[1] [1] "a"
x[2] [1] "b"
x[1:4]
x[x > "a"]
u <- x > "a"
u
x[u]
                                      
# Subsetting - Lists
x <- list (foo = 1:4, bar = 0.6)
x[1]
x[[1]]
x[["bar"]] [1] 0.6
x["bar"]
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1, 3)]

# The [[ operator can be used with computed indices; $ can only be used with literal names.
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
name <- "foo"
x[[name]]	## computed index for 'foo' [1] 1 2 3 4
x$name	## element 'name' doesn't exist! NULL
x$foo

# Subsetting Nested Elements of a List
# The [[ can take an integer sequence.
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x[[c(1, 3)]]
                                                                                                                           x[[1]][[3]] 
x[[c(2, 1)]]  	 	 	 		

# Subsetting - Matrices
# Matrices can be subsetted in the usual way with (i, j) type indices
x <- matrix (1:6, 2, 3)
x[1, 2]
x[2, 1]

# indices can also be missing.
x[1, ] 
x[, 2] 

# Similarly, subsetting a single column or a single row will give you a vector, not a matrix (by default). By default, when a single element of a matrix is retrieved, it is returned as a vector of length 1 rather than a 1 × 1 matrix. This behavior can be turned off by setting drop = FALSE.

x <- matrix(1:6, 2, 3)

x[1, 2, drop = FALSE]

# Similarly, subsetting a single column or a single row will give you a vector, not a matrix (by default).

x <- matrix(1:6, 2, 3)
x[1, ] 
x[1, , drop = FALSE] 

# Subsetting - Partial Matching
# Partial matching of names is allowed with [[ and $.
x <- list(aardvark = 1:5)
x$a
x[["a"]] 
x[["a", exact = FALSE]]
                                                                                                                                   # Subsetting - Removing Missing Values
# A common task is to remove missing values (NAs).
x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
x[!bad]
                                                                                                                                   # What if there are multiple things and you want to take the subset with no missing values?
x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
                                                                                                                                   good <- complete.cases(x, y)
good

x[good] 
y[good]                                                                                                                                   
airquality[1:6, ]

## Ozone Solar.R Wind Temp Month Day
                                                                                                                                   
good <- complete.cases(airquality)
airquality[good, ][1:6, ]

# Missing Values

# There is a special type of object for missing values. Missing values in R are denoted by either NA or NAN (Not a Number), which we briefly mentioned. NAN is used for undefined mathematical operations, and NA is used for everything else. 

# There is a function in R called is.na, which is used to test objects to see if they are NA if they are any missing values in the object. There is another function called is.nan, which is used to test for NANs. NA values can have a class, too. So, we can have missing integer  values or we can have missing character values and so on. 

x <- c(1, 2, NA, 10, 3) 
is.na(x)

is.nan(x)

x <- c(1, 2, NaN, NA, 4)
is.na(x)

is.nan(x)

# Control Structures - if-else

# if(<condition>) {
    # do something
# } else {
    # do something else
  
# }
# if(<condition1>) {
  # do something
#} else if(<condition2>) {
  # do something different
#} else {
  # do something different
#}

# This is a valid if-else structure.

x = 2
if(x > 3) {
  y <- 10
} else {
  y <- 0
}
y

# So is this one.

y <- if(x > 3) {
  10
} else {
  0
}
y

# Control Structures - for

# for(i in 1:10) {
# print (i)
# }

# These three loops have the same behavior.

x <- c("a", "b", "c", "d")
for(i in 1:4) {
  print(x[i])
}

for(i in seq_along(x))  {
  print(x[i])
}

for(letter in x) {
  print(letter)
}

for(i in 1:4) print (x[i])

# Nested for loops
# for loops can be nested.
x <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i, j])
  }
}

# Control Structures - while
# While loops begin by testing a condition. If it is true, then they execute the loop body. Once the loop body is executed, the condition is tested again, and so forth.

count <- 0 
while (count < 10) {
  print(count)
  count <- count + 1
}

# Sometimes there will be more than one condition in the test.
z <- 5
while(z >= 3 && z <= 10)  {
  print(z)
  coin <- rbinom(1, 1, 0.5)
  if(coin == 1) { ## random walk 
    z <- z + 1
  } else {
    z <- z - 1
  }
}

# Control Structures - repeat
# Repeat initiates an infinite loop; these are not commonly used in statistical applications but they do have their uses. The only way to exit a repeat loop is to call break.
x0 <- 1
tol <- 1e-8
repeat {
  x1 <- (x0-1)
  if(abs(x1 - x0) < tol) {
    break
  } else {
    x0 <- x1
  }
}
x1

# Control Structures - next, return
# next is used to skip an iteration of a loop

# for(i in 1:100)  {
  # if(i <= 20) {
    # Skip the first 20 iterations
    # next                 
#  }
  ## Do something here
# }

# break is used to exit a loop immediately, regardless of what iteration the loop may be on.
for(i in 1:100) {
  print(i)
  
  if(i > 20) {
    ## Stop loop after 20 iterations
    break  
  }		
}


