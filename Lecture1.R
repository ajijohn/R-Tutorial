# BIOST 562: Computational Skills for Biostatistics II
# Winter quarter 2018
# Instructor: Mauricio Sadinle (msadinle@uw.edu)


# Lecture 1
# Miscelaneous topics on
#  - Data structures (http://adv-r.had.co.nz/Data-structures.html)
#  - Subsetting (http://adv-r.had.co.nz/Subsetting.html)


# Start a new R session or run the line
rm(list=ls())

### Data Structures

## Arrays

# Atomic vectors with attribute 'dim'
( a <- seq_len(2*3*4) )

dim(a) <- c(2,3,4)

a

class(a)
str(a)

# A matrix is a particular case
dim(a) <- c(6,4)

a

class(a)

# You can also define an array using 'array'
a <- array(seq_len(2*3*4), c(2,3,4))

a

# loaf of bread analogy
# Operations on arrays
# Apply function over dimensions in MARGIN
apply(a, MARGIN=c(1,3), FUN=mean) # for each level in dimensions 1 and 3

apply(a, MARGIN=c(2,1), FUN=sum) 
# atomic vectors

## Data frames

# Lists of equal-length vectors (columns)
df <- data.frame(
  name = c("Amy Willis", "Marco Carone", "Noah Simon"), 
  phd = c("Statistics", "Biostatistics", "Statistics"), 
  female = c(1,0,0))

#l stands for list - DF has columns which are vectors of equal dimension
lapply(df, class) # strings are coerced to factors

df <- data.frame(
  name = c("Amy Willis", "Marco Carone", "Noah Simon"), 
  phd = c("Statistics", "Biostatistics", "Statistics"), 
  female = c(1,0,0), 
  stringsAsFactors = FALSE)

lapply(df, class)


### Subsetting 

## Subsetting for arrays

# You can label the dimensions in an array
dimnames(a) <- list(c("a1","a2"), 1:3, c("cat","dog","rat","pig"))

a

# And use those labels for subsetting
a[,,"pig"] # you can use labels
a[,,4]

# subset by numeric 
a[,"3",]
a[,3,]
# everything but second column - 2 dimsensiojn
a[,-2,]
#TODO - try this
a[c(TRUE,FALSE),,c("dog","pig")]
a[c(TRUE,FALSE),,c(2,4)]
a[c(TRUE,FALSE),,-c("dog","pig")] # FAIL
a[c(TRUE,FALSE),,-c(2,4)]


# Remember: arrays are atomic vectors with special attributes,
# TODO - What do you mean by Atmoc ?
# but vectors anyway
a[10]
a[c(10,21)]
a[-c(1:5)]
# logical vector 
a[a>10]

# levels 
# How can we extract a subset of specific entries?
entries <- matrix(ncol = 3, byrow = TRUE, c(
  2, 1, 3,  
  1, 1, 2,
  2, 3, 4,
  1, 1, 1
))

entries

a[entries]


## Subsetting for lists

# "If list x is a train carrying objects, then x[[5]] is the object in car 5; 
#  x[4:6] is a train of cars 4-6."
# - @RLangTip

# accessing elements in nested lists
my_list <- list(
  a1 = list(b1 = list(c1="a1b1c1", c2="a1b1c2"), 
            b2 = list(c1="a1b2c1", c2="a1b2c2"))
  )

my_list[["a1"]]
my_list[["a1"]][["b2"]][["c1"]]
my_list[[c("a1", "b2", "c1")]]
my_list[[c(1,2,1)]]

my_list[[c("a1", "b2")]]
#equivalent to 
my_list[["a1"]][["b2"]]
#equivalent to 

my_list[[c(1,2)]]


my_list[[1]][[1:2]]

# Problem 1: explain the differences between the following:
my_list[[1]][1:2][1]
my_list[[1]][c("b1","b2")][[1]]

# Problem 2: What are the following lines trying to do? Are they meaningful in this case?
my_list[c("a1", "b2", "c1")]
my_list[c(1,2)]

# Problem 3: making use of the train analogy, explain why the following differ:
my_list[] # whole train 
my_list[[]]


## Subsetting for data frames
# Data frames are lists
df[2]
df[[2]]
class(df[2])
class(df[[2]])
df["phd"]
df[["phd"]]
df[c("phd","female")]
df$phd

# but they also behave like matrices
df[1,2]
df[1:3,1]
df[,"phd"]
df[,c("phd","female")]

# Something to keep in mind
column <- "phd"
df$column # FAIL
df[column]
df[[column]]


## Subsetting: simplyfying vs preserving
# Or how 'drop = FALSE' / 'drop = TRUE' will save you from many headaches 

# Consider a function that takes a matrix as input and gives summaries of 
# given columns
fn <- function(mat, cols){
  apply(mat[, cols], 2, summary)
}

matr <- matrix(rnorm(20), 4, 5)

fn(matr, c(1,3,5))

fn(matr, c(1)) # FAIL

# When subsetting, R uses the simplest data structure for the output
# 'drop' option: should R drop the original dimensions?
class(a[1:2,,])
class(a[1,,])
class(a[1,1,])
class(a[1,1,1])
dim(a[1,1,])

class(a[1:2,,,drop=FALSE])
class(a[1,,,drop=FALSE])
class(a[1,1,,drop=FALSE])
class(a[1,1,1,drop=FALSE])
dim(a[1,1,,drop=FALSE])


# Also for data frames
str(df[,c("phd","female")])
str(df[,c("phd")])
str(df[,c("phd"),drop=FALSE])
str(df[1,]) # Problem 4: why doesn't R simplify when subsetting rows of data frame?

# And for factors: drop the original levels?
x <- factor(c("a", "b", "b", "a", "c"))
x[1:3]
x[1:3, drop=TRUE]


## Partial matching when subsetting lists
d$n # $ does partial matching 
d[["n"]]
d[["n", exact=FALSE]] # [[ can do partial matching


## Subsetting and assigning
x <- rnorm(10)
x[x>0] <- 0
x
x[c(1,2)] <- 1:2
x
x[c(TRUE,FALSE,NA)] <- -10 # Problem 5: what happened here?
x

# a useful trick: apply transformation to all columns of data frame
df[] <- lapply(df, as.character) # data frame
df
lapply(df, class)
df <- lapply(df, as.character) # generic list
df

# want to delete element of list?
df$phd <- NULL
df
df[2] <-  NULL
df


## Lookup tables

# Similar to an example in the Advanced R book
x <- c("m", "f", NA, "f", "f", "m", "m")
lookup <- c(m = "Male", f = "Female") # named vector
lookup[x]
unname(lookup[x])

# Another approach: your codebook might be in a data frame
Sex_codes <- data.frame(code = c("f","m"), name = c("Female","Male"))

match(x, Sex_codes$code)

Sex_codes$name[match(x, Sex_codes$code)]
