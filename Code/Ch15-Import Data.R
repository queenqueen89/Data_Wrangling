#----------Chapter 15 Importing Data----------#
#---------------------------------------------#
#### 1. Reading Data from Text Files
#### Base R Functions
# (1) Read csv data (read.csv() default: sep = "," header = TRUE)
setwd("/Users/nicoleyin88/Documents/5. Data Wrangling/")
mydata <- read.csv("mydata.csv")

str(mydata)

# (2) Read characters as factors
(mydata_2 <- read.csv("mydata.csv", stringsAsFactors = TRUE))

str(mydata_2)

# (3) Read csv data (read.table() default: sep = "" header = FALSE)
read.table("mydata.csv", sep=",", header = TRUE, stringsAsFactors = TRUE)

# (4) set column and row names
read.table("mydata.csv", sep=",", header = TRUE, stringsAsFactors = FALSE,
           col.names = c("Var 1", "Var 2", "Var 3"),
           row.names = c("Row 1", "Row 2", "Row 3"))

# (5) manually set classes of the columns
set_classes <- read.table("mydata.csv", sep=",", header = TRUE,
                          colClasses = c("numeric", "character", "character"))
str(set_classes)

#  (6) read only first two rows 
read.table("mydata.csv", sep=",", header = TRUE, nrows = 2)

# (7) read txt file
# Method 2
read.table("mydata.txt", sep="\t", header = TRUE)

# Method 2
read.delim("mydata.txt")

#### readr Package (read faster, more flexible reading options)
library(readr)

# (8) use read_csv 
(mydata_3 <- read_csv("mydata.csv"))

str(mydata_3)

# (9) specify column class, use col_types
read_csv("mydata.csv", col_types = list(col_double(),
                                        col_character(),
                                        col_character()))

# (10) specify column classes with a string
# d = double, _ skips column, c = character
read_csv("mydata.csv", col_types = "d_c")

# (11) change variable names by skipping the first row
read_csv("mydata.csv", 
         col_names = c("Var 1", "Var 2", "Var 3"), 
         skip = 1)

# (12) set maximum number of lines to read in
read_csv("mydata.csv", n_max = 2)
#---------------------------------------------#

#### 2. Reading Data from Excel Files
#### readxl Package
library("readxl")

# (1) read xlsx file 
(mydata <- read_excel("mydata.xlsx", sheet = "Sheet2"))

str(mydata)

# (2) change variable names by skipping the first row
read_excel("mydata.xlsx", sheet = "Sheet2", 
           skip = 1, col_names = paste("Var", 1:5))

# (3) set 999 to NA
read_excel("mydata.xlsx", sheet = "Sheet3", na = "999")
#---------------------------------------------#

#### 3. Load Data from Saved R Object File
load("mydata.RData")

load(file = "mydata.rda")

name <- readRDS("mydata.rds")
#---------------------------------------------#
