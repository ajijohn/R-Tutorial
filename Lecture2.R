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
