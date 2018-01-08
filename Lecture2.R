weight_g <- c(50, 60, 65, 82)

num_char <- c(1, 2, 3, "a")
class(num_char)
num_logical <- c(1, 2, 3, TRUE)
class(num_logical)
char_logical <- c("a", "b", "c", TRUE)
class(char_logical)
tricky <- c(1, 2, 3, "4")
class(tricky)


#why does this coercon happern, idea of least importance type gets the assignmebt - check

#$do subsettinf

animals <- c("mouse", "rat", "dog", "cat")
animals[2:3]

#logical 

#recyclng - question 
animals[c(TRUE, FALSE, TRUE, TRUE, FALSE)]

#recycling - why , write this
animals[c(TRUE, FALSE)]


#conditional subetting

weight_g <- c(21, 34, 39, 54, 55)
#gives logical vector
weight_g < 50

#now subset
weight_g[weight_g < 50]

#show or and and operator
weight_g[weight_g < 30 | weight_g > 50]
weight_g[weight_g >= 30 & weight_g == 21]


#subsetting charactrers

animals <- c("mouse", "rat", "dog", "cat")
animals[animals == "cat" | animals == "rat"] # returns both rat and cat

#what about and
animals[animals == "cat" & animals == "rat"]


animals %in% c("rat", "cat", "dog", "duck", "goat")

"four" > "five"

#true because lexical order(dictionary)


heights <- c(2, 4, 4, NA, 6)
mean(heights)

lengths <- c(10, 24, NA, 18, NA, 20)

lengths[!is.na(lengths)]

