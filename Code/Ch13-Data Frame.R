#----------Chapter 13 Data Frames-------------#
#---------------------------------------------#
#### 1. Creating Data Frames
# (1) Create a data frame from scratch
(df <- data.frame(col1 = 1:3,
                 col2 = c("this", "is", "text"),
                 col3 = c(TRUE, FALSE, TRUE),
                 col4 = c(2.5, 4.2, pi)))

# Col 2 is character 
str(df)

attributes(df)
nrow(df)
ncol(df)

# (2) Create a data frame from scratch (col 2 as factor, not character)
(df <- data.frame(col1 = 1:3,
                 col2 = c("this", "is", "text"),
                 col3 = c(TRUE, FALSE, TRUE),
                 col4 = c(2.5, 4.2, pi),
                 stringsAsFactors = TRUE))
str(df)

# (3) convert pre-existing vectors to data frame
v1 <- 1:3
v2 <-c("this", "is", "text")
v3 <- c(TRUE, FALSE, TRUE)

data.frame(col1 = v1, col2 = v2, col3 = v3)

# (4) convert a list to data frame, use as.data.frame()
(l <- list(item1 = 1:3,
          item2 = c("this", "is", "text"),
          item3 = c(2.5, 4.2, 5.1)))

as.data.frame(l)

# (5) convert a matrix to data frame, use as.data.frame()
(m1 <- matrix(1:12, nrow = 4, ncol = 3))

as.data.frame(m1)
#---------------------------------------------#

#### 2. Adding On To Data Frames
# (1) add a new column
df
v4 <- c("A", "B", "C")

# add v4 to the 1st column
cbind(v4, df)

# add v4 to the last column 
cbind(df, v4)

# (2) add a new row 
df
str(df)

# If rbind() this way, all converted to characters 
(df2 <- rbind(df, c(4, "R", F, 1.1)))
str(df2)

# use stringsAsFactors = FALSE to stop converting to characters 
(adding_df <- data.frame(col1 = 4,
                        col2 = "R",
                        col3 = FALSE,
                        col4 = 1.1,
                        stringsAsFactors = FALSE))
(df3 <- rbind(df, adding_df))
str(df3)

#---------------------------------------------#

#### 3. Adding Attributes to Data Frames
# (1) Add Attributes (Method 1: add names) 
df
dim(df)
attributes(df)

#   (i) add row names
rownames(df) <- c("row1", "row2", "row3")
df

attributes(df)

#   (ii) add/change column names 
# Method 1: use colnames()
colnames(df) <- c("col_1", "col_2", "col_3", "col_4")
df

attributes(df)

# Method 2: use names()
names(df) <- c("col.1", "col.2", "col.3", "col.4")
df

attributes(df)

# (2) Add Attributes (Method 2: add comments)
comment(df) <- "adding a comment to a data frame"
attributes(df)
#---------------------------------------------#

#### 4. Subset Data Frames
# (1) subsetting by row 
# Method 1: by row numbers
df
df[2:3,]

# Method 2: by row names
df[c("row2","row3"), ]

# (2) subsetting columns like a list
df[c("col.2", "col.4")]

# (3) subsetting columns like a matrix
df[ , c("col.2", "col.4")]

# (4) subset for both rows and columns
df[1:2, c(1, 3)]

# (5) subset with a vector
v <- c(1, 2, 4)
df[ , v]

# (6) simplify vs preserve 
# simplifying results in a named vector
df[, 2]

# preserving results in a data frame
df[, 2, drop=FALSE]
#---------------------------------------------#
