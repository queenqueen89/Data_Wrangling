#---------------Chatper 12 Matrices-----------#
#---------------------------------------------#
#### 1. Creating Matrices
# (1) create numeric matrix
(m1 <- matrix(1:6, nrow = 2, ncol = 3))
str(m1)
attributes(m1)

# (2) create character matrix
(m2 <- matrix(letters[1:6], nrow = 2, ncol = 3))
str(m2)
attributes(m2)

# (3) column/row bind a matrix 
v1 <- 1:4
v2 <- 5:8
v3 <- 9:12
cbind(v1, v2, v3)
rbind(v1, v2, v3)
#---------------------------------------------#

#### 2. Adding On To Matrices
# (1) add a new column
(m1 <- cbind(v1, v2))
(v3 <- 9:12)
cbind(m1, v3)

# (2) add a new row 
rbind(m1, c(4.1, 8.1))
#---------------------------------------------#

#### 3. Adding Attributes to Matrices
# Create matrix m2
(m2 <- matrix(1:12, nrow = 4, ncol = 3))
attributes(m2)

# (1) Method 1: add row/column names
#   (i) add row names 
# Method 1: use rownames() 
rownames(m2) <- c("row1", "row2", "row3", "row4")
m2

attributes(m2)

# Method 2: use dimnames() 
# In attribute, row is [[1]] first list item
dimnames(m2)[[1]] <- c("row_1", "row_2", "row_3", "row_4")
m2

#   (ii) add column names (colnames())
colnames(m2) <- c("col1", "col2", "col3")
m2

attributes(m2)

# Method 2: use dimnames() 
# in attribute, row is [[2]] second list item)
dimnames(m2)[[2]] <- c("col_1", "col_2", "col_3")
m2

# (2) Method 2: add comments
comment(m2) <- "adding a comment to a matrix"
attributes(m2)
#---------------------------------------------#

#### 4. Subset Matrices
# (1) subset for rows 1 and 2 but keep all columns
m2
m2[1:2, ]

# (2) subset for columns 1 and 3 but keep all rows
m2[ , c(1, 3)]

# (3) subset for 1-2 rows, and 1st, 3rd columns 
m2[1:2, c(1, 3)]

# (4) use a vector to subset
v <- c(1, 2, 4)
m2[v, c(1, 3)]

# (5) use names to subset
m2[c("row_1", "row_3"), ]

# (6) take 2nd column 
# not preserve matrix form
m2[, 2]

# preserve matrix form
m2[, 2, drop = FALSE]
#---------------------------------------------#

