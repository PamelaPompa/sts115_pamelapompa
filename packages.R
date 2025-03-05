#The downloaded binary packages are in
#C:\Users\pgp20\AppData\Local\Temp\Rtmpyg62MC\downloaded_packages

install.packages("ggplot2")
library("ggplot2")

cl <- read.csv("data/cl_rentals.csv")
head(cl)
str(cl)

unique(cl$laundry)
#for categorical data sets, we should use factors

cl$laundry = factor(cl$laundry)
str(cl)

as.numeric("5")
"5" + 1 # no
as.numeric("5") + 1 # works
as.numeric(c("1", "-1", "3.53")) #converts the entire vector

as.numeric("hello") #doesnt work
as.numeric("five")  #doesnt work

str(cl)


#Dates 
install.packages("lubridate")
library("lubridate")

dates = c("Jan 10, 2023", "Sep 3, 2018", "Feb 7, 2025")
cl$date_posted
dates
class(dates) #stays as character
class(mdy(dates)) #Date class

cl$date_posted <- ymd_hms(cl$date_posted)
class(cl$date_posted)

#The format string describes the format of the dates, and is based on the syntax of strptime
#a function provided by many programming languages for converting strings to dates (including R).
#In a format string, a percent sign % followed by a character is called a specification and has a
#special meaning.
          #example:
        odd_time = "6 minutes, 32 seconds after 10 o'clock"
        fast_strptime(odd_time, "%M minutes, %S seconds after %H o'clock")

head(cl$date_posted)
year(cl$date_posted)
month(cl$date_posted)

#CSV will need to do these conversions but RSV doesnt always if it was already created with the right class


#Tidy Data
  #RULES:
  #1) Rows are observations
  #2) Columns are features
  #3) One value per cell

head(cl)
head(mtcars) # not tidy, because the rows have both the manufacturer and model of the car
             # there's more than one piece of information

#Categorical
  #Nominal - data separated into specific categories, with no order. For example, hai color (red, brown)
  #Ordinal - data separated into specific categories, with an order i.e school level (elem, middle, high)
#Numerical
  #Discrete - integers, or a finite set of decimal numbers with no values in between. Sometimes
    #discrete values can also be treated as ordinal. For ex) month as a number (1, 2, ..., 12) is discrete
  #Continuous - decimal numbers. There are no specific categories, but there is an order. For example,
  #height in inches is numerical.

unique(cl$pets)
table(cl$pets) # good for categorical

x = c(-2, -1, -1, -1, 0, 2, 6)
x
length(x)
sum(x)
range(x)

#Mode
sort(table(x)) # tells you how many of each number there is

#R has a function called 'mode'. It doesn't compute the statistical mode!

#Median
median(x)

#Mean
mean(x)

length(x)
x[7]= 1000
mean(x)

median(x)

#Can you compute a mode, mean, and/or median for categorical data?
    #can't find mean but maybe you can find the median (wouldn't really be helpful)


#Spread / range
range(x)

#How far away is everything on avg. from the middle?
#Standard deviation (connected to the mean)
sd(x)
mean(x)

#Interquartile range (IQR) (median)
x
IQR(x)
summary(cl$price)
