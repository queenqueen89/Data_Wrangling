#----------Chapter 14 Missing Values----------#
#---------------------------------------------#
#### 1. Test for Missing Values
# (1) test a vector with NA
(x <- c(1:4, NA, 6:7, NA))

is.na(x)

# (2) test a matrix with NA
df <- data.frame(col1 = c(1:3, NA),
                 col2 = c("this", NA,"is", "text"),
                 col3 = c(TRUE, FALSE, TRUE, TRUE),
                 col4 = c(2.5, 4.2, 3.2, NA),
                 stringsAsFactors = FALSE)

is.na(df)

# (3) identify NAs in specific data frame column is.na(df$col4)
is.na(df$col4)

# (4) identify location of NAs
which(is.na(x))

# (5) identify numebr of NAs
sum(is.na(df))
#---------------------------------------------#

#### 2. Recode Missing Values
# (1) vector: recode missing values with the mean
x[is.na(x)] <- mean(x, na.rm = TRUE)
round(x, 2)

is.na(x)

# (2) data frame: missing values=99
(df <- data.frame(col1 = c(1:3, 99), col2 = c(2.5, 4.2, 99, 3.2)))

# (3) data frame: recode missing values=99 to NAs
df[df == 99] <- NA
df
#---------------------------------------------#

#### 3. Excluding Missing Values
# (1) A vector with missing values
(x <- c(1:4, NA, 6:7, NA))

# (2) cannot calculate mean with NA values
mean(x)

# (3) find mean with NA values 
mean(x, na.rm = TRUE)

# (4) data frame with missing values
(df <- data.frame(col1 = c(1:3, NA),
                 col2 = c("this", NA,"is", "text"),
                 col3 = c(TRUE, FALSE, TRUE, TRUE),
                 col4 = c(2.5, 4.2, 3.2, NA),
                 stringsAsFactors = FALSE))

# (5) data frame: find complete cases (if no NA, it's TRUE) 
complete.cases(df)

# (6) subset to get complete cases (without any NA)
# Method 1 
na.omit(df)

# Method 2
df[complete.cases(df), ]

# (7) subset to get incomplete cases (with only NA)
df[!complete.cases(df), ]


#---------------------------------------------#

