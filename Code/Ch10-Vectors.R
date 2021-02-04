#-----------Chapter 10 Vectors ---------------#
#---------------------------------------------#
#### 1. Creating Vectors 
# (1) create character vector (c() concatenates elements together)
z <- c("a", "b", "c")
z

# (2) use as.vector: initialize vectors / change the vector type
(v <- as.vector(8:17))
is.character(v)

# (3) turn numerical vector to character
as.vector(v, mode = "character")
is.character(as.vector(v, mode = "character"))

# (4) numerics are turned to characters
str(c("a", "b", "c", 1, 2, 3))

# (5) logical are turned to numeric
str(c(1, 2, 3, TRUE, FALSE))

# (6) logical are turned to character
str(c("A", "B", "C", TRUE, FALSE))
#---------------------------------------------#

#### 2. Adding On To Vectors
# use c(), not change dimension
(v1 <- 8:17)
c(v1, 18:22)
#---------------------------------------------#

#### 3. Adding Attributes to Vectors
# (1) the vector has no attributes 
(v1 <- 8:17)
attributes(v1)

# (2) Add attributes to vectors (Method 1: names())
# add names to existing vectors
(v1 <- 8:17)

(names(v1) <- letters[1:length(v1)])
v1

attributes(v1)

# adding names to new vectors
(v2 <- c(name1 = 1, name2 = 2, name3 = 3))
attributes(v2)

# (3) Add attributes to vectors (Method 2: comment())
(v1 <- 8:17)

(names(v1) <- letters[1:length(v1)])
comment(v1) <- "This is a comment on a vector"
v1

attributes(v1)
#---------------------------------------------#

#### 4. Subset Vectors
#### Subsetting with Positive Integers
# (1) get 2nd value of v1
v1
v1[2]

# (2) get 2nd-4th values of v1
v1[2:4]

# (3) get specific positions of v1
v1[c(2, 4, 6, 8)]

# (4) get specific (& duplicated) positions 
v1[c(2, 2, 4)]

#### Subset with Negative Integers
# (5) omit the first value of v1
v1[-1]

# (6) omit specific positions of v1
v1[-c(2, 4, 6, 8)]

#### Subsetting with Logical Values
# (7) False: exclude those positions
v1
v1[c(TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE)]

# (8) inequality: include values less than 12
v1[v1 < 12]

# (9) inequality: include values less than 12 or greater than 15
v1[v1 < 12 | v1 > 15]

# (10) T/F: less than vector size, just recycle
v1[c(TRUE, FALSE)]

#### Subsetting with Names
# (11) choose value named "b" 
v1["b"]

# (12) choose values with specific names 
v1[c("a", "c", "h")]

#### Simplifying vs. Preserving
#  (i) Simplify subsets: returns the simplest possible data structure 
#      that can represent the output. 
# (ii) Preserving subsets keeps the structure of the output the same 
#      as the input.

# (13) [ ] preserve: gives value and value name 
v1[1]

# (14) [ [ ] ] simplify: only gives value 
v1[[1]]
#---------------------------------------------#