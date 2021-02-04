#-----------Chapter 18 Functions -------------#
#---------------------------------------------#
#### 1. Function Components
# Function has 3 parts: 
# (i) body(): the code inside the function
# (ii) formals(): the list of arguments used to call the function
# (iii) environment(): the mapping of the location(s) of the function’s variables

# (1) PV Function: PV = FV / (1+r)^n
PV <- function(FV, r, n) {
  PV <- FV / (1 + r)^n
  round(PV, 2)
}

# (2) Use PV Function
PV(FV=2, r=0.2, n=10)

# PV function explained: 
## body(PV) 
## {
##     PV <- FV / (1 + r)^n
##     round(PV, 2)
## }

## formals(PV) 
## $FV
##
## $r
##
## $n

## environment(PV)
## <environment: R_GlobalEnv>
#---------------------------------------------#

#### 2. Arguments
# (1) To use PV function
# Method 1: with argument names 
PV(FV = 1000, r = .08, n = 5)

# Method 2: without argument names (position matching)
PV(1000, .08, 5)

# Method 3: using names, you can change the order
PV(r = .08, FV = 1000, n = 5)

# (2) Create PV2 Function, with default values
PV2 <- function(FV = 1000, r = .08, n = 5) {
  PV2 <- FV / (1 + r)^n
  round(PV2, 2)
}

# (3) Use PV2 Function, without specify values
PV2()
PV2(1000, .08)

# (4) Use PV2 function, specify different values 
PV(1000, .08, 3)
#---------------------------------------------#

#### 3. Scoping Rules
# Scoping: set of rules a programming language 
#          uses to lookup the value for variables and/or symbols. 

# (1) 
PV1 <- function() {
  FV <- 1000
  r <- .08
  n <- 5
  FV / (1 + r)^n
}

PV1()

# (2) if a variable does not exist within the function, 
# R will look one level up to see if the variable exists
FV <- 1000
PV3 <- function() {
  r <- .08
  n <- 5
  FV / (1 + r)^n }
PV3()

# (3) if you have functions embedded within functions, 
# R will look one level up to see if the variable exists
FV <- 1000

PV4 <- function() {
  r <- .08
  n <- 5
  denominator <- function() {
         (1 + r)^n
  }
  FV/denominator()
}

PV4()

# (4) some arguments are called but not all variables used in the body 
# are identified as arguments

# Example 1
# n is specified within the function
PV5 <- function(FV, r) {
  n <- 5
  FV / (1 + r)^n }
PV5(1000, .08)

# Example 2
# n is specified within the function and 
# r is specified outside the function
r <- 0.08
PV5 <- function(FV) {
  n <- 5
  FV / (1 + r)^n }

PV5(1000)
#---------------------------------------------#

#### 4. Lazy Evaluation
# R functions perform “lazy” evaluation in which arguments are only evaluated 
# if required in the body of the function.

# (1) include only arguments needed in function body
lazy <- function(x){
 x*2
}

lazy(4)
#---------------------------------------------#

#### 5. Return Multiple Outputs from a Function
# use c() inside the function to perform multiple tasks, display all results.

# (1) bad function: if not use c(), only gives last result
bad <- function(x, y) {
  2*x+ y
  x+2* y
  2*x+2* y
  x/y
} 

bad(1, 2)

# (2) good function: use c(), give all results
good <- function(x, y) {
  output1 <- 2*x+ y
  output2 <- x+2* y
  output3 <- 2*x+2* y
  output4 <-x/y
  c(output1, output2, output3, output4)
} 

good(1,2)

# (3) best function: use c(list()), save in a list
best <- function(x, y) {
  output1 <- 2*x+ y
  output2 <- x+2* y
  output3 <- 2*x+2* y
  output4 <-x/y
  c(list(output1, output2, output3, output4))
} 

best(1,2)
#---------------------------------------------#

#### 6. Deal with Invalid Parameters
# (1) use stop() to check the validity of arguments within the function
PV_stop <- function(FV, r, n) {
  if(!is.numeric(FV) | !is.numeric(r) | !is.numeric(n)) {
    stop('This function only works for numeric inputs!\n',
         'You have provided objects of the following classes:\n',
         'FV: ', class(FV), '\n',
         'r: ', class(r), '\n', 
         'n: ', class(n))
  }
    PV <- FV / (1 + r)^n
    round(PV, 2) 
}

PV_stop("1000", 0.08, "5")

# (2) use na.rm = TRUE to ignore NAs
fv <- c(800, 900, NA, 1100, NA)

# PV() function: return NAs as NAs
PV(fv, .08, 5)

# Create PV_NA function, ignore NAs
PV <- function(FV, r, n, na.rm = FALSE) {
  if(!is.numeric(FV) | !is.numeric(r) | !is.numeric(n)) { 
    stop('This function only works for numeric inputs!\n',
         'You have provided objects of the following classes:\n', 
         'FV: ', class(FV), '\n', 
         'r: ', class(r), '\n',
         'n: ', class(n))
  }
  if(na.rm == TRUE) {
    FV <- FV[!is.na(FV)]
  }
  PV <- FV / (1 + r)^n
  round(PV, 2) 
}

PV(fv, 0.08, 5, na.rm = TRUE)
#---------------------------------------------#

#### 7. Saving and Sourcing Functions
# (1) Save PV function in current directory 

# (2) Call PV function 
source("PV2.R")

PV2(FV=2000, r=0.05, n=10)
#---------------------------------------------#
