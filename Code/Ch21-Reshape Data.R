#--------------Chapter 21 Reshape data--------#
#---------------------------------------------#
#### 1. Making Wide Data long
# wide data: common attribute/variable of concern is spread out across columns
# make wide data long: gather these variables together as a single variable

# (1) gather() data
library(tidyr)

# read wide data: Qtr
setwd("/Users/nicoleyin88/Documents/* Data Wrangling/")
wide <- tbl_df(read.csv("card.csv"))
head(wide)

# make it long
long <- wide %>% gather(Quarter, Revenue, Q1:Q4)
head(long)
#---------------------------------------------#

#### 2. Making Long Data wide
# (2) spread() data
back2wide <- long %>% spread(Quarter, Revenue)
head(back2wide)
#---------------------------------------------#

#### 3. Split a Single Column into Multiple Columns
# (1) separate() columns 
messy_df <- read.csv("messy.csv")

# Separate Grp_Id column 
messy_df %>% separate(col = Grp_Id, into = c("Grp", "Id"))

# Separate Yr_Mo column, by seperator - 
messy_df %>% separate(col = Yr_Mo, into = c("Yr", "Mo"), sep="_")

# Separate Grp_Id column, keep Grp_Id column
messy_df %>% separate(col = Grp_Id, into = c("Grp", "Id"), remove=F)

# (2) Separate both Grp_Id, Yr_Mo columns 
messy_df %>% separate(col = Grp_Id, into = c("Grp", "Id")) %>%
  separate(col = Yr_Mo, into = c("Yr", "Mo"), sep="_")
#---------------------------------------------#

#### 4. Combine Multiple Columns into a Single Column
# (1) unite() columns
# Create data directly in R
expenses <- tbl_df(read.table(header = TRUE, text = "
        Year   Month   Day   Expense
        2015      01    01       500
        2015      02    05        90
        2015      02    22       250
        2015      03    10       325
"))

# unite columns for "Year, Month, Day" (default separate is "_") 
expenses %>% unite(col = "Date", c(Year, Month, Day))

# change "-" as separator
expenses %>% unite(col = "Date", c(Year, Month, Day), sep="-")
#---------------------------------------------#

#### 5. Additional tidyr Functions
# Create data directly in R 
expenses <- tbl_df(read.table(header=TRUE, text="
        Dept    Year    Month     Day   Cost
        A       2015    01        01    $500
        NA      NA      02        05    $90
        NA      NA      03        22    $1,250
", stringsAsFactors = FALSE))

# (1) fill(): file NA with previous entry
expenses %>% fill(Dept, Year)

# (2) extract_numeric(): get numeric values of a column 
library(magrittr)

# "Cost" is a single variable, use %$% sign
expenses %$% extract_numeric(Cost)

# (3) replace_na(): replace missing value 
expenses %>% replace_na(replace = list(Day = "unknown"))

# (4) replace missing Day and Year 
expenses %>% replace_na(replace = list(Year = 2015, Day = "unknown"))
#---------------------------------------------#

#### 6. Sequencing Your tidyr Operations
# Create a data in R
a_mess <- tbl_df(read.table(header = TRUE, text = "
   Dep_Unt   Year     Q1     Q2     Q3     Q4
    A.1      2006     15     NA     19     17
    B.1        NA     12     13     27     23
    A.2        NA     22     22     24     20
    B.2        NA     12     13     25     18
    A.1      2007     16     14     21     19
    B.2        NA     13     11     16     15
    A.2        NA     23     20     26     20
    B.2        NA     11     12     22     16
"))


# A sequence of command use pipe %>%
a_mess %>% fill(Year) %>%
  gather(Quarter, Cost, Q1:Q4) %>%
  separate(Dep_Unt, into = c("Dep", "Unt")) %>% 
  replace_na(replace=list(Cost=17))
#---------------------------------------------#



