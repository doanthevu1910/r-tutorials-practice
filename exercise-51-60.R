rm(list = ls())

install.packages("data.table")
install.packages("ISLR") #for the dataset College

library(data.table)
library(ISLR)

dtcollege = data.table(College, keep.rownames = T); class(dtcollege)

College

#1a. Transform ‘College’ from ‘ISLR’ to data.table. Make sure to keep the University identifier. We will use this new data.table called ‘dtcollege’ throughout this block of exercises.

dtcollege <- data.table(College, keep.rownames = TRUE)

#1b. Get familiar with the dataset and its variables.

head(dtcollege)

summary(dtcollege)

#3c. Extract rows 40 to 60 as a new data.table (‘mysubset’).

mysubset <- dtcollege[40:60, ]

mysubset

#1d. What is the average enrollment number in this subset?

mean(mysubset$Enroll)

round(mean(mysubset$Enroll), 1)

#2. "College" dataset. Get a data.table with all rows except the ones with an ‘Outstate’ fee between 8000-14000 USD.

newcollege <- subset(College, !(College$Outstate) %between% c(8000, 14000))

#3a. What are the top 10 Universities in terms of top 10% High School students (Top10perc)?

dtcollege <- data.table(College, keep.rownames = TRUE)

head(dtcollege, 10)

dtcollege$rn 

order(dtcollege$Top10perc, decreasing = TRUE)

dtcollege[order(dtcollege$Top10perc, decreasing = TRUE)][1:10, rn]

#3b. What are the top 10 Universities in terms of student enrollment vs. accepted applications (highest student enrollment ratio)? 
#Add a new column to the data.table. 
#Code this exercise step by step in several lines.

earatio <- dtcollege$Enroll/dtcollege$Accept

dtcollegeplus <- data.table(dtcollege, earatio, keep.rownames = TRUE)

dtcollegeplus[order(dtcollegeplus$earatio, decreasing = TRUE)][1:10, rn]

#3c. What are the top 10 Universities in terms of favorable S.F.Ratio with a Room.Board cost lower 4000 USD?

roomboard4000 <- dtcollege[dtcollege$Room.Board < 4000]

roomboard4000[order(roomboard4000$S.F.Ratio, decreasing = FALSE)][1:10, rn]

#4a. Create a new data.table ‘college.gradnr’ which consists of: ‘rn’, ‘F.Undergrad’, ‘P.Undergrad’, ‘Accept’, ‘Enroll’, ‘Apps’.

dtcollege <- data.table(College, keep.rownames = TRUE)

college.gradnr <- dtcollege[, c("rn", "F.Undergrad", "P.Undergrad", "Accept", "Enroll", "Apps")]

head(college.gradnr)

#4b. Permanently change the column order.

setcolorder(college.gradnr, neworder = c(1, 6, 4, 5, 2, 3))

head(college.gradnr)

#5a. Add a new column called ‘HighInterest’ to the data.table. The column has an integer 1 for all observations with a number of applications higher 1000.

dtcollege[Apps > 1000, HighInterest := 1]

head(dtcollege)

#5b. Remove the ‘HighInterest’ column again.

dtcollege[, c("HighInterest") := NULL] 

tail(dtcollege)

#6. Add a new column ‘undergradratio’ which is the undergraduate ratio (F.Undergrad/P.Undergrad). Get the first ten observations starting with the highest ratio. The whole exercise should be coded in one line – Use chaining!

undergratio <- dtcollege$F.Undergrad/dtcollege$P.Undergrad

dtcollege_1 <- data.table(dtcollege, undergratio, keep.rownames = TRUE)

dtcollege_1[order(dtcollege_1$undergratio, decreasing = TRUE)][1:10, rn]

#7a. How many Universities have instructional expenditures of over 20000 USD per year?

nrow(dtcollege[dtcollege$Expend > 20000])

#7b. How many Universities have a combined ‘Books’ and ‘Room.Board’ costs of over 7000 USD per year?

nrow(dtcollege[(dtcollege$Books + dtcollege$Room.Board) > 7000])

#7c. How many Universities are public and how many are private?

nrow(dtcollege[dtcollege$Private == "Yes"]); nrow(dtcollege[dtcollege$Private != "Yes"])

#or

#a.
dtcollege[Expend > 20000, .N]

#b.
dtcollege[Books+Room.Board > 7000, .N]

#c.
dtcollege[, by = Private, .N]

#8a. Set two keys to your ‘College’ data.table: ‘F.Undergrad’ and ‘P.Undergrad’. Check if the order has changed.

?setkey

dtcollege <- data.table(College, keep.rownames = TRUE)

setkey(dtcollege, F.Undergrad, P.Undergrad)

head(dtcollege)

#8b. Get a subset of the ‘College’ data with ‘F.Undergrad’ lower 1000 and ‘P.Undergrad’ lower 100 students.

?subset

head(subset(College, F.Undergrad < 1000 & P.Undergrad < 100))

head(dtcollege[F.Undergrad < 1000 & P.Undergrad < 100])

#8c. Is there a college with exactly 393 full-time and 4 part-time undergraduate students?

?which

dtcollege[.(393, 4)][1, rn]

#9a. Get a data.table with all columns except ‘Apps’, ‘Accept’, ‘Enroll’. Use at least two different ways for this.

dtcollege_2 <- dtcollege[ , -c("Apps", "Accept", "Enroll")]

head(dtcollege_2)

#9b. Get a data.table with the three columns ‘Apps’, ‘Accept’, ‘Enroll’. Use at least two different code efficient methods.

dtcollege_3 <- dtcollege[ , c("Apps", "Accept", "Enroll")]

head(dtcollege_3)

#10a. How many Colleges with less than 800 applications received, have a Top 10 student percentage above 40?

nrow(dtcollege[dtcollege$Apps < 800 & dtcollege$Top10perc > 40])

#10b. How many Colleges with less than 900 applications received and an ‘Out of state tuition’ below 10000, have a top 10 student percentage above 30?

nrow(dtcollege[dtcollege$Apps < 900 & dtcollege$Outstate < 10000 & dtcollege$Top10perc > 30])

#10c. How many Colleges with less than 1000 applications received, have a ‘Top10perc’ above 20 OR a ‘Top25perc’ above 30?

nrow(dtcollege[dtcollege$Apps < 1000 & dtcollege$Top10perc > 20 | dtcollege$Top25perc > 30])

#or

#a.
dtcollege[Apps < 800, .N, by = (Top10perc > 40)]

#b.
dtcollege[Apps < 900 & Outstate < 10000, .N, by = (Top10perc > 30)]

#c.
dtcollege[Apps < 1000, .N, by = (Top10perc > 20 | Top25perc > 30 )]
