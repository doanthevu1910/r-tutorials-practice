getwd()

#1a. Get the following matrix of 5 rows and call it ‘mymatrix’

mymatrix <- matrix(data = c(6,34,923,5,0, 112:116, 5,9,34,76,2, 545:549), nrow = 5)

mymatrix

#1b. Get the mean of each row

apply(mymatrix, rowMean)

?apply

apply(mymatrix, 1, mean)

#1c. Get the mean of each column

apply(mymatrix, 2, mean)

#1d. Sort the columns in ascending order

apply(mymatrix, 2, sort)

#2a. Use three ‘apply’ family functions to get the minimum values of each column of the ‘mtcars’ dataset (hint: ‘lapply’, ‘sapply’, ‘mapply’).
#Store each output in a separate object (‘l’, ‘s’, ‘m’) and get the outputs.

mtcars

l <- lapply(mtcars, min)

s <- sapply(mtcars, min)

m <- mapply(min, mtcars)

apply(mtcars, 2, min)

#2b. Put the three outputs ‘l’, ‘s’, ‘m’ in the list ‘listobjects’

listobjects <- list(l, s, m)

#2c. Use a suitable ‘apply’ function to get the class of each of the three list elements in ‘listobjects’

lapply(listobjects, class)

?apply

#3a. Use ‘mapply’ to get a list of 10 elements. 
#The list is an alteration of ‘A’ and ‘F’. 
#The lengths of those 10 alternating elements decreases step by step from 10 to 1.

?mapply

mapply(rep, c("A", "F"), 10:1)

#3b. Tweak the function that you get proper element numbers (1 : 10) for the 10 list elements. Hint: argument USE.NAMES

mapply(rep, c("A", "F"), 10:1, USE.NAMES = FALSE)

#4a. Use the standard ‘Titanic’ dataset. Use an appropriate apply function to get the sum of males vs females aboard.

View(Titanic)

apply(Titanic, 2, sum)

#4b. Get a table with the sum of survivors vs sex.

Titanic

?apply

apply(Titanic, c(2, 4), sum)

#4c. Get a table with the sum of passengers by sex vs age.

apply(Titanic, MARGIN = c(3, 2), FUN = sum)

dim(Titanic)

Titanic

#5a. a. Create ‘listobj’ which is a list of four matrices.

first = matrix(38:66, 3)

second = matrix(56:91, 3)

third = matrix(82:145, 3)

fourth = matrix(46:93, 5)

listobj = list(first, second, third, fourth)

listobj

#5b. Extract the second column from the list of matrices (from each single matrix).

colExtract <- function(x) {
    x[, 2]
}

lapply(listobj, colExtract)

#5c. Extract the third row from the list of matrices.

rowExtract <- function(x) {
    x[3, ]
}

lapply(listobj, rowExtract)

#or 

lapply(listobj,"[", , 2)

lapply(listobj,"[", 3 , )

#6a. Get a boxplot for each numerical column of the ‘iris’ dataset (four boxplots).

library(ggplot2)

apply(iris[ , 1:4], 2, boxplot)

#or
for (c in iris[, 1:4]) {
    boxplot(c)
}

#6b. The package ‘vioplot’ has a useful function ‘vioplot’ for violin plots (hint: install and activate package). 
#Get one violin plot for each numeric column, remove any numbers from the x axis, color = salmon

install.packages("vioplot")

library("vioplot")

apply(iris[ , 1:4], 2, vioplot, col = "salmon", names = "")

remove.packages("vioplot")

#7a. Find out which column of iris is not numeric.

?sapply

which(sapply(iris, class) != "numeric")

#7b. Identify the levels of the non-numeric column (hint: ‘levels’ function).

levels(iris$Species)

#7c. Try the function “unique” instead, compare the output.

unique(iris$Species)

#8a.

library("ggplot2")

diamonds

#8b. Which columns are not numeric in class?.

which(sapply(diamonds, class) != "numeric")

#8c. For observations 10000 to 11000, get the mean of columns 8, 9, 10.

meanCols <- apply(diamonds[10000:11000, 8:10], 1, mean)

roundedmeanCols <- round(meanCols, 1)

sort(roundedmeanCols, decreasing = FALSE)

#9a. Use ‘aggregate’ on ‘mtcars’. Calculate the median for each column sorted by the number of carburetors. 
#Use the standard ‘x’, ‘by’ and ‘FUN’ arguments.

?aggregate

mtcars

aggregate(x = mtcars, by = list (mtcars$carb), FUN = median)

#9b. Calculate again the median based on ‘carb’, but this time use the ‘formula-dot’ notation.

aggregate(. ~ carb, data = mtcars, median)

#10. Use ‘apply’ to perform a modulo division by 10 on each value of the matrix. 
#The new matrix contains the rest of the modulo division.

mymatrix = matrix(data = c(6,34,923,5,0, 112:116, 5,9,34,76,2, 545:549), nrow = 5)

apply(mymatrix, c(1,2), function(x) {x%%10})