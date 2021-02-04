#---------------Chapter 11 Lists -------------#
# 4 different classes of lists:
# (i) integer (ii) character (iii) logical (iv) numeric
#---------------------------------------------#
#### 1. Creating Lists
# (1) Create a list 
(l <- list(1:3, "a", c(TRUE, FALSE, TRUE), c(2.5, 4.2)))
str(l)
length(l)

# (2) Create a list containing a list
(l <- list(1:3, list(letters[1:5], c(TRUE, FALSE, TRUE))))
str(l)
length(l)
#---------------------------------------------#

#### 2. Adding On To Lists
# (1) nest list l1 in list l2
(l1 <- list(1:3, "a", c(TRUE, FALSE, TRUE)))
str(l1)

(l2 <- list(l1, c(2.5, 4.2)))
str(l2)

# (2) append list l1 to list l3 (no nesting)
# Method 1: use append()
(l3 <- append(l1, list(c(2.5, 4.2))))
str(l3)

# Method 2: use $ 
l3$item4 <- "new list item"
str(l3)

# (3) To add additional values to a list: specify the first item 
# Example 1
l1[[1]] <- c(l1[[1]], 4:6)
l1
str(l1)

# Example 2
l1[[2]] <- c(l1[[2]], c("dding", "to a", "list"))
l1
str(l1)
#---------------------------------------------#

#### 3. Adding Attributes to Lists
# (1) Add attributes (method 1: names())
# adding names to an existing list
names(l1) <- c("item1", "item2", "item3")
str(l1)
attributes(l1)

# adding names to a new list
l2 <- list(item1 = 1:3, 
           item2 = letters[1:5], 
           item3 = c(T, F, T, T)) 
str(l2)
attributes(l2)

# (2) Add attributes (method 2: comment())
# adding a comment, general
comment(l2) <- "This is a comment on a list"
str(l2)
attributes(l2)

# adding a comment to a specific list item: use attr() 
attr(l2, "item2") <- "Comment for item2"
str(l2)
attributes(l2)
#---------------------------------------------#

#### 4. Subset Lists
#### Subset List and Preserve Output as a List
# (1) extract first list item (sublist)
# Method 1
l2
l2[1]

# Method 2
l2["item1"]

# (2) extract multiple list items
# Method 1
l2[c(1,3)]

# Method 2
l2[c("item1", "item3")]

#### Subset List and Simplify Output
# (3) extract first list item and simplify to a vector 
# Method 1
l2[[1]]

# Method 2
l2[["item1"]]

### Subset List to Get Elements Out of a List
# (4) # extract: item 2, 3rd element
# Method 1
l2[[2]]
l2[[2]][3]

# Method 2
l2[["item2"]][3]

# Method 3
l2$item2[3]

#### Subset List with a Nested List
# (5) extract nested subsublist item2a from sublist item2
l3 <- list(item1 = 1:3,
           item2 = list(item2a = letters[1:5],
                        item3b = c(T, F, T, T)))
str(l3)

# Method 1
# preserve the output as a list
l3[[2]][1]     # preserve

l3[[2]][[1]]   # simplify

# Method 2
l3[["item2"]][["item2a"]]

# Method 3 
l3$item2$item2a

# (6) extract individual element from a nested list item
l3
l3[[2]][[1]][3]
#---------------------------------------------#

