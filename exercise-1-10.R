# 1a. get the length of the "lynx" dataset

length(lynx)

#1b. Create a vector of ordered “lynx” index numbers (hint: order, increasing)

order(lynx, decreasing = FALSE)

#1c. Get 2 vectors (index positions and absolute values) with all “lynx” observations smaller than 500 (hint: which, subset)

which(lynx < 500)

subset(lynx, lynx < 500)

#2a. Get a Histogram of the “lynx” dataset

#2b. Adjust the bin size to 7 bins

#2c. Remove the labs and change the bins to 2 alternating colors

#2d. Add a subtitle and divide the main title in 2 lines

hist(lynx, 
     breaks = 7, 
     xlab = "", ylab = "", col = c("red", 'blue'),
     main = "Histogram\nof lynx", sub = "subtitle"
)

?hist

#3a. Extract Sepal.Length from the “iris” dataset and call the resulting vector mysepal

#3b. Get the summation, mean, median, max and min of mysepal

mysepal <- iris$Sepal.Length

sum(mysepal)

mean(mysepal)

median(mysepal)

max(mysepal)

min(mysepal)

#3c. Get the summary of mysepal and compare the results with 3b

summary(mysepal)

#4a. Install and load library “dplyr”

#4b. Call help for function arrange of “dplyr”

#4c. Deinstall “dplyr”

install.packages("dplyr")

help(arrange, package = "dplyr")

remove.packages("dplyr")

#5.

x <- c(3,6,9)

#5a. Repeat x 4 times, but there should be an extra 1 at the end and beginning

?rep

myvec <- c(1, rep(x, 4), 1)

#5b. Call the vector of 5a myvec and extract the 5th value (hint: dplyr, nth)

myvec[5]

#or

library(dplyr)

nth(myvec, 5)

#6a. Get a subset of “mtcars” with transmission type: manual, and call it mysubset

#6b. Extract the first 2 variables of the first 2 observations of mysubset

mtcars

View(mtcars)

mysubset <- subset(mtcars, mtcars$am == 1)

View(mysubset)

mysubset[c(1, 2), c(1,2)]

#7a. Get the first 9 observations of “mtcars”

head(mtcars, 9)

#7b. Get the “mtcars” dataset ordered according to the increasing amount of “carb” hint for 7b: library dplyr, arrange

install.packages("dplyr")

library(dplyr)

arrange(mtcars, carb)

#8a. Get the means of the first 2 columns in the “iris” dataset by Species

View(iris)

iris$Species

colMeans()

?by

by(iris[, c(1,2)], iris$Species, colMeans)

#8b. Create vector x which is the alternation of 1 and 2, 75 times, check the length

x <- rep(c(1,2), 75)

length(x)

#8c. Attach x to iris as dataframe “irisx”, check the head

irisx <- data.frame(iris, x)

head(irisx)

#8d. Get the colsums of columns 1,3,4 in the “irisx” dataset by the new x variable

by(irisx[, c(1, 3, 4)], irisx$x, colSums)

#9a. How many observations in “lynx” are smaller than 500?

subset <- subset(lynx, lynx < 500)

length(subset)

#or

sum(lynx < 500)

#9b. How many observations in “iris” have a Sepal.Length greater or equal 5?

subset <- subset(iris, iris$Sepal.Length >= 5)

length(subset)

#or

sum(iris$Sepal.Length >= 5)

#10a. Plot a simple xy plot with “iris” Sepal.Length vs. Sepal.Width
#10b. Enlarge the scale limits: y from 0 – 5, x from 3 – 9
#10c. Add a text of your choosing, in red, at the lower part of the plot

plot(iris$Sepal.Length, iris$Sepal.Width,
     xlab = "Sepal Length", ylab = "Sepal Width",
     xlim = c(3, 9), ylim = c(0, 5)
)

text(6, 1, "doanthevu1910", col = "blue", cex = 2)


