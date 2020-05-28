rm(list = ls())

#1a. Get 200 random numbers and call the object ‘mydata’. Let’s set a seed of 14 for reproducibility.
#1b. Get a time series plot without converting to class ‘ts’.

set.seed(14)

mydata <- c(rnorm(100), runif(100))

plot(mydata)

plot.ts(mydata, xlab = "xlab", ylab = "ylab")

?plot.ts

args(plot.ts)

#1c. Add ablines to the chart to indicate the horizontal boundaries of 0 and 1.

abline(a = 0, b = 1)

args(abline)

abline(h = 0, col = "red")

abline(h = 1, col = "red")

#2a. Get and load the package ‘xts’ and all required packages.

install.packages("xts")

library("xts")

remove.packages("xts")

#2b. Create the objects ‘measurment’ and ‘dates’ like below.

measurement <- rep(sin(seq(0, 10,length.out = 90)), 4) + rnorm(90*4)

dates <- seq(as.Date("1987-01-01"), as.Date("1987-12-26"), "day")

#2c. Use the two objects to create an ‘xts’ time series (‘mytimeseries’) ordered by ‘dates’.

?xts

mytimeseries <- xts(x = measurement, order.by = dates)

#2d. Plot the ‘xts’ time series.

rm(myyimeseries)

plot(mytimeseries)

#2e. Use ‘apply.monthly’ from ‘xts’ to get a monthly mean on the time series.

monthly <- apply.monthly(mytimeseries, FUN = mean)

#2f. Get a monthly plot.

plot(monthly)

#3

mydata = rep(sin(seq(0,10,length.out = 90)),4) + rnorm(90*4)

#3a. Create ‘myts’ which is a daily time series of ‘mydata’, starting on the second day in 1984.

myts <- ts(mydata, start = c(1984, 2), frequency = 365)

?ts

plot(myts)

#3b. Create ‘myts2’ which is a monthly time series of ‘mydata’, starting in February 1984.

myts2 <- ts(mydata, start = c(1984, 2), frequency = 12)

plot(myts2)

#3c. Create ‘myts3’ which is a quarterly time series of ‘mydata’, starting in quarter 2 of 1984.

myts3 <- ts(mydata, start = c(1984, 2), frequency = 4)

plot(myts3)

#4

set.seed(20)

mydata1 = rnorm(500, 6)

mydata2 = rnorm(500, 77)

mydata3 = runif(500)

#4a. Combine the data to a data.frame ‘mydata’.

mydata <- data.frame(mydata1, mydata2, mydata3)

#4c. Change the format to a matrix.

mydata <- as.matrix(mydata)

class(mydata)

#4d. Create ‘myts’ of ‘mydata’, which starts in May 1980, this is a class ‘mts’.

myts <- ts(data = mydata, start = c(1980, 5), frequency = 12, class = "mts")

class(myts)

rm(list = ls())

#5a. Get 49 random numbers and call the vector ‘mydata’.

mydata <- rnorm(49)

#5b. Convert ‘mydata’ to a weekly time series – those are five day business weeks. The time series starts on the second day of week 4. Call it ‘weeklyts’.

weeklyts <- ts(data = mydata, start = c(4, 2), frequency = 5)

#5c. Use the function SMA from the package ‘TTR’ to get a five day simple moving average. Call the object ‘mysma’.

install.packages("TTR")

library("TTR")

mysma <- SMA(weeklyts, n = 5)

#5d. Plot the time series and add the ‘mysma’ line to the chart.

plot(weeklyts)

lines(mysma, col = "red")

remove.packages("TTR")

#6a. Install and load the ‘astsa’ library and get familiar with the ‘birth’ dataset.

install.packages("astsa")

library("astsa")

View(birth)

summary(birth); head(birth); length(birth)

#6b. Get a decomposition plot of the ‘birth’ dataset.

plot(decompose(birth))

#6c. Decompose the dataset and create a new object, which consists only of the components ‘seasonal’ and ‘trend’ of the original dataset. Plot the new object.

new <- decompose(birth)

newobject <- new$seasonal + new$trend

plot(newobject)

#7. Use ‘decompose’ and ‘stl’ to decompose the ‘ldeaths’ dataset. Which one of the 2 functions is more customizable?

decompose(ldeaths)

stl(ldeaths, s.window = "periodic")

plot(decompose(ldeaths))

plot(stl(ldeaths, s.window = "periodic"))

#8.

install.packages("forecast")

library("forecast")

data()

seasonplot(x = gas, main = "Seasonal Oil Prices\n2000 - 2010",
           col = c("red", "blue")
)

remove.packages("forecast"); remove.packages("astsa")

#9.

install.packages(c("forecast", "astsa"))

library("forecast"); library("astsa")

#9b. Use the function ‘ses’ and ‘holt’ (package ‘forecast’) to predict the next 15 weeks of the oil dataset.

?ses

?holt

oilforecast1 <- ses(gas, h = 15)

oilforecast2 <- holt(gas, h = 15)

#9c. Get a plot for each of the two prediction objects and compare the results. Which one is more trend based?.

par(mfrow = c(1, 2))

plot(oilforecast1); plot(oilforecast2)

remove.packages("forecast"); remove.packages("astsa")

#10.

install.packages(c("forecast", "astsa", "TTR"))

library("forecast"); library("astsa"); library("TTR")

#10b. Use the function ‘ses’ to predict the next three months of the ‘flu’ dataset in ‘astsa’.

fluforecast1 <- ses(flu, h = 3)

#10c. Plot the prediction and add a three months exponential moving average line to the plot.

dev.off() #reset the par()

plot(fluforecast1)

lines(EMA(flu, n = 3), col = "red")

remove.packages("forecast"); remove.packages("astsa"); remove.packages("TTR")

