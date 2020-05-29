rm(list = ls())

#1.

student.df = data.frame( name = c("Sue", "Eva", "Henry", "Jan"),
                         sex = c("f", "f", "m", "m"), 
                         years = c(21,31,29,19)); student.df

#Use a simple ‘ifelse’ statement to add a new column ‘male.teen’ to the data frame. This is a boolean column, indicating T if the observation is a male younger than 20 years.

student.df$male.teen <- ifelse(student.df$sex == "m" &
                                   student.df$years < 20, "T", "F")

student.df

#2. Write a double for loop which prints 30 numbers (1:10, 2:11, 3:12). 
#Those are three clusters of ten numbers each. 
#The first loop determines the number of clusters (3) via its length; the second loop the numbers to be printed (1 to 10 at the beginning). 
#Each cluster starts one number higher than the previous one.

for (i in 1:length(1:3)) {
    for (j in 1:10) {
        print(j+i-1)
    }
}

#3. Write a repeat loop containing three random numbers. 
#The loop repeats itself exactly ten times before it stops.

set.seed(27)

rn <- rnorm(3)

i <- 1

repeat {
    print(rn)
    i <- i + 1
    
    if (i > 10)
        break
}

#4. Write a for loop that prints the Displacement (‘disp’) of the ‘mtcars’ dataset.
#a. This loop will only print observations of 160 or higher in ‘disp’.

for (i in mtcars$disp) {
    if (i >= 160) {
        print(i)
    }
}

#b. This loop will stop as soon as an observation is smaller than 160 in ‘disp’.

for (i in mtcars$disp){
    if(i< 160)
        break
    print(i)
}

#5.

a = c(3,7,NA, 9)
b = c(2,NA,9,3)
f = c(5,2,5,6)
d = c(NA,3,4,NA)

mydf = data.frame(a=a,b=b,f=f,d=d); mydf

#Add another column ‘5’:
#the 5th column contains the value of col 2 if col 1 is NA;
#the 5th column contains the value of col 4 if col 2 is NA;
#the 5th column contains the value of col 3 in all other cases.

if (is.na(mydf[, 1]) == TRUE) {
    mydf$V5 <- mydf[, 2]
} else if (is.na(mydf[ , 2]) == TRUE) {
    mydf$V5 <- mydf[ , 4]
} else {
    mydf$V5 <- mydf[ , 3]
}

mydf

#or

mydf = data.frame(a=a,b=b,f=f,d=d);mydf

mydf[,5] <- ifelse(is.na(mydf[,1]) & !is.na(mydf[,2]),
                   mydf[,2],
                   ifelse(is.na(mydf[,2]) & !is.na(mydf[,4]),
                          mydf[,4], mydf[,3]))
mydf

#6. Write a while loop starting with x = 0. The loop prints all numbers up to 35 but it skips number 7.

i <- -1

while (i < 35) {
    i <- i + 1
    if (i == 7) next
    print(i)
}

#7. We are using the same while loop as in the last exercise. 
#The loop prints again all numbers up to 35, but this time it skips a whole vector of numbers: 3,9,13,19,23,29.

i <- -1

while (i < 35) {
    i <- i + 1
    if(i == c(3,9,13,19,23,29)) next
    print(i)
    
}

#8. You have an urn with balls from 1 to 100. You want to find out how often you need to draw a ball to get number 55. 
#This is an experiment with replacement – you put the ball back each time you draw. 
#Simulate 1000 runs of the experiment to get an accurate estimation of the required draws.

#Use seed 23 to make the experiment reproducible. Use loops (for, while) for the solution.

set.seed(23)

urn <- c(1:100)

repetition <- 1000

trialsto55 <- 0

for (i in 1:repetition) {
    ball <- 0    
    trials <- 0
    while (ball != 55) {
        ball <- sample(urn, size = 1, replace = )
        trials <- trials + 1
    }
    trialsto55 <- trialsto55 + trials   
}

ratio <- trialsto55/repetition; ratio

rm(list = ls())

#10. Use the ‘rivers’ dataset to write a for loop. The loop prints the dataset:
#rivers shorter than 500 are a ‘short river’;
#rivers longer than 2000 are a ‘long river’;
#and rivers in the middle range are printed in their original numbers.

for (i in rivers){
    if(i<500){
        print("short river")
    } else if (i>2000) {
        print("long river")
    } else{
        print(i)}
}
