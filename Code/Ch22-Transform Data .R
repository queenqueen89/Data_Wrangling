#--------Chapter 22 Transform Your Data-------#
#---------------------------------------------#
#### 1. Selecting Variables of Interest
# (1) select columns "Division, State, X2002, X200" 
setwd("/Users/nicoleyin88/Documents/* Data Wrangling/")
(expenditures <- read.csv("expenditures.csv"))

(sub_exp <- expenditures %>% select(Division, State, X2002:X2003))

# (2) select columns that start with X
expenditures %>% select(starts_with("X"))

# (3) deselect variables use "-"
expenditures %>% select(-X2002:-X2003)
expenditures %>% select(-starts_with("X"))

# (4) select and rename a single column
expenditures %>% select(Yr_1980 = X1980)

# (5) Select and rename the multiple variables with an "X" prefix: 
expenditures %>% select(Yr_ = starts_with("X"))

# (6) keep all variables and rename a single variable
expenditures %>% rename("2003" = X2003)
#---------------------------------------------#

#### 2. Filtering Rows
# (1) filter() Division=8
expenditures %>% filter(Division == 8)

# (2) filter() 
expenditures %>% filter(X2001 > 1000000)

# (3) remove duplicate rows
expenditures %>% distinct()

# (4) random sample, 50% sample size without replacement
expenditures %>% sample_frac(size = 0.5, replace = FALSE)

# (5) random sample of 1 row with replacement
expenditures %>% sample_n(size = 1, replace = TRUE)

# (6) select rows 1,3
expenditures %>% slice(1,3)

# (7) select top n entries 
expenditures %>% top_n(n = 2, wt = X2000)
#---------------------------------------------#

#### 3. Group Data by Categorical Variables
# (1) Group by division
(exp_group <- expenditures %>% group_by(Division))

# (2)
#---------------------------------------------#

#### 4. Perform Summary Statistics on Variables
# (1)

# (2)
#---------------------------------------------#

#### 5. Arrange Variables by Value
# (1)

# (2)
#---------------------------------------------#

#### 6. Join Data Sets
# (1)

# (2)
#---------------------------------------------#

#### 7. Create New Variables
# (1)

# (2)
#---------------------------------------------#

