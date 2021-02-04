#------------Chapter 9 Data Structures--------#
#### Two components of data structures: 
#    (i) structure 
#     structure prodives a compact display of internal structure of an R object
#    (ii) attributes
#     attributes may include: 
#     names, dimnames / dimensions (e.g. matrices, arrays) / 
#     class (e.g. integer, numeric) / length / 
#     other user-defined attributes/metadata / 
#---------------------------------------------#

#### 1. Identify the Structure 
# (1) Use str() to identify data structures 
# Vector 
vector <- 1:10
str(vector)

# list
# Example 1
(list <- list(item1 = 1:10, item2 = LETTERS[1:18]))
str(list)

# Example 2
(grocery <- list(produce=c("apple", "banana"), meat=c("chicken","beef")))
str(grocery)

# matrix 
(matrix <- matrix(1:12, nrow = 4))
str(matrix)

# data frame: 18 observations, 2 variables 
# Example 1
(df <- data.frame(item1 = 1:18, item2 = LETTERS[1:18]))
str(df)

# Example 2
(data <- data.frame(name=c("John", "Josh"), age=c(10,11)))
str(data)
#---------------------------------------------#

#### 2. Attributes
# (1) assess attributes of data frame
(df <- data.frame(item1 = 1:18, item2 = LETTERS[1:18]))
attributes(df)

# (2) assess attributes of matrix
(matrix <- matrix(1:12, nrow = 4))
attributes(matrix)

# (3) assess names of data frame
(df <- data.frame(item1 = 1:18, item2 = LETTERS[1:18]))
names(df)

# (4) access the length (measure number of items in columns)
vector <- 1:10
length(x)

(list <- list(item1 = 1:10, item2 = LETTERS[1:18]))
length(list)

(df <- data.frame(item1 = 1:18, item2 = LETTERS[1:18]))
length(df)
#---------------------------------------------#