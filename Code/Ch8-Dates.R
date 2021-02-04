#--------------Chapter 8 Dates----------------#
#---------------------------------------------#
#### 1. Get Current Date and Time
# (1) To get current date and time information
# Current Timezone
Sys.timezone()

# Current Date
Sys.Date()

# Current date, time, timezone
Sys.time()
#---------------------------------------------#

#### 2. Convert Strings to Dates
#### Convert Strings to Dates (if default date format is YYYY-MM-DD)
# (1) To convert a string into a date
# Method 1
x <- c("2015-07-01", "2015-08-01", "2015-09-01")
as.Date(x)

# Method 2
library(lubridate)
ymd(x)

# (2) To convert a string to date (if not default date format)
# Method 1
y <- c("07/01/2015", "07/01/2015", "07/01/2015")
as.Date(y, format = "%m/%d/%Y")

# Method 2
library(lubridate)
mdy(y)

#### Create Dates by Merging Data
# (3) Merge year, month, day data
yr <- c("2012", "2013", "2014", "2015")
mo <- c("1", "5", "7", "2")
day <- c("02", "22", "15", "28")

ISOdate(year = yr, month = mo, day = day)

# (4) truncate the unused time data (remove time, timezone)
as.Date(ISOdate(year = yr, month = mo, day = day))
#---------------------------------------------#

#### 3. Extract and Manipulate Parts of Dates 
# (1) Extract year
library(lubridate)
x <- c("2015-07-01", "2015-08-01", "2015-09-01")
year(x)

# (2) Extract month (default: number)
month(x)

# (3) Extract month (in abbreviation) 
month(x, label = TRUE)

# (4) Extract month (full name) 
month(x, label = TRUE, abbr = FALSE)

# (5) extract day of the week  
wday(x, label = TRUE, abbr = FALSE)

# (6) convert to date format
x <- c("2015-07-01", "2015-08-01", "2015-09-01")
(x <- ymd(x))

# (7) change the days for the dates
# Convert to day of the month
mday(x)

# change the days for the dates
mday(x) <- c(3, 10, 22)
x 

# (8) change the years and to 9th month
update(x, year = c(2013, 2014, 2015), month = 9)

# (9) add/subtract units
x + years(1) - days(c(2, 9, 21))

#---------------------------------------------#

#### 4. Create Date Sequences
# (1) To create a sequence of dates, by years
# Method 1
seq(as.Date("2010-1-1"), as.Date("2015-1-1"), by = "years")

# Method 2
library(lubridate)
seq(ymd("2010-1-1"), ymd("2015-1-1"), by = "years")

# (2) To create a sequence of dates, by quarter
# Method 1
seq(as.Date("2015/1/1"), as.Date("2015/12/30"), by = "quarter")

# Method 2
library(lubridate)
seq(ymd("2015/1/1"), ymd("2015/12/30"), by = "quarter")

# (3) To create a sequence of dates, by 2 days
# Method 1
seq(as.Date('2015-09-15'), as.Date('2015-09-30'), by = "2 days")

# Method 2
library(lubridate)
seq(ymd('2015-09-15'), ymd('2015-09-30'), by = "2 days")

# (4) Create sequences with time
# Method 1
seq(as.POSIXct("2015-1-1 0:00"), as.POSIXct("2015-1-1 12:00"), by = "hour")

# Method 2
library(lubridate)
seq(ymd_hm("2015-1-1 0:00"), ymd_hm("2015-1-1 12:00"), by = "hour")

#---------------------------------------------#

#### 5. Calculations with Dates
# (1) Compare dates 
(x <- Sys.Date())
(y <- as.Date("2015-09-11"))
x > y
x - y

# (2) find time difference
x <- as.Date("2012-03-1")
y <- as.Date("2012-02-28")
x - y

# (3) Time difference, with timezone 
x <- as.POSIXct("2015-09-22 01:00:00", tz = "US/Eastern") 
y <- as.POSIXct("2015-09-22 01:00:00", tz = "US/Pacific")
y == x
y - x
#---------------------------------------------#



