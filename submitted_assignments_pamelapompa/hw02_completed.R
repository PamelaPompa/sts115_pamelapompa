# 1. Interview 5 people from outside of STS115 and add their data to the “my_data” data
frame from class to create a new data frame called “our_data”. You will use this for the
subsequent questions. 

  1) new_row <- data.frame(response = "Computer Science and Engineering", major = "ECS",
                study = "Shields Library", location = "Tim's Hawaiian BBQ", pet =
                "Cats rule, dogs drool", distance.mi = "9.7", time.min = "15")
  2) my_data <- rbind(my_data, new_row)
    A) repeat these steps for the 5 people
  3) our_data <- my_data
  
  #What I did was create a new data frame called new_row and I wrote down the answers for every
  #question, and then I binded this new_row data frame to our existing data frame. Afterwards I
  #named/created the our_data frame by copying the my_data into it.

# 2. Come up with a yes/no or true/false question you’d have liked the survey to have
asked. Make up these data for every subject in the survey, then create it as a logical
vector and add it to the data frame.

  1) set.seed(123)
  2) is_awesome <- sample(c(TRUE, FALSE), 71, replace = TRUE)
  3) our_data$is_awesome <- is_awesome
  
  #To be honest I didnt want to manually write true or false for every subject so I searched up
  #how to randomly generate True/False answers and then I just added those answers to the data frame
  #by adding is_awesome as a new column (with the $ symbol)

# 3. Use a single function to return the class of each column in the data frame.
  
  sapply(our_data, class)
  
  #I had to search up this command/function but it makes sense to me. 
  
# 4. Look up how to use the function `max`. Use it to calculate the longest commute
distance and travel time.

  max(our_data$distance.mi)
  max(our_data$time.min, na.rm = TRUE)
  
  #I searched up how to get an answer that isnt NA because I guess someone didnt want to fill that
  # question out and I wasnt getting an actual value since NA is considered the highest value.
  #So the na.rm = TRUE part basically ignores the NA when looking for the max value

# 5. Calculate travel speed across subjects as miles per minute. Assign this to a new
vector `mi.per.min` and add it to the data frame.

  PREP: our_data$distance.mi <- as.numeric(as.character(our_data$distance.mi))
  our_data$time.min <- as.integer(as.character(our_data$time.min))

  1) mi.per.min <- (our_data$distance.mi / our_data$time.min) * 60
  2) our_data$mi.per.min <- mi.per.min
  
  # I had to convert these columns to numbers because the division didnt work at first since they
  # were considered character classes. I did have to search up this command. As for doing the
  #calculations, I remember we went over this in lecture and as long as each vector/column has
  #the same amount of elements it will give you a corresponding answer/output for each row
  #The $ creates a new column

# 6. Use a function to return the total number of elements in mi.per.min.
  
  length(mi.per.min)
  
  #I also had to search up this command but its actually very straightforward and easy to remember
  
# 7. Index/subset the vector `major` to get a new vector that contains the 3rd, 1st, and
9th elements (in that order).

  new_vector_major <- our_data$major[c(3, 1, 9)]
  
  #I had to search this up because I forgot how to do it but now I remember that the "c" stands
  # for "combine" or "concatenate" and that makes sense. As for the indexing part that seems pretty
  # straightforward to me
  
# 8. R’s `[` indexing operator accepts several different types of indexes, not only positive
whole numbers. For example, the operator accepts negative numbers as indexes. Using
the vector `places`, try out three to five different negative indexes. Based on the results,
what do you think the [ operator does with negative indexes?
                          
  > vector_location <- our_data$location[c(-10)]
  > vector_location <- our_data$location[c(-3, -6, -10, -4)]
  > vector_location <- our_data$location[c(-3, -6, -10, -4, -45, -27)]
  
  #The [ operator provides a vector that contains/copies every element from the original and just
  #removes the element at the respective positive index for a negative index provided i.e if you
  # say -1 it will remove the first index and return a vector with all the other elements, or if you
  # give it the indexes -3, -6, -10, -4, it will return a vector with the other elements with indexes
  #3, 6, 10, and 4 removed
                          
# 9. Consider the R code `c(3, 3.1, “4”,-1, TRUE)

a. WITHOUT running the code, what data
type you think the result will have and why?
  
  #I would assume that it would default to a character class type because it sounds like it would
  #be easy to just put these values into quotation marks and represent them with text rather than try
  #to match them/decipher them in other values
                          
b. Now run the code to check whether your guess was correct. If it was not correct, explain what
the actual data type is and why. If your guess was correct, write a new, different line of code
that yields the same resulting data type.

    c(-1.6, FALSE, TRUE, "Hello", 78.9, -34.2)

    # I am a Computer Science major so I already have some knowledge on implicit conversion, but
    #yeah I believe that a character class type has a higher power in the conversion hierarchy so
    # as long as you include one character, the rest of the elements will be converted to characters too


# 10. Run the code `“four” < “five”`.
Paste the output from R into a comment and explain why you think it provided that result.

  > "four" < "five"
  [1] FALSE

  #Well, these are character elements, so their value is actually represented by ASCII values for
  # every letter in the character string instead of the numerical representation 4 and 5.
  # four technically has a higher ASCII value than five does, due to the
  # 'o' and the 'u' putting it ahead


# 11. There are several major mistakes in the data entered in class.
  a. Describe in complete sentences what at least 2 of the errors are. Make some guesses as to
     how those errors may have happened, and how they might affect analyses and/or re-use of these data.
     
     # An error I encountered was that there was an NA value for the time.min variable in row 20. I
     #assume this happened because someone didn't provide an answer when answering the questions, so
     # this section was left empty. It caused an "error" when I was trying to calculate the max for time.min
     #Another error I found was that time.min and distance.mi were considered character data types
     #instead of numerical data types. I assume this happened when I copied my_data into our_data;
     # the implicit conversion probably converted all the column variables into character data types.
     # This caused an "error" when I was trying to calculate mi.per.min
     
     #Errors noted in class: ECS and computer science; this isnt direct
     #our_data[4,1:2] error --> Cognitive Science and ECS; this isnt the right major description
     #our_data[53,1:2] --> Philosophy & Mathematics   PHI, would it be possible to make 2 major columns?
     
     
  b. Pretend the data frame was too big for you to view it manually. List specific
    function calls you could use in R to help you find these mistakes programmatically
  
      head(our_data)
      tail(our_data)
      nrow(our_data)
      ncol(our_data)
      
      #these show snippets of the data set at the time so you can see a few instead of the entire
      # massive data set being shown clunkily
      
      
  