rm(list = ls())

install.packages("ISLR")
install.packages("stringr") #version 1.1.0 (or higher)
install.packages("tidyr")

library(ISLR) #for the college dataset
library(stringr) #string manipulations
library(tidyr)

#modified datasets to be used in some exercises
college.names = rownames(College); college.names
mtcars.names = rownames(mtcars); mtcars.names

#1a. Get familiar with the ‘college’ dataset and its row names.

summary(College); head(College)

rownames(College)

#1b. Get a vector with the college names (‘college.names’) which you will need in the further steps of this and the next exercises.

college.names <- row.names(College)

#1c. Get a vector (‘texas.college’) which contains all colleges with ‘Texas’ in its name. Summarize the vector.

library(stringr)

college.texas <- str_match(college.names, "Texas")

summary(college.texas)

#1d. Which rows contain ‘Texas’?

which(college.texas == "Texas")

#1e. Extract the subset of ‘Texas’ colleges from the original ‘College’ dataset.

College[which(college.texas == "Texas"), ][1:10, ]

#2a. Use the ‘college.names’ vector from the previous exercise and split it into single words.

head(college.names)

singlewords <- strsplit(college.names, " ")

head(singlewords)

#2b. Put the single words to lower-case.

tolower(singlewords)

#2c. Put the single words to upper-case using the function: ‘casefold’.

casefold(singlewords, upper = TRUE)

#3a. Get a vector of all rows of the ‘College’ dataset containing the term ‘University’.

college.uni <- str_count(college.names, "University")

head(college.uni)

sum(college.uni)

which(college.uni == 1)

#3b. How many ‘Universities’ are in the dataset vs ‘Colleges’?

sum(str_count(college.names, "University")); sum(str_count(college.names, "College"))

#4a. Let’s say you have a string containing one word ‘get’. Add zeros on both sides of the vector so that the whole character has a length of 10. (hint: ‘str_pad’).

get <- "get"

str_pad(get, width = 10, side = "both", pad = "0")

#4b. Pad the word ‘Oslo’ with spaces on the left side to a total length of 10. Call it ‘paddedstring’.

Oslo <- "Oslo"

paddedstring <- str_pad(Oslo, width = 10, side = "left", pad = " ")

#4c. Trim the ‘paddedstring’ back. (hint: ‘str_trim’).

str_trim(paddedstring, side = "left")

#4d. Truncate ‘paddedstring’ to a width of seven (hint: ‘str_trunc’).

str_trunc(paddedstring, width = 7, side = "left")

#5.

mydata = data.frame(
    name = c("Hank", "Mike", "Jane", "Sue"),
    measurements = c("183m", "179m", "172f", "169f"),
    residency = c("London", "Sydney", "Prague", "Dublin")
); mydata

#5b. Use the library ‘tidyr’ to separate the column ‘measurements’ into ‘height’ and ‘sex’. Code the split to both sides..

library("tidyr")

mydata

separate(data = mydata, col = measurements,
         into = c("height", "sex"), sep = 3)

#5c. Get a vector which contains ‘names’ and ‘residency’ combined.

unite(data = mydata, col = name_res, c(1, 3))

?unite

#6.

a = c("Tom Hastings", "Brian Wall", "Sue Klark")

b = c(T, F, T) 

c = rnorm(3)

stringdf = data.frame(Names = as.character(a), 
                      Indicator = b,
                      Measurement = c,
                      stringsAsFactors = F); stringdf

attach(stringdf)

class(Names)

#6a. Create a data.frame with two columns: one for the first and one for the last name.

namelist <- strsplit(stringdf$Names, split = " ")

namelist
# as a list

namedf <- data.frame(do.call(rbind, namelist));
# turning the list to a df

namedf

#6b. Add ‘first’ and ‘last names’ to the original data.frame and order it accordingly.

stringdf$FirstName <- namedf$X1
#adding the first name

stringdf$LastName <- namedf$X2
#adding the last name

stringdf
#checking the df

ResultDF <- stringdf[,c(4,5,2,3)];
#reordering the df for final result

ResultDF

#7.

a = c("Tom Hastings", "Brian Wall", "Sue Klark")

b = c(T, F, T) 

c = rnorm(3)

stringdf = data.frame(Names = as.character(a), 
                      Indicator = b,
                      Measurement = c,
                      stringsAsFactors = F); stringdf

attach(stringdf) #attach to make the work easier

class(Names) #check the class of Names to character, no Factor desired

namelist <- strsplit(stringdf$Names, split = " ")

#7a. Split the names into a vector.

namelist.vec <- unlist(namelist)

class(unlist(namelist))

#7b. Organize the vector in a data.frame as below (hint: matrix and data.frame).

namedf2 <- as.data.frame(matrix(namelist.vec, ncol=2, byrow=TRUE, dimnames = list(c(1:3),c("FirstName", "LastName"))));

namedf2

#8a. Get the vector ‘mtcars.names’ which contains the row names of ‘mtcars’.

mtcars.names <- row.names(mtcars)

head(mtcars.names)

#8b. Step by step: remove all digits, punctuations, space symbols, upper and lower-cases from the data, so that you end up with an empty vector.

mtcars.names <- gsub("[[:digit:]]", "", mtcars.names); mtcars.names

mtcars.names <- gsub("[[:punct:]]", "", mtcars.names); mtcars.names

mtcars.names <- gsub("[[:space:]]", "", mtcars.names); mtcars.names

mtcars.names <- gsub("[[:upper:]]", "", mtcars.names); mtcars.names

mtcars.names <- gsub("[[:lower:]]", "", mtcars.names); mtcars.names

#9. Change the row names containing ‘Merc’ to the full name ‘Mercedes’.

mtcars.names <- row.names(mtcars)

mtcars.names <- gsub("Merc", "Mercedes", mtcars.names); mtcars.names

#10.

mystring <- "Gabriel-Henry.Tedd.-John (Yorkshire)"

#10a. Replace the dot (.) with a space

mystring <- gsub(".", " ", mystring, fixed = TRUE); mystring

#10b. Delete the brackets including its content: ‘(Yorkshire)’?

mystring <- "Gabriel-Henry.Tedd.-John (Yorkshire)"

mystring <- gsub(" (Yorkshire)", "", mystring, fixed = TRUE); mystring


