################################################################
# This file contains questions for the midterm exam for STS115 #
# Winter Quarter, 2025.                                        #
#                                                              #
# This is exam is designed to provide you with the chance      #
# to demonstrate your understanding of both the concepts       #
# and syntax of the methods deployed by Data Scientists.       #
# As such, even if you are unable to provide working code      #
# for questions that require you to code, we encourage you     #
# to provide pseudo code and/or a textual explanation          #
# of your understanding of how one would approach the          #
# problem computationally, or even how the computer itself     #
# would approach the problem given your knowledge of how       #
# computers and programming languages work.                    #
#                                                              #
# Because problem solving is an essential part of being a      #
# Data Scientist, you are allowed to use any resources at      #
# your disposal to respond to the questions in this exam.      #
# This includes, but is not limited to, resources such as      #
# Google, Stack Overflow, the Course Reader, etc.              #
# The only restriction is that you may not use live chat,      # 
# messaging, email, discourse, Slack, or any other method of   # 
# real-time communication with another member of the course    #
# or any other person to formulate your response.              #
#                                                              #
# Questions appear as comments in this file.  As with the      #
# homework assignments, place your answers to each question    #
# immediately following the question prompt. Some questions    #
# require you to write computer code (R or Shell Script) as    #
# an answer and other questions ask you to provide text only   #
# explanations of computing and Data Science concepts.         #
# The phrase "[Text Answer]" appears immediately following     #
# each question that requires a text only answer. As noted     #
# above, you are encouraged to include text explanation of     #
# your code answers in all cases to increase your chances      #
# of earning partial credit for a question in the event that   #
# your code solution is incorrect.                             #
#                                                              #
# The exam duration is 1.5 hours.                              #                                                             #                                                              #
# Submit your completed exam and generated files via Github    #
# using the same workflow that you have used to submit your    #
# class homework.                                              #
################################################################


# Question 1. What is the command line symbol that provides 
# a shortcut to your "home" directory on your system.  For 
# example, what symbol would you use in place of "x" in the 
# command "cd x" if you wanted to use the cd command to move 
# into your home directory:

  #command: cd ~
    
  #' The ~ symbol will take you to your personal user directory; should be typed in the terminal not in
  #' an R script though



# Question 2. Write R code to assign the value 7 to a variable "x":

  x <- 7


# Question 3. Write R code that subtracts 3 from the variable "x" 
# and assigns the results to a variable "y":
  
  x <- x - 3
  y <- x
  
  #' Another alternative is "y <- x - 3". I wasn't sure if I should do this, because it wouldn't permanently
  #' modify the x variable; it would modify a copy of x but not the actual variable itself.
  #' The way I did it subtracts 3 from x first and assigns the output to x, and then I
  #'manually assign the new modified x to y
  


# Question 4. Assign the values 1, 23, 6, 2, 19, 7 to a vector:
  
  vector_question4 <- c(1, 23, 6, 2, 19, 7)


# Question 5. Run the code `“four” < “five”`. Paste the output 
# from R into a comment and explain why you think it provided 
# that result: [Text Answer]
  
  "four" < "five"
  #' [1] FALSE
  #' 
  #'#Well, these are character elements, so their value is actually represented by ASCII values. The 
  #'value of the words "four" and "five" are the sum of each ASCII value for every letter in the word/string
  #' In this case, the sum of the ASCII values for the letters "f", "o", "u", "r" is higher than the sum of
  #' the ASCII values for the letters "f", "i", "v", "e"



# Question 6. Write a for loop that loops through each element in
# the vector you created in your answer to Question 4 and prints
# each value to screen:
  
  for(i in vector_question4){
    print(i)
  }
  
  
  #' The for loop iterates through every value inside of the vector and represents the value with the
  #' "i" variable, and then this "i" variable is used in the print function in order to print each value
  #' onto my screen


# Question 7. Assign the value 3 to a variable "x" and write
# a conditional statement that tests whether x is less than 5.  
# If it is, print "Yay!" to screen:
  
  x <- 3
  if(x < 5){
    print("Yay!")
  }
  
  #' The conditional statement I wrote is checking to see if x is less than 5. It will only enter
  #' the print statement if the conditional statement is true; otherwise, it will not do anything.


# Question 8. Download the "wine_enthusiast_rankings.csv" file from
# the "data" directory in the "Files" area of the course Canvas
# website and then write code to load it into a variable called "wine_revs":
  
  wine_revs = read.csv("../data/wine_enthusiast_rankings.csv")



# Question 9.  Write code to determine the class of the "wine_revs"
# data object you created in Question 8 above:
  
  class(wine_revs)


# Question 10. Write code that returns the column/variable
# names of the "wine_revs" object
  
  colnames(wine_revs)
  #Alternate: names(wine_revs)
  
  #'I used the colnames() function, which returns the column names of the object that is plugged into it
  #'Another option I saw that could be used/works is names()


# Question 11. Write code to load all observations from the
# "price" column/variable of the "wine_revs" object into
# a vector called "wine_prices":
  
  wine_prices <- wine_revs$price
  
  #' Observations refers to rows, so this basically means I just need to load the entire "price" column into
  #' the wine_prices vector in order get all the values for price from every row


# Question 12. Subset the "wine_revs" object to create a new 
# data.frame named "wine_revs_truncated" that contains all 
# observations for only the numeric ID, Points, Price, Variety, 
# and Winery columns/variables in "wine_revs": 
  
  wine_revs_truncated <- wine_revs[, c("X", "points", "price", "variety", "winery")]


# Question 13. Save the "wine_revs_truncated" that you created 
# in Question 12 to your course working  directory 
# as an RDS file named "wine_revs_truncated.rds":
  
  saveRDS(wine_revs_truncated, file = "../wine_revs_truncated.rds")


# Question 14. Below is an R function that receives a single 
# argument (an integer) and returns the square root of that
# argument.  Write code (below the function) that calls the 
# function sending it the value 144 as its argument and assigns
# the returned result to a variable "z".  Note:  Be sure to run
# code of the function to load it into your environment before
# you try to call it in your answer or you won't be able to test
# your answer.

  getSqrt <- function(argument_1) {
    retval <- sqrt(argument_1) 
    return(retval)
  }
  
  z <- getSqrt(144)


# Question 15. Write code that you would use to install the "fortunes"
# package onto your local machine and then load it into the working
# R environment:
  
  install.packages("fortunes")
  library(fortunes)


# Question 16. Why doesn't R automatically load every installed package when 
# it starts: [Text Answer]

  #R doesnt automatically load every installed package when started because
  #this would be a very slow initialization process that is unnecessary if 
  #the package is not needed for the session. It would also take up
  #unnecessary memory. Therefore, it is more efficient to manually load the
  #packages when needed and provide users with more control over their workspace,
  #so thats why R functions in this way instead.


# Question 17. What command(s) create a repository and put that
# directory under git control:
  
  #'cd <path for project_location>
  #'  You'd do this first if you're not already in the directory that you want to make into a repository
  #'  It's important to be inside of the directory when you run the following commands
  #'  
  #'git init


# Question 18. List an advantage and a disadvantage for each of the
# following data file formats: [Text Answer]
#   
  #a. RDS files
      #Advantage: Since RDS files are binary files (written in 0s and 1s) specifically
        #formatted for R, they are extremely fast to read and write to. Furthermore, they
        #do a good job at conserving all data types and don't easily mess up data.
      #Disadvantage: RDS files can only be read in R, so they are not always the most ideal
        #file for collaboration/to share with others.
    
    #  b. CSV files
        #Advantage: CSV files are text-based, which makes them easily readable by
          #most software, such as Python, R and Excel. In other words, they are highly
          #portable and can be easily shared with other people.
        #Disadvantage: Since CSV files are usually larger than RDS files, they take
          #more time to read and write to, compared to binary formats. They may also
          #have some difficulty in conserving data types, which could lead to some errors
          #when reloading the data.


# Question 19. Discuss what statisticians mean when they talk about
# finding the "center" of a data set: [Text Answer]
  
  #' I believe the reference to finding the "center" of a data set refers to utilizing measures of central
  #' tendency, aka measurements that can help to describe the middle values in a set of data.
  #' i.e mean, median, and mode.
  #' The mean is the average, aka the sum of all the values in the data set which are then divided by the
  #' number of values there are
  #' The median is the very middle value of the data, when the values are organized from smallest to biggest
  #' If there is an even number of values, then the median would be the average of the two middle values.
  #' The mode is the most common/frequent number in the data set.
  #' Utilizing all of these measures helps analyze the data to see if there's any outliers
  #' between any values and ultimately help guide statisticians towards what the "center" of a data set is
  #' by seeing the overall distribution of the data


# Question 20.  Explore the "wine_revs" data object that you created in 
# Question 8 above and calculate some summary statistics. Include in your 
# answer the code that you used to generate the statistics and outputs,
# a text explanation of the statistics you generated, and an interpretation
# of what those statistics mean.
#
# [Code Answer]
  
  summary(wine_revs)
  
  column_classes <- sapply(wine_revs, class) #I did this in order to see the class for the numerical/int columns
  print(column_classes)
  
  unique(wine_revs$country)     #etc, you could do this for all the categorical columns to see the unique
  unique(wine_revs$taster_name) #values in each column, which is helpful when you have a really large data set
                                #like this one and you want to make your search for certain things faster
  sort(table(wine_revs$price)) # You could use this to find the mode for int/numerical since summary() doesnt provide it
  
  table(wine_revs$country)    #shows the occurrence per unique observation
  table(wine_revs$taster_name)
  

#
# [Text Answer]
  
  #X                 country          description        designation            points           price        
  #Min.   :     0   Length:129971      Length:129971      Length:129971      Min.   : 80.00   Min.   :   4.00  
  #1st Qu.: 32493   Class :character   Class :character   Class :character   1st Qu.: 86.00   1st Qu.:  17.00  
  #Median : 64985   Mode  :character   Mode  :character   Mode  :character   Median : 88.00   Median :  25.00  
  #Mean   : 64985                                                            Mean   : 88.45   Mean   :  35.36  
  #3rd Qu.: 97478                                                            3rd Qu.: 91.00   3rd Qu.:  42.00  
  #Max.   :129970                                                            Max.   :100.00   Max.   :3300.00  
  #NA's   :8996     
  #province           region_1           region_2           taster_name        taster_twitter_handle
  #Length:129971      Length:129971      Length:129971      Length:129971      Length:129971        
  #Class :character   Class :character   Class :character   Class :character   Class :character     
  #Mode  :character   Mode  :character   Mode  :character   Mode  :character   Mode  :character     
                                                                                              
  #title              variety            winery         
  #Length:129971      Length:129971      Length:129971     
  #Class :character   Class :character   Class :character  
  #Mode  :character   Mode  :character   Mode  :character  
  
  #'The output shown above is what is returned when you run the code summary(wine_revs)
  #'
  #'In general, when the column's observations are numerical or int values, the summary() function provides
  #'output for some of the measures of central tendency i.e the median and mean, but not the mode (the 
  #'Mode in this case is not the mode in terms of representing the most common value, but it refers
  #'to the columns basic data type instead. In this case, when Mode: character, this means that the data should
  #'be interpreted as/is text data.)
  #'Summary() also provides the lowest and the highest value in the observations for int/numerical
  #'columns, which helps give an idea of the range of the numerical values. In this case, it helps me see that
  #'for points, all the wines in this data set had a relatively high score (since the minimum is 80), which
  #'helps me figure out that this data set must be a collection of some of the best wine recommendations/reviews.
  #'
  #'Furthermore, the summary() function provides a Length output, which basically means how many observations
  #'there are in the column, so this helps you learn how much data you're working with.
  #'
  #'
  #' X                country             description           designation               points 
  # "integer"        "character"           "character"           "character"             "integer" 
  # price              province              region_1              region_2           taster_name 
  # "numeric"         "character"           "character"           "character"           "character" 
  # taster_twitter_handle     title               variety                winery 
  # "character"             "character"           "character"           "character" 
  
  #' This is what prints when I run column_classes <- sapply(wine_revs, class) and  print(column_classes)
  #' which I did because I wanted to see what class types were X, points, and price, since summary() didn't
  #' explicitly provide this information for those columns. I figured I'd use it to double check the class type
  #' for the other columns as well.
  #' 
  #' Lastly, since summary() doesn't really provide a lot of meaningful information for categorical columns,
  #' I figured I'd utilize the unique() function. Example: unique(wine_revs$country), or unique(wine_revs$taster_name)
  #' This helps me quickly find the list of the unique observations in these columns instead of having to 
  #' scan through thousands of observations.
  #' 
  #' table(wine_revs$country)    #shows the occurrence per unique observation
  #' This command would help show me not only the unique values in a column, but also the amount of times a 
  #' this observation appears in the column. 
  #' Using sort(table(wine_revs$country)) could help me find the mode of a column
                                                         



