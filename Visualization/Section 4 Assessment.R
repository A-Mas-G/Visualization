library(dslabs)
data(heights)
str(heights)
#1
sex_all <- ifelse(heights$sex == "Female", 1, 2)
sum(sex_all)
#2
height_72<- ifelse(heights$height >72, heights$height, 0)
mean(height_72)
#3a
inches_to_ft <- function(x){
  i <- x
  f <- 12
  i/f
}
inches_to_ft(144)
identical(inches_to_ft(144), 144/12)
#3b
height_less_5 <- ifelse(heights$height<5*12,1,0)
sum(height_less_5)
#5
# define a vector of length m
m <- 10
f_n <- vector(length = m)

# make a vector of factorials
for(n in 1:m){
  f_n[n] <- factorial(n)
}

# inspect f_n
f_n