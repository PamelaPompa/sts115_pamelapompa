# Directions:

# This file contains homework questions for the lecture on working with files
# and data exploration. Questions appear as comments in the file. 

# Please see the Grading Criteria Canvas Page for specific guidance on what
# we expect from you regarding assignment responses.

# Once you have completed the assignment, follow the Submission Instructions 
# on Canvas Pages section to add, commit, and push this to your GitHub repository. 

# Some questions have multiple parts - make sure to read carefully and
# answer all of them. The majority of points lost in homework come from
# careless skipping over question parts.  

###############################################################################

# 1. Write out the file extension and explain what it means for the following
#    files: [comprehension]
#
#       a. `myscript.py`
#
#       b. `/home/arthur/images/selfie.jpg`
#
#       c. `~/Documents/data.csv`

            #File extensions are the suffixes at the end of file names

            #A) The file extension is .py, which is a Python script file.
            #This means that the file contains Python code that requires a Python
            #interpreter to help execute the code
        
            #B) The file extension is .jpg, which means that this file is a
            #JPEG image file. In other words, the file contains a digital image
            #that you can view if the file is opened.
        
            #C) The file extension is .csv, which stands for Comma-Separated Values.
            #Basically, these type of files store tabular data, consisting of numbers
            #and text in plain text, and each line is a data record and the records are
            #separated by commas.


# 2. Which command line utility can be used to determine the type of a file? 
# [code completion]
        
        #file "<insert_file>"
          
        #You use the "file" command followed by the name of the file you want to
        #check inside of quotation marks, in order to determine what type of file it is.


# 3. Why is it a bad idea to explicitly call the `setwd` function within an R
#    script? [comprehension]
        
        #Using the setwd function in your R script is generally a bad idea because
        #if the file were a collaborative file and someone else has to run the script, 
        #the setwd function would cause an error on their end since their files may not
        #be set up the same way that your files are. This would make it hard for others
        #to run your script.
        
        
# 4. List one advantage and one disadvantage for each of these formats:
# [comprehension]
#   
#     a. RDS files
        #Advantage: Since RDS files are binary files (written in 0s and 1s) specifically
          #formatted for R, they are extemely fast to read and write to. Furthermore, they
          #do a good job at conserving all data types and dont easily mess up data.
        #Disadvantage: RDS files can only be read in R, so they are not always the most ideal
        #file for collaboration/to share with others.
#
#     b. CSV files
        #Advantage: CSV files are text-based, which makes them easily readable by
          #most software, such as Python, R and Excel. In other words, they are highly
          #portable and can be easily shared with other people.
        #Disadvantage: Since CSV files are usually larger than RDS files, they take
        #more time to read and write to, compared to binary formats. They may also
        #have some difficulty in conserving data types, which could lead to some errors
        #when reloading the data.


# 5. Why doesn't R automatically load every installed package when it starts?
# [comprehension]
      #R doesnt automatically load every installed package when started because
      #this would be a very slow initialization process that is uneccesary if 
      #not all packages are necessary for every session. It would also take up
      #unnecessary memory. Therefore, it is more efficient to manually load the
      #packages when needed and provide users with more control over their worksapce,
      #so thats why R functions in this way instead.


# 6. Load the dogs data from the `dogs.rds` file provided in lecture.
#

      #dogs <- readRDS("../data/dogs.RDS") # this is how I load the file
      

#     a. How many missing values are in the `height` column? 
#       [code completion + comprehension]
      
          #There are 13 missing values in the height column
            
          #This is how I checked via a line of code (I still counted manually after to
          #check if its right):
          missing_values <- sum(is.na(dogs$height))
          
              #-The sum function adds the arguments together and its output
              #is the sum of its arguments. The is.na function returns a logical
              #vector full of TRUEs and FALSEs based on whether the values of the argument
              #is or isnt a NA value. I know that TRUE = 1, and FALSE = 0, so if you plug in the
              #is.na function into sum, the sum function will basically add up all the
              #TRUEs (the NA values) and the output tells me how many NAs are in the height column
            
#
#     b. Think of a strategy to check the number of missing values in every
#        column using no more than 3 lines of code. Hint: think about last
#        week's lecture. Explain your strategy in words. 
#       [code completion + comprehension]
            missing_values_in_columns <- sapply(dogs, function(x) sum(is.na(x)))
            print(missing_values_in_columns)
            
            #'sapply' is a function that takes every element of a data object and applies
            #them into another function. Its first argument is the data object that it will
            #be taking the elements from; in our case we will plug in the 'dogs' data frame.
            #The second argument is another function; this other function is the one that
            #sapply will be applying every element in the data object into.
            #In our case, each column of the data frame is the elements that sapply will be
            #applying into the 2nd function.
            
            #Therefore, we can utilize the other function in sapply to help us find the
            #missing values in every column. In this case I plugged in a combined function as
            #my 2nd argument --> sum(is.na(x)), which undergoes the same purpose it did in Part A.
            #The main difference in my application is that I couldnt directly write the columns
            #I wanted to check inside of the is.na function, like how I did with dogs$height. So
            #I had to find a way in which I could plug in every column into the is.na() function,
            #so that my sapply function can apply every column into sum(is.na(x)).
            
            #This is when I decided to utilize a lambda/anonymous function (A lamba function is a
            #temporary function thats meant to do a short-term use operation). The way it functions
            #is that sapply will plug in every column as x into function(x), and function(x) will
            #utilize x (the column at the time) to perform sum(is.na(x)). In that way, every column
            #can be plugged in to sum(is.na(x)). I had to do this method since technically
            #sum(is.na(x)) is not just one singular function but a conmbined one. If it were just
            #one function, I wouldve been able to just write the name of the function instead of
            #having to use a lamba function. 
            
            #Anyways, afterwards, I plugged in the output into the missing_values_in_columns
            #variable, and then printed it to see the result.

#
#     c. Which column has the most missing values? Try to solve this by
#        implementing your strategy from part b. If that doesn't work, you can
#        use the `summary` function to get the number of missing values in each
#        column as well as a lot of other information (we'll discuss this
#        function more next week).
#       [code completion + comprehension]
            
              #The weight column has the most missing values out of all the columns, at 86. 
              #I did use the method I mentioned in Part B and when I print out the
              #missing_values_in_columns variable I can compare the columns to see which one
              #had the highest missing values.
            
# 7. Use indexing to get the subset of the dogs data which only contains large
#    dogs that are good with kids (the category `high` in the `kids` column
#    means good with kids). [code completion + comprehension] 
            
      large_dogs_good_with_kids <- dogs[dogs$kids == "high" & dogs$size == "large" & is.na(dogs$kids) == FALSE & is.na(dogs$size) == FALSE,]
      print(large_dogs_good_with_kids)
      
        #The way I went about this problem is I knew that I needed to find a way to get the
        #rows that have both kids = high and size = large, while also ignoring the the rows that
        #had NA values for both those columns. That's why I made these all combined statements
        #using the & symbol, since it stands for "and", meaning only the rows that are TRUE for
        #all conditions will be added into the subset. The column section in the square brackets
        #is left blank since it doesn't matter which other columns are included in the subset as
        #long as the requirements for the size and kids column is met

# 8. With the dogs data:
#
#     a. Write the condition to test which dogs need daily grooming (the result
#        should be a logical vector). Does it contain missing values? 
#       [code completion + comprehension]
      
          needs_grooming <- dogs$grooming == "daily"
          print(needs_grooming)
          
           #The line I wrote checks the grooming column from the dogs data frame and returns a
           #logical vector consisting of the variables TRUE or FALSE depending on whether the dogs
           #do or don't need daily grooming (if the word "daily" was written, its TRUE).
           #Once I printed out the logical vector, I was able to see that there is indeed
           #missing values shown as NA.
     
#
#     b. Use the condition from part a to get the subset of all rows containing
#        dogs that need daily grooming. How many rows are there?
#       [code completion + comprehension]
      
            daily_grooming_dogs <- dogs[dogs$grooming == "daily",]
            print(daily_grooming_dogs)
            nrow(daily_grooming_dogs)
            
            #I used the same condition in Part A " dogs$grooming == "daily" " and did the same method
            #as I did in Question 7 but without removing the NAs (since I think Im not supposed to
            #in this section)
            #There are 83 rows including the NA values; I checked with the nrow() function by plugging
            #my subset data frame into it
  
#     c. Use the `table` function to compute the number of dogs in each
#        grooming category. You should see a different count than in part b for
#        daily grooming. What do you think is the reason for this difference?
#       [code completion + interpretation]
            dogs_grooming_category <- table(dogs$grooming)
            print(dogs_grooming_category)
            
            #There's a different amount of dogs under the daily category because the table
            #function is automatically removing/not including the NA values in this section
            #since NA values technically do not equal "daily"
#
#     d. Enclose the condition from part a in a call to the `which` function,
#        and then use it to get the subset of all rows containing dogs that
#        need daily grooming. Now how many rows are there? Does the number of
#        rows agree with the count in part c?
#       [code completion + comprehension]
            
            which_daily <- which(dogs$grooming == "daily")
            which_daily <- dogs[which_daily,]
            print(which_daily)
            nrow(which_daily)
        
            #There are 23 rows returned, and yes, this is the same number as the number
            #of rows returned in part c, since it specifically states *which* rows are equal
            #to 'daily' in grooming (so it excludes NA values)


# 9. Compute a table that shows the number of dogs in each grooming category
#    versus size. Does it seem like size is related to how often dogs need to
#    be groomed? Explain your reasoning. [code completion + interpretation]
            
            table_grooming_size <- table(dogs$grooming, dogs$size)
            print(table_grooming_size)
            
              #I don't think size is related to how often dogs need to be groomed
              #since regardless of what size the dogs are, the majority of them get
              #groomed weekly
              #As for explaining the code I did, I just used the table function that
              #required both the dogs grooming and dogs size columns


# 10. Compute the number of dogs in the `terrier` group in two different ways:
#
#     a. By making a table from the `group` column. 
#       [code completion + comprehension]
            
            table_terrier <- table(dogs$group == "terrier") #returns true and says how many are true
            print(table_terrier)
            
            #table_terrier <- table(dogs$group) could also work and in this case
            #the terrier group is specifically labeled for you to see how many are in this group
            #There's 28 terriers
#
#     b. By getting a subset of only terriers and counting the rows.
#       [code completion + comprehension]
            
            subset_terrier <- dogs[dogs$group == "terrier",]
            print(subset_terrier)
            nrow(subset_terrier) # I used this just to confirm but if you manually
                                #count out the rows then it does equal 28
#
#     c. Computing the table is simpler (in terms of code) and provides more
#        information. In spite of that, when would indexing (approach b) be more
#        useful? [comprehension + interpretation]
            
            #Indexing could be useful when you need to perform calculations with the terrier
            #group i.e find the mean for some values in the other columns, or if you want to
            #filter the dogs based on more conditions to get a more narrow/niche subgroup.
            #Other cases could be if you wanted to modify some values within the terrier group,
            #or if you just want to be visualize all the columns for the terrier rows


