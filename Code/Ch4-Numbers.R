#------------- Chapter 4: Numbers ------------#
#---------------------------------------------#
#### 1. Integer Values, Double Precision Values 
# (1) Create a string of double-precision values 
dbl_var <- c(1,2.5,4.5)
dbl_var

# (2) Create a string of integer values 
int_var <- c(1L, 6L, 10L)
int_var

# (3) Convert Integer to Double-Precision
# Method 1
as.double(int_var)

# Method 2
as.numeric(int_var)

# (4) Convert Double-Precision to Integer
as.integer(dbl_var)
#---------------------------------------------#

#### 2. Create a sequence of non-random numbers 
# (1) Specify numbers within a sequence 
1:10

c(1,5,10)

(x <- 1:10)

# (2) Generate regular sequences
# Sequence: numbers 1:21 by increments of 2 
seq(1, 21, by=2)

# Sequence: numbers 0:21 that has 15 equal incremented numbers 
seq(0, 21, length.out = 15)

# Replicate: numbers 1:4 for 2 times (non-collated)
rep(1:4, times=2)

# Replicate: numbers 1:4 for 2 times (collated)
rep(1:4, each=2)
#---------------------------------------------#

#### 3. Create a sequence of random numbers 
#### Uniform Numbers 
# (1) Create 10 random numbers between 0~25
runif(10, min=0, max=25)

# (2) Create 10 random numbers between 0~25, with replacement 
sample(0:25, 10, replace=TRUE)

# (3) Create 10 random numbers between 0~25, without replacement 
sample(0:25, 10, replace=FALSE)

#### Normal Distribution 
# (4) Create 10 random numbers from a normal distribution
rnorm(10, mean=0, sd=1)

# (5) Create CDF probabilities in vector p
p <- c(2,4,2,7,7,3)
pnorm(p, mean=0, sd=1)

# (5) Create quantile probabilities in vector q
q <- c(0.2,0.4,0.5,0.7,0.9,0.10)
qnorm(q, mean=0, sd=1)

# (6) Create PDF probabilites in vector x
x <- c(2,4,6,7,3,4)
round(dnorm(x, mean=0, sd=1),2)

#### Binomial Distribution
# (7) Create a vector of length 10 from trial size=100
rbinom(10, size = 100, prob = 0.5)

# (8) Create CDF probabilities for values in vector p
p <- c(50,40,20,70,70,30)
round(pbinom(p, size = 100, prob = 0.5),2)

# (9) Create quantile for probabilities in vector q 
q <- c(0.2,0.4,0.5,0.7,0.9,0.10)
qbinom(q, size = 100, prob = 0.5)

# (10) Create PDF probabilites for values in vector x 
x <- c(20,40,60,70,3,40)
round(dbinom(x, size = 100, prob = 0.5),2)

#### Poission Distribution
# (11) Create a vector of length 10
rpois(10, lambda = 4)

# (12) CDF probabilities for values in vector p
p <- c(50,40,20,70,70,30)
ppois(p, 10, lambda = 4)

# (12) Quantile probabilities for values in vector q
q <- c(0.2,0.4,0.5,0.7,0.9,0.10)
qpois(q, 10, lambda = 4)

# (13) PDF probabilities for values in vector x
x <- c(20,40,60,70,3,40)
round(dpois(x, 10, lambda = 4),2)

#### Exponential Distribution
# (14) Create a vector of length 10 with rate = 1
rexp(10, rate = 1)

# (15) Create CDF probabilities for values in vector p
p <- c(5,4,2,7,7,3)
pexp(p, rate = 1)

# (16) Create quantile for probabilities in vector q
q <- c(0.2,0.4,0.5,0.7,0.9,0.10)
qexp(q, rate = 1)

# (17) Create PDF probabilites for values in vector x 
x <- c(20,40,60,70,3,40)
round(dexp(x, rate = 1),2)

#### Gamma Distribution
# (18) Create a vector of length 10
rgamma(10, shape = 1)

# (19) Create CDF probabilities for values in vector p
p <- c(5,4,2,7,7,3)
pgamma(p, shape = 1)

# (20) Create quantile for probabilities in vector q
q <- c(0.2,0.4,0.5,0.7,0.9,0.10)
qgamma(q, shape = 1)

# (21) Create PDF probabilites for values in vector x
# when shape parameter = 1.
x <- c(20,40,60,70,3,40)
dgamma(x, shape = 1)
#---------------------------------------------#

#### 4. Compare Numeric values 
#### Comparison Operators
# (1) Compare if vector x=y
# Example 1
x <- 9 
y <- 10
x == y

# Example 2
x <- c(1, 4, 9, 12)
y <- c(4, 4, 9, 13)
x == y

# (2) Find number of equal values in two vectors 
sum(x == y)

# (3) Find location of equal values in two vectors
which(x == y)

#### Exact Equality
# (4) To test if two objects are exactly equal
# Example 1
x <- c(4, 4, 9, 12)
y <- c(4, 4, 9, 13)
identical(x, y)

# Example 2
x <- c(4, 4, 9, 12)
y <- c(4, 4, 9, 12)
identical(x, y)

#### Floating Point Comparison
# (5) to test for ‘near equality’, with a difference tolerance of 1.5e−8
# Example 1
x <- c(4.00000005, 4.00000008)
y <- c(4.00000002, 4.00000006)
all.equal(x, y)

# Example 2: If the difference is greater than the tolerance
x <- c(4.005, 4.0008)
y <- c(4.002, 4.0006)
all.equal(x, y)

#---------------------------------------------#

#### 5. Rounding Numbers 
# (1) Round to the nearest integer
x <- c(1, 1.35, 1.7, 2.05, 2.4, 2.75) 
round(x)

# (2) Round up
ceiling(x)

# (3) Round down
floor(x)

# Round to a specified decimal 
round(x, digits = 1)
#---------------------------------------------#


