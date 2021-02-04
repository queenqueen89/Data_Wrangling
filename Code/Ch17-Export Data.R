#---------Chapter 17 Exporting Data-----------#
#---------------------------------------------#
#### 1. Writing Data to Text Files
#### Base R Functions
# (1) Create data frame
(df <- data.frame(var1 = c(10, 25, 8),
                 var2 = c("beer", "wine", "cheese"),
                 var3 = c(TRUE, TRUE, FALSE),
                 row.names = c("billy", "bob", "thornton")))

# (2) write to a csv file, save in current directory 
write.csv(df, file = "export.csv")

# (3) write to a csv, save in a different directory
write.csv(df, file = "/Users/nicoleyin88/Desktop/export.csv")

# (4) write to a csv file with added arguments
write.csv(df, file = "export2.csv", row.names = FALSE, na = "MISSING!")

read_csv("export2.csv")

# (5) write to text files 
# Method 1
library(pgirmess)
write.delim(df, file = "export.txt")

# Method 2 
write.table(df, file = "export2.txt", sep="\t")

#### readr Package
# (6) write to a csv file in current directory
library(readr)
write_csv(df, path = "export3.csv")

# (7) write to a csv and save in a different directory
write_csv(df, path = "/Users/nicoleyin88/Desktop/export3.csv")

# (8) write to a csv file without column names 
write_csv(df, path = "export4.csv", col_names = FALSE)

# (9) write to a txt file without column names 
write_delim(df, path = "export4.txt", col_names = FALSE)
#---------------------------------------------#

#### 2. Saving Data as an R Object File
# (1) save data as RData file
(x <- stats::runif(20))
(y <- list(a = 1, b = TRUE, c = "oops"))
save(x, y, file = "xy.RData")

# (2) save a single object to file 
saveRDS(x, "x.rds")

# (3) restore it under a different name
x2 <- readRDS("x.rds")

# check if x, x2 are identical
identical(x, x2)
#---------------------------------------------#

