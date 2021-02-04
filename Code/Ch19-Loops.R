#--------Chapter 19 Loop Statements-----------#
#---------------------------------------------#
#### 1. Basic Statements
#### if Statement
# if statement is used to test an expression.
# If the test_expression is TRUE, the statement gets executed. 
# But if it’s FALSE, nothing happens.

# (1) Create if statement 
# Method 1: without curly braces (one line)
x <- c(8, 3, -2, 5)

if(any(x < 0)) print("x contains negative numbers")

# Method 2: with curly braces (multiple lines)
if(any(x < 0)) {
    print("x contains negative numbers")
}

# Method 3: give functon a name 
negative <- function(x) {
  if(any(x < 0))
  print("x contains negative numbers")
}

negative(x)

# (2) If x doesn't have any negative value, function gives nothing
x <- c(2,4,6,7)
negative(x)

#### if...else Statement
# (3) Create if...else statement, contain negative numbers  
x <- c(8, 3, -2, 5)

if(any(x < 0)) {
  print("x contains negative numbers")
} else{
  print("x contains all positive numbers")
}

# (4) Create if...else statement, contain all positive numbers  
x <- c(2,4,6,7)

test <- function(x) { 
  if(any(x < 0)) {
  print("x contains negative numbers")} 
  else{
  print("x contains all positive numbers")}
}

test(x)

# (5) use if...else if...else statement
x <- 7

if(x >= 10) {
  print("x exceeds acceptable tolerance levels")
} else if(x >= 0 & x < 10) {
  print("x is within acceptable tolerance levels")
} else {
  print("x is negative")
}

#### for Loop
# for loop: execute repetitive code statements for a particular number of times. 

# (6) for loop: give a list of outputs 
for(i in 2010:2016) {
  output <- paste("The year is", i)
  print(output)
}

# (7) for loop: outputs combined into a single vector 
# not very good since R is not efficient at growing data objects
x <- NULL

for(i in 2010:2016) {
  output <- paste("The year is", i)
  x <- append(x, output)
}

x

# (8) for loop: create empty data object and fill it with the for loop outputs
x <- vector(mode = "numeric", length = 7) 
counter <- 1

for(i in 2010:2016) {
  output <- paste("The year is", i) 
  x[counter] <- output
  counter <- counter + 1 
}

x 

# (9) for loop: create an empty matrix with 5 rows and 5 columns. 
# The for loop then iterates over each column and takes a random draw
# of 5 values from a Poisson distribution with mean i in column i
my.mat <- matrix(NA, nrow = 5, ncol = 5)

for(i in 1:ncol(my.mat)) {
  my.mat[, i] <- rpois(5, lambda = i)
}

my.mat

#### while Loop
# While loops begin by testing a condition. 
# If it is true, then they execute the statement. 
# Once statement is executed, the condition is tested again, and so forth, 
# until the condition is false, after which the loop exits. 
# Best practice: include a counter object to keep track of total iterations

# (10) Create a while loop
# Method 1: use while loop 
counter <- 1

while(counter <= 10) {
  print(counter)
  counter <- counter + 1
}

# Method 2: use for loop 
counter1 <- vector(mode = "numeric", length = 10)

for(i in 1:length(counter1)) {
  print(i)
} 

# Difference between for loop & while loop: 
# (i) for loop: number of iterations should be run is known
# () while loop: number of iterations should be run is unknown 
#                (stops until condition is false)

# (11) code runs 14 times until x exceeded threshold 9.
counter <- 1
x <- 5
set.seed(3)

while(x >= 3 && x <= 8 ) {
  coin <- rbinom(1, 1, 0.5)     ## flip a coin, gives 0 or 1 
  if(coin == 1) {               ## random walk
    x <- x + 1
  } else {
    x <- x - 1
  }
  cat("On iteration", counter, ", x =", x, '\n')
  counter <- counter + 1
}

#### repeat Loop
# A repeat loop is used to iterate over a block of code multiple number of times.
# (12) Create a repeat loop
counter <- 1
x <- NULL

repeat {
  x <- c(x, round(runif(1, min = 1, max = 25)))      # pick 1 value between 1~25
  if(all(1:25 %in% x)){
    break
  }
  counter <- counter + 1
}

counter

#### Break Function to Exit a Loop
# break function is used to exit a loop immediately, 
# regardless of what iteration the loop may be on. 
# typically embedded in an if statement in which a condition is assessed, 
# if TRUE break out of the loop, if FALSE continue on with the loop. 
# In a nested looping situation, where there is a loop inside another loop, 
# this statement exits from the innermost loop that is being evaluated.

# (13) Break function 
x <- 1:5
for (i in x) {
  if (i == 3){
    break
  } print(i)
}

#### next Function to Skip an Iteration in a Loop
# next function: useful when we want to skip the current iteration of 
# a loop without terminating it. 

# (14) next function 
x <- 1:5

for (i in x) {
  if (i == 3) {
    next
    } 
  print(i)
}
#---------------------------------------------#

#### 2. Apply Family
# apply family: consists of vectorized functions which minimize your need 
# to explicitly create loops. These functions will apply a specified function 
# to a data object and their primary difference is in the object class in which 
# the function is applied to (list vs. matrix, etc) and the object class 
# that will be returned from the function. 

# apply() for Matrices and Data Frames
# Using apply() is not faster than using a loop function, 
# but it is highly compact and can be written in one line.

# Basic syntax: 
# apply(x, MARGIN, FUN, ...)
# where x: matrix/dataframe/array
# MARGIN: for a matrix,  1 indicates rows, 2 indicates columns, 
#         c(1, 2) indicates rows and columns.
# FUN:  the function to be applied
# ... is for any other arguments to be passed to the function

# (1) use apply()
# (i) get mean of each column
# load the data 
head(mtcars)
str(mtcars)

# get teh mean
apply(mtcars, 2, mean)

# (ii) get the sum of each row
apply(mtcars, 1, sum)

# (iii) get column quantiles 
apply(mtcars, 2, quantile, probs=c(0.1, 0.25, 0.5, 0.75, 0.9))

#### lapply() for Lists: Output as a List (l means list)
# lapply() does the following: 
# i) it loops over a list, iterating over each element in that list
# ii) it applies a function to each element of the list (a function that you specify) 
# iii)  returns a list (the l is for “list”).

# syntax of lapply function
# lapply(x, FUN, ...)
# x is list, FUN is function
# ... is for any other arguments to be passed to the function

# (2) get mean of each list item
# Create a list 
(data <- list(item1 = 1:4, item2 = rnorm(10),
             item3 = rnorm(20, 1), item4 = rnorm(100, 5)))

# get the mean
lapply(data, mean)

# (3) embed an apply function within an lapply function
# load data 
head(beaver1)
head(beaver2)

# Create a list of data 
beaver_data <- list(beaver1 = beaver1, beaver2 = beaver2)
beaver_data

# get mean of each list item (need to embed apply() within lapply())
lapply(beaver_data, function(x) round(apply(x, 2, mean), 2))

#### sapply() for Lists: Output Simplified (s means simplify)
# sapply() will try to simplify the result of lapply() if possible. 

# (4) get the mean of each list item and simplify the output
sapply(beaver_data, function(x) round(apply(x, 2, mean), 2))

#### tapply() for Vectors
# tapply() used when we have the following circumstances:
# i) A dataset that can be broken up into groups (via category/factors)
# ii) Want to break the dataset up into groups
# iii) Within each group, we want to apply a function

# tapply() syntax: 
# tapply(x, INDEX, FUN, ..., simplify = TRUE)
# where x: a vector
# INDEX: a factor or a list of factors (or else they are coerced to factors)
# FUN: function to be applied
# ... contains other arguments to be passed FUN
# simplify or not

# (5) mean of mpg variable grouped by cyl variable 
# show first few rows of mtcars 
head(mtcars)

# mean of the mpg variable 
tapply(mtcars$mpg, mtcars$cyl, mean)

# (6) mean for every variable grouped by cyl variable 
apply(mtcars, 2, function(x) tapply(x, mtcars$cyl, mean))
#---------------------------------------------#

#### 3. Other "Loop-like" functions 
#### Simplified apply() functions
# (i) Base R provides: 
# colSums (x, na.rm = FALSE) 
# rowSums (x, na.rm = FALSE) 
# colMeans(x, na.rm = FALSE) 
# rowMeans(x, na.rm = FALSE)

# (ii) miscTools package gives (for data frames): 
# colMedians()
# rowMedians()

library(miscTools)
colMedians(mtcars)
rowMedians(mtcars)

# (iii) matrixStats package gives (for matrices): 
#  colMedians() and rowMedians()
# colSds() and rowSds()
# colVars() and rowVars()
# colRanges() and rowRanges()
# colQuantiles() and rowQuantiles()
# along with several additional summary statistic functions

library(matrixStats)
(A <- matrix(1:15, nrow=3, ncol=5))
colMedians(A)
colSds(A)
rowSds(A)
colVars(A)
rowVars(A)
colRanges(A)
rowRanges(A)
colQuantiles(A)
rowQuantiles(A)

# (1) calculate column sums 
# Method 1: colSums() is much faster
colSums(mtcars)

# Method 2
apply(mtcars, 2, sum)
#---------------------------------------------#

