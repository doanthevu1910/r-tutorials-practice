rm(list = ls())

#1a. Get a histogram of the ‘mpg’ values of ‘mtcars’. Which bin contains the most observations?

hist(mtcars$mpg)

#1b. Are there more automatic (0) or manual (1) transmission-type cars in the dataset? Hint: ‘mtcars’ has 32 observations.

nrow(mtcars)

ncol(mtcars)

a <- which(mtcars$am == 1)

length(a)

b <- which(mtcars$am == 0)

length(b)

#or

sum(mtcars$am == 1)

sum(mtcars$am == 0)

#1c. Get a scatter plot of ‘hp’ vs ‘weight’.

plot(mtcars$hp, mtcars$wt)

scatter.smooth(mtcars$hp, mtcars$wt)

#2a. Get all rows of Species ‘versicolor’ in a new data frame. Call this data frame: ‘iris.vers’

iris

iris.vers <- subset(iris, iris$Species == "versicolor") 

iris.vers

#2b. Get a vector called ‘sepal.dif’ with the difference between ‘Sepal.Length’ and ‘Sepal.Width’ of ‘versicolor’ plants.

sepal.dif <- iris.vers$Sepal.Length - iris.vers$Sepal.Width

#2c. Update (add) ‘iris.vers’ with the new column ‘sepal.dif’.

iris.vers <- cbind(iris.vers, sepal.dif)

iris.vers

#or 

iris.vers <- data.frame(iris.vers, sepal.dif); head(iris.vers)

#3a. Check the class of each variable in ‘mtcars’.

class(mtcars)

sapply(mtcars, class)

#3b. Change ‘am’, ‘cyl’ and ‘vs’ to integer and store the new dataset as ‘newmtc’.

as.integer(mtcars$am)

class(mtcars$am)

?attach

?data.frame

attach(mtcars)

newmtc <- data.frame(mpg, as.integer(cyl), disp, hp, drat, wt, qsec, as.integer(vs), as.integer(am), gear, carb)

sapply(newmtc, class)

#3c. Round the ‘newmtc’ data frame to one digit.

newmtc <- round(newmtc, digits = 1)

newmtc

#4a. Use ‘dplyr’ to filter for all data of Species ‘virginica’ with a ‘Sepal.Width’ of greater than 3.5.

library(dplyr)

filter(iris, Species == "virginica", Sepal.Width > 3.5)

#4b. Use R Base to get a data frame of  all data of Species ‘virginica’ with a ‘Sepal.Width’ of greater than 3.5, but without the last column Species in the data frame?

iris1 <- subset(iris, iris$Species == "virginica" & iris$Sepal.Width > 3.5)

iris1[1:4]

#or

iris[iris$Species == "virginica" & iris$Sepal.Width > 3.5, 1:4]

#4c. Get the row IDs of the rows matching the two filtering criteria provided above.

rownames(iris1)

#5a. Repeat each value of ‘Sepal.Length’ two times and repeat the whole sequence two times as well.

rep(iris$Sepal.Length, each = 2, times = 2)

#5b. Get a new object which contains only the odd values of ‘Sepal.Length’.

oddSepal.Length

subset(iris$Sepal.Length, iris$Sepal.Length%%2 == 1)

subset(iris, iris$Sepal.Length)

round(iris$Sepal.Length, 0)

iris[c(T, F), 1]

#correct - why?

oddSepal.Length <- iris[c(T,F),1]

#5c. Get a new object which repeats each value from the new vector of exercise b.

newoddSepal.Length <- rep(oddSepal.Length, each = 2)

#5d. Replace the ‘Sepal.Length’ column of ‘iris’ with the new ‘Sepal.Length’ from exercise c. Check if the replacement worked.

iris$Sepal.Length <- newoddSepal.Length

head(iris)

#6ab. Get familiar with the dataset ‘diamonds’ from ‘ggplot2’.

library("ggplot2")

attach(diamonds)

#6c. Get a subset from the diamonds dataset with all the rows that have a clarity of ‘SI2’ and a depth of at least 70. Call the subset ‘diam.sd’ and display it in the same line of code.

head(diamonds)

diam.sd <- subset(diamonds, diamonds$clarity == "SI2" & diamonds$depth >= 70); head(diam.sd)

#6d. Which index positions have a clarity of ‘SI2’ and a depth of at least 70? (hint: ‘row.names’)

row.names(diam.sd)

#6e. Store the index positions as an integer object.

names <- as.integer(rownames(diam.sd))

class(names)

#7a. How many observations of diamonds have a cut of ‘ideal’ and have less than 0.21 carat?

library("ggplot2")

head(diamonds)

attach(diamonds)

sum(cut == "ideal", carat < 0.21)

#7b. How many observations of diamonds have a combined ‘x’ + ‘y’ + ‘z’ dimension greater than 40?

sum(x + y + z > 40)

#7c. How many observations of diamonds have either a price above 10.000 USD or a depth of at least 70?

sum(price > 10000 | depth >= 70)

#8a. Get a data frame with observations ’67’ and ‘982’ of variables color and y.

library("ggplot2")

head(diamonds)

diamonds[c(67, 982), c("color", "y")]

#8b. Get a data frame with the full info on observations ‘453’, ‘792’ and ‘10489’.

diamonds[c(453, 792, 10489), ]

#8c. Get the first 10 rows of the dataset ‘diamonds’ with the variables ‘x’, ‘y’, ‘z’.

diamonds[c(1:10), c("x", "y", "z")]

#8d. Get the first six values of ‘diamonds’ of the variable ‘y’ as a simple vector.

diamonds[c(1:6), "y"]

#9a. Create the object ‘newdiam’ which is a subset of the first 1000 rows of ‘diamonds’.

library("ggplot2")

head(diamonds)

newdiam <- head(diamonds, 1000) 

#or 

diamonds[c(1:1000), ]

#9b. Order ‘newdiam’ according to price, starting with the lowest. Hint: ‘dplyr’, ‘arrange’ is a useful function for that.

library("dplyr")

arrange(newdiam, price)

?arrange

#9c. Order ‘newdiam’ according to price, starting with the highest.

arrange(newdiam, desc(price))

#9d. Order ‘newdiam’ like in exercise c, but ties should be arranged with increasing depth.

arrange(newdiam, desc(price), depth)

#10a. Use ‘dplyr’, ‘sample_n’ to get the object ‘diam750’ which contains 750 randomly sampled observations of ‘diamonds’. 
#Use seed nr. 56 for reproduction.

?sample_n

set.seed(56)

diam750 <- sample_n(diamonds, size = 750); head(diam750)

summary(diam750)

#10b. Plot a scatter plot of price vs depth. Use R Base plot, and the function ‘with’ (less code).

with(diam750, plot(price, depth))
