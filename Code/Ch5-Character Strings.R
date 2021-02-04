#---------Chapter 5 Character Strings---------#
#---------------------------------------------#

#### 1. Character String Basics
#### Creating Strings
# (1) Create string a, b
a <- "learning to create"    
b <- "character strings"

# (2) Paste together string a & b
paste(a,b)

# (3) Paste character and number strings 
paste("The life of", pi)

# (4) Paste multiple strings
paste("I", "love", "R")

# (5) paste multiple strings,  with a separating character -
paste("I", "love", "R", sep = "-")

# (6) paste without spaces
paste0("I", "love", "R")

# (7) paste objects with different lengths
paste("R", 1:5, sep = " v1.")

#### Converting to Strings
# (8) Test if strings are characters
a <- "The life of"
b <- pi
is.character(a)
is.character(b)

# (9) Convert to character 
# Example 1
c <- as.character(b)
is.character(c)

# Example 2
toString(c("Aug", 24, 1980))

#### Printing Strings
# (10) Basic printing
x <- "learning to print strings"
print(x)

# (11) # print without quotes
# Method 1
print(x, quote = FALSE)

# Method 2
noquote(x)

# (12) basic printing (similar to noquote)
cat(x)

# (13) combine character strings
cat(x, "in R")

# (14) basic printing of alphabet
cat(letters)

# (15) Printer with a separator -
cat(letters, sep = "-")

# (16) Print without space
cat(letters, sep = "")

# (17) substitute a single string/variable, use %s
x <- "print strings"
sprintf("Learning to %s in R", x)

# (18) substitute multiple strings/variables
x <- "print strings"
y <- "in R"
sprintf("Learning to %s %s", x, y)

# (19) substitute integer, use %d
version <- 3
sprintf("This is R version:%d", version)

# (20) print with leading spaces, use %4d for 4 spaces
sprintf("This is R version:%4d", version)

# (21) print and lead with zeros, use %04d
sprintf("This is R version:%04d", version)

# (22) print floating-point numbers, use %f
sprintf("%f", pi) 

# (23) decimal notation with 3 decimal digits
sprintf("%.3f", pi) 

# (24) 1 integer and 0 decimal digits
sprintf("%1.0f", pi) 

# (25) decimal with 5 decimal digits and 1 to the right of the decimal point
sprintf("%5.1f", pi) 

# (26) fill empty digits with zeros
sprintf("%05.1f", pi)

# (27) print with sign (positive)
sprintf("%+f", pi) 

# (28) # prefix a space
sprintf("% f", pi) 

# (29) exponential decimal notation 'e'
sprintf("%e", pi)

# (30) exponential decimal notation 'E'
sprintf("%E", pi)

#### Count String Elements and Characters
# (31) To count the number of elements in a string
# Example 1
length("How many elements are in this string?")

# Example 2
length(c("How", "many", "elements", "are", "in", "this", "string?"))

# (32) To count the number of characters in a string
# Example 1
nchar("How many characters are in this string?")

# Example 2
nchar(c("How", "many", "characters", "are", "in", "this", "string?"))
#---------------------------------------------#

#### 2. String Manipulation with Base R
#### Case Conversion
# (1) To convert all upper case characters to lower case 
x <- "Learning To MANIPULATE strinGS in R"
tolower(x)

# (2) To convert all lower case characters to upper case
toupper(x)

#### Simple Character Replacement
# (3) To replace a character in a string
x <- "This is A string."
chartr(old = "A", new = "a", x)

# (4) replace any 'd' with 't' and any 'z' with 'a'
y <- "Tomorrow I plzn do lezrn zbout dexduzl znzlysis."
chartr(old = "dz", new = "ta", y)

#### String Abbreviations
# (5) To abbreviate strings (default)
streets <- c("Main", "Elm", "Riverbend", "Mario", "Frederick")
abbreviate(streets)

# (6) set minimum length of abbreviation
abbreviate(streets, minlength = 2)

# (7) built-in state name and state-abbreviated name
state.name
state.abb

