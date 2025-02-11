# Directions:

# This file contains homework questions for the lecture on data forensics
# and statistics. Questions appear as comments in the file. 

# The first four questions are narrative only, meaning you can just write an
# answer and do not need to write computer code. For other questions, please 
# see the Grading Criteria Canvas Page for specific guidance on what
# we expect from you regarding assignment responses.

# Once you have completed the assignment, follow the Submission Instructions 
# on Canvas Pages section to add, commit, and push this to your GitHub repository. 

# Some questions have multiple parts - make sure to read carefully and
# answer all of them. The majority of points lost in homework come from
# careless skipping over question parts.  

###############################################################################

craigslist <- read.csv("../data/cl_rentals.csv")

# 1. What is Deviation a measure of? [comprehension]

    #Deviation refers to how much a single value in a set of values strays from the average value of the
    #set. In other words, its like the distance a number is from the average.

# 2. What is Standard Deviation? [comprehension]

    #Standard deviation refers to the average distance of all the values from the average value of the
    #set. If the standard deviation is low, the numbers are close to the mean, but if its high,
    #the values are spread out further.


# 3. Load the Craigslist data and then compute:
#
#     a. The number of rows and columns. [code completion + comprehension]
        nrow(craigslist) #2987; this returns the number of rows in the data frame
        ncol(craigslist) #20; this returns the number of columns in the data frame
#
#     b. The names of the columns. [code completion + comprehension]
        column_names <- colnames(craigslist)
        print(column_names)
        
        #I had to Google this function because I didn't remember it, but it basically is pretty direct;
        #colnames returns the names of all the columns and I assigned this output to the column_names
        #variable and then printed it out
        
#     c. A structural summary of the data. [code completion + comprehension]
          str(craigslist)
        
          #str() shows the structure of the data frame, such as the types for each variable, as well as
          #provide the number of observations (rows), and the number of variables (columns), 
        
#
#     d. A statistical summary of the data. [code completion + comprehension]
        summary(craigslist)
        
        #summary() gives you basic stats about your data such as the min, max, mean, median, and 
        #quartiles for numerical columns. For the categorical columns, it shows the
        #the number of times each unique value appears in a categorical column.


# 4. The goal of this exercise is to compute the number of missing values in
#    every column of the Craigslist data.
#
#    a. Write a function called `count_na` that accepts a vector as input and
#       returns the number of missing values in the vector. Confirm that your
#       function works by testing it on a few vectors. 
#.      [code completion + comprehension]
        
        count_na <- function(x){
          count_na_var <- 0
          for( i in x){
            if(is.na(i)){
              count_na_var <- count_na_var + 1
            }
          }
          print(count_na_var)
        }
        
        summary(craigslist)
        count_na(craigslist$price)
        count_na(craigslist$sqft)
        count_na(craigslist$latitude)
        
        #It was right for all these vectors/columns; I used the summary function to confirm the number
        #of missing values in each vector
        
        #The way I wrote this function is that I checked every element in the vector, written as
        #"for(i in x)", x being the vector that was plugged in. I checked to see if the element is or
        #isn't an NA variable; if it is, then the counter variable I made increases by one.
        #After checking all the elements, the function prints out how many NA elements were in the vector
        
          
        
#    b. Test your function on the `pets` column from the Craigslist data. The
#       result should be 14. If you get an error or a different result, try
#       part a again.
#       [code completion + comprehension]
          count_na(craigslist$pets)
          
          #It worked
# 
#    c. Use an apply function to apply your function to all of the columns in
#       the Craigslist data set. Include the result in your answer.
#       [code completion + comprehension]
          
          missing_all_columns <- apply(craigslist, 2, function(x) count_na(x))
          print(missing_all_columns)

          
          #title      text      latitude    longitude     city    date_posted    date_updated   price 
          #0            0           3            3         952         0            1801         35 
          #deleted    sqft     bedrooms    bathrooms    pets      laundry      parking   craigslist 
          #0           347        10           10        14           0            0          0 
          #shp_place     shp_city    shp_state   shp_county 
          #24              650          3            3 
          
          #'apply' is a function that takes subsets of data (e.g., rows or columns) from a data object and applies
          # them into another function. Its first argument is the data object that it will
          # be taking the subsets from; in our case, we will plug in the 'craigslist' data frame.
          # The second argument specifies whether to apply the function to rows (1) or columns (2);
          #here, we'll use 2 to apply to columns.
          # The third argument is another function; this other function is the one that
          # 'apply' will be applying to each subset in the data object. In this case, we are applying
          # the function I made, count_na(x)
#
#    d. Which columns have 0 missing values? [comprehension]
          
          #title, text, date_posted, deleted, laundry, parking, craigslist


# 5. What time period does this data cover? Hint: convert the `date_posted`
#    column to an appropriate data type, then use the `range` function.
#    [code completion + comprehension]
          library("lubridate")
          craigslist$date_posted <- ymd_hms(craigslist$date_posted)
          range(craigslist$date_posted)
          
          #The data covers the time period January 30th, 2021, to March 4th, 2021
          #I convertd the date_posted column to a POSIXct class type using the lubridate library
          #and the ymd_hms function that was shown in class. Then I utilized the range function to
          #find the earliest date and the latest date.


          # 6. Compute the mean price for each pets category. Based on the means, are
#    apartments that allow pets typically more expensive? Explain, being
#    careful to point out any subtleties in the result.
#    [code completion + comprehension + interpretation]
          table(craigslist$pets)
          pets_both = (craigslist[craigslist$pets == 'both' & is.na(craigslist$pets) == FALSE & is.na(craigslist$price) == FALSE,])
          pets_cats = (craigslist[craigslist$pets == 'cats' & is.na(craigslist$pets) == FALSE & is.na(craigslist$price) == FALSE,])
          pets_dogs = (craigslist[craigslist$pets == 'dogs' & is.na(craigslist$pets) == FALSE & is.na(craigslist$price) == FALSE,])
          pets_none = (craigslist[craigslist$pets == 'none' & is.na(craigslist$pets) == FALSE & is.na(craigslist$price) == FALSE,])
          mean_pets <- c(mean(pets_both$price), mean(pets_cats$price), mean(pets_dogs$price), mean(pets_none$price))
          print(mean_pets)
          
          #The result I got for both, cats, dogs, and none is: 1771.407 1531.630 1828.742 1740.128, respectively
          #I would say that it's hard to give an accurate answer about whether an apartment that allows
          #pets/both types is more expensive than one that doesn't, because the amount of elements we
          #have in the categories are not close to each other, i.e both has 2511 elements while
          #none has 385 elements; both has almost 7x the elements that none has. I think if the amount of elements
          #was proportional among the 4 different categories, then we'd be able to provide a reasonable answer
          
          #As for explaining the code I did, first I used the table function to see what categories 
          #we had under the pets column. Then, I made the respective subsets for every category, and
          #I made sure there were no NA values for the pets or price columns, so that only the columns
          #that had valid information for both were considered, so that the mean calculation didn't return
          #an NA value. Then I put the mean calculations into a vector so that I could compare them side by side.
          


# 7. The `sort` function sorts the elements of a vector. For instance, try
#    running this code:
#
    x = c(4, 5, 1)
    sort(x)
#    
#    Another way to sort vectors is by using the `order` function. The order
#    function returns the indices for the sorted values rather than the values
#    themselves:
#
    x = c(4, 5, 1)
    order(x)
#
#    These can be used to sort the vector by subsetting:
#
    x[order(x)]
#    
#    The key advantage of `order` over `sort` is that it can also be used to
#    sort one vector based on another, as long as the two vectors have the same
#    length.
#    
#    Create two vectors with the same length, and use one to sort the elements
#    of the other. Explain how it (should) work.
#    [code completion + comprehension]
    
    y <- c(6, 3, 1, 66, 324, 77, 2)
    z <- c("Cheese", "Cake", "Cookie", "Cheesecake", "Pie", "Brownie", "Chocolate")
    z[order(y)]
        #this returns "Cookie" "Chocolate"  "Cake"  "Cheese" "Cheesecake" "Brownie"  "Pie"  
    
    #order(y): this function returns the indices that would sort the vector y in ascending order.
    #for y, the sorted indices are: 3 7 2 1 4 5 6.
    #z[order(y)]: this line uses the sorted indices to reorder z based on the sorted order of y.
  

# 8. Use the `order` function to sort the rows of the Craigslist data set
#     based on the `sqft` column. [code completion + comprehension]
    craigslist <- craigslist[!is.na(craigslist$sqft), ]
    craigslist <- craigslist[order(craigslist$sqft),]
    
      #The first line modifies the craigslist data frame to remove NA values from the sqft column
      #The second line reorders the craigslist data frame rows based on the reordering of the
      #sqft column
#
#     a. Compute a data frame that contains the city, square footage, and price
#        for the 5 largest apartments. [code completion + comprehension]
    
        nrows <- nrow(craigslist) # I find the number of rows in the data frame
        top_5_largest <- craigslist[(nrows-4):nrows, ] # I make a subset of the last 5 rows (the 5 largest)
        largest_apartments <- top_5_largest[, c("city", "sqft", "price")]
          #I make the subset even smaller reducing the columns to just be the city, sqft, and the price
        print(largest_apartments)
        
#
#     b. Do you think any of the 5 square footage values are outliers? Explain
#        your reasoning. [interpretation]
        
          mean(largest_apartments$sqft)
          #I think the very largest place is an outlier because it skyrockets from the first 3
          #values, which are close to 2.2k sqft, to almost 89k. It's deviation is massive, and I think
          #its the value that significantly contributes to the avg being 20.8k for the sqft mean
          #The 2nd biggest is not as exaggerated as the first, but, it is still a noticeable outlier
          #since it goes from the avg of 2.2k~ for the first 3 to 8k
#
#     c. Do you think any of the 5 square footage values are erroneous
#        (incorrect in the data)? [interpretation]
          
          #I think the place with the 88900 square footage must be a mistake because A) the size of this
          #is massive (like even bigger than a football field). And then, the price is so low ($1370), while
          #other places have higher prices despite having less sqft. I am also suspsicious of the 2nd highest
          #because its sqft is 8190 but its price is also low ($1995), yet the prices of the other 3 highest
          #are minimum $2.6k and go up to $4k. I'd assume that the 88900 sqft place should've been 889 and the
          #8190 sqft place should've been 819, since this aligns more realisticallY with the price ranges
          #of the other apartments around 800 sqft.


