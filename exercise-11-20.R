rm(list = ls())

#1a. Write a function “myfun” of x to the power of its index position (x, x^2, x^3, …)

#1b. Test the function with an x of 1:10

myfun <- function(x) {
    x ^ c(1:length(x))
}

myfun(x = 1:10)

#1c. Enlarge the function “myfun” with a division through the index position (x, x^2 / 2, x^3 /3, …)

myfun <- function(x) {
    (x ^ c(1:length(x)))/c(1:length(x))
}

myfun(x = 1:10)

#2a. Write a simple moving average function (length = 3)

#2b. Use it on the lynx dataset

mySMA <- function(x, n = length(x)) {
    (x[1:(n - 2)] + x[2:(n - 1)] + x[3:n])/3
}

mySMA(lynx)

#2c. Plot the SMA line against the original datset in a base plot

plot(lynx)

plot(mySMA(lynx))

?ts

SMAline <- ts(mySMA(lynx), start = 1822)

lines(SMAline, col = "red")

#3a. Write the function “myquarter” which allocates quadrants 1:4 to the angle degrees of the vector angle. That means a value of 80° is in quadrant 1, 310 ° in quadrant 4, 400° in quadrant 1 again, and so on

#3b. Test the function with the values: (910, 492, 1900)

myquarter <- function(x) {
    1 + (x%%360)%/%90
}

myquarter(c(910, 492, 1900))

#4a. Get the matrix “mym” which consists of the 4 values 1:4

#4b. Double all the odd numbers in mym with a function “matrixfun”

mym <- matrix(data = c(1:4), nrow = 2, ncol = 2)

mym

matrixfun <- function(x) {
    x[x%%2 == 1] <- x[x%%2 == 1] * 2
    x
}

matrixfun(mym)

#5. Take matrix “mym” and write a function which should return a new matrix which contains all the columns without an NA in it.

mym = matrix(c(3, NA, NA, 4, 5, 6, 7, 9), nrow = 2) 

mym

funcl <- function(x) {
    x[, !apply(is.na(mym), 2, any)]
}

funcl(mym)

#6a. Write a function “myfun” of 2 variables, a and b, where myfun = a^b

#6b. Get “myfun2” which is the same as “myfun” but divided by the index position of a+1 (e.g. the first position is divided by 2, the second by 3, …)

#6c. Test both functions with a = 1:10 and b = 5

myfun <- function(a, b) {
    a ^ b
}

myfun2 <- function(a, b) {
    (a ^ b)/ (2: (1 + length(a)))
}

myfun(1:10, 5)

myfun2(1:10, 5)

#7a. Write a function that generates a data.frame. Set up the function in a way so that it accepts any number of variables (hint: … as placeholder) and automatically returns the data.frame

func1 <- function(...) {
    data = data.frame(cbind(...))
    data
}

#7b. Test it with those 3 vectors

a = c(3,5,6)
b = c(T,T,F)
c = c("Tom", "Ted", "Hank")

func1(a, b, c)

#8a. Write a function “invoice” with variables pcs (nr of pieces) and unitprice the function calculates the net price (pcs * unitprice) and gives a deduction of 10% for >25 pieces sold

invoice <- function(pcs, uprice) {
    
    if(pcs <= 25) {
        price <- pcs * uprice
        price
    }
    
    if(pcs > 25) {
        price <- pcs * uprice * 0.9
        price
    }
}

#8b. Test with 56 pieces of 89$/unit

invoice(56, 89)

#9a. Write the function “doreturn” with variables x and y. The functions contains four steps as follows. Write the function in a way so that you get all four variables (a, b, r, t) returned.

doreturn <- function(x, y) {
    a = 5*x + y
    b = x + 7*y
    r = 3*x + 9*y
    t = x/y - 115
    return(c(a, b, r, t))
}

#9b. Test with 10 for x and 15 for y

doreturn(10, 15)

#10a. Write a function “myplot” which plots any data you feed into it (hint: placeholder). Preset arguments for magnification, line width, point type, color, delete lab naming

myplot <- function(...) {
    plot(..., 
         pch = 12, lwd = 4, col = "red", cex = 0.8, 
         xlab = "", ylab = "")
}

#10b. Test the plot function with lynx and rivers datasets

myplot(lynx)

myplot(rivers)


