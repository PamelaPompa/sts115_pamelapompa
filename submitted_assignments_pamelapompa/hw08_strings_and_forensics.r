# Directions:

# This file contains homework questions for the lecture on data visualization.
# Questions appear as comments in the file. 

# Please see the Grading Criteria Canvas Page for specific guidance on what
# we expect from you regarding assignment responses.

# Once you have completed the assignment, follow the Submission Instructions 
# on Canvas Pages section to add, commit, and push this to your GitHub repository. 

# Some questions have multiple parts - make sure to read carefully and
# answer all of them. The majority of points lost in homework come from
# careless skipping over question parts.  

###############################################################################


# Write a R code snippet that uses regular expressions to find all occurrences of 
# dates in the string variable text that are in the format "dd/mm/yyyy" and replace 
# them with the format "yyyy-mm-dd". The text variable contains multiple dates in 
# the "dd/mm/yyyy" format interspersed with other text. For example, if text is 
# "The event was held on 23/04/2021 and the next event will be on 05/10/2022.", 
# the output should be "The event was held on 2021-04-23 and the next 
# event will be on 2022-10-05.".
#
# Ensure your code dynamically handles the text variable, meaning it should work 
# for any string input following the mentioned pattern. Use relevant functions from 
# the stringr package, any other package, or base R for your solution. 
# [Code completion + comprehension]

  library(stringr)
  wrong_date_format <- "The event was held on 23/04/2021 and the next event will be on 05/10/2022."
  #im using this text variable as a test to see if my code works
  
  #im using str_replace_all to find all occurrences of strings written in the wrong date format,
  #and to replace them with the right date format
  fixed_date_format <- str_replace_all( wrong_date_format,
    "(\\d{2})/(\\d{2})/(\\d{4})", #pattern to match "dd/mm/yyyy"
    "\\3-\\2-\\1"                    #rearranging into "yyyy-mm-dd"
  )
  
  # The \\d{2} refers to extracting two numbers (expressed as text) that fit this format (the days),
  # then we extract the next two numbers (the months), and finally, we extract the next four numbers (the year).
  # The "\\d" specifically tells the program to look for any digit (0–9). The {2} part means we want exactly two digits,
  # which corresponds to the day and month in the "dd/mm/yyyy" format, while {4} means we want four digits for the year.
  # Without \\d, the program wouldn't know to specifically match digits. It might instead match other characters or fail
  # to identify the correct portions of the text.
  
  # The extraction sequences are followed by "/" to mimic how the date is originally formatted (d/m/y), and
  # the new format expresses the extracted sequences with hyphens to match the desired format. Also,
  # the sequences are expressed as 3, 2, 1 to indicate that we want the year first, the month next, and the day last.
  
  print(fixed_date_format) #checking to see if it works


# Write an R code snippet that assigns the string "I am here.  Am I alive" to
# a variable "x" and uses an Escape Sequence to put a newline between the two
# sentences. [Code completion + comprehension]

  x <- "I am here. \nAm I alive"
  cat(x)
  message(x)

  #'I assigned the given sentence to the x variable, and the way I utilized a Escape Sequence is by
  #'writing a "\" followed by a "n" which stands for the new line action. The "\" in a string is meant to escape
  #'the normal behavior of a string, signaling that the character following it is a special command rather than
  #'part of the text itself. After this special command is done, you return back to the text. 
  #'Afterwards, to check that the Escape Sequence works as expected, I have two commands, cat(x) and message(x)
  #'in order to double check that the new line shows up.
  #'since cat(x) will concatenate everything to work as expected and message(x) prints out the message, also
  #'registering the \n Escape Sequence written


# Write an R code snippet that assigns the following string to the variable "y:"
#
# She said, "Hi!"
# [Code completion + comprehension]

  y <- 'She said, "Hi!"'
  
  cat(y)
  message(y)

  
  #'I wasn't sure if the question wanted the variable name to be y, or "y:", but the cat command would not work when
  #'I tried to do cat("y:") or cat(y:), so I figured the semicolon in the question was meant to be outside of the 
  #'quotation marks, so I had the variable name simply be y
  #'Anyways, in order to differentiate the quotation marks that are part of the text, I had the string be marked
  #'with the single quotation symbol (') instead of the double ("). That way, when the text includes the Double
  #'Quotation marks, it knows not to end the actual text yet, since that would need a single quotation symbol to
  #'end it. I used the same functions as the prior question to see if the message prints as expected, and it does



# [TEXT ANSWER] Explain what a Text Encoding is:
# [Comprehension]

  #'Text encoding refers to how a computer stores text. Specifically, an encoding is a system for mapping
  #'characters to numbers. There are various types such as ASCII, UTF-8 or UTF-16. In general, a character
  #'will map to a specific number. For example, in ASCII, the character 'a' maps to the number 97. (This info
  #'is from the course reader)


# Write an R code snippet that creates a vector of all containing the words in the string, 
# "He wanted to say hello but was afraid".  Then use the stringr library to locate any 
# occurrences of the string "hello" in your vector.
# [Code completion + interpretation]

  string <- "He wanted to say hello but was afraid."
  #This is the string containing the given text from the prompt
  
  string_vector <- str_split(string, " ")[[1]]
  #this function will split the string by the spaces in the sentence, and it provides a vector with every word
  #as an element
  #the [[1]] is needed because str_split() always returns a list, even when splitting a single string,
  #in order to handle cases where multiple strings may be input. Since the result for each input is stored as
  #a separate list element, we use [[1]] to extract the first (and only) element when dealing with a single string
  
  str_detect(string_vector, 'hello') #returns T/F for every element, returns TRUE if the 
                                     #string you want is found, in this case the 5th element is TRUE
  str_view(string_vector, 'hello') #tells you what index 'hello' is at (in index 5)
  #either of these could work
  


# Section "15.7 Corpus Analytics" of the reader contains a tutorial on performing
# corpus analytics on a Document Term Matrix of 19th Century novels.  A Document Term
# Matrix is a matrix that contains information about the number of times that a work 
# appears in each text in a corpus.  In class, we calculated the word frequencies for
# the novel _Wuthering Heights_.  There "data" folder in the Files area of Canvas for 
# this course contains a file names dtm.rds which holds this type of count information
# for every normalized text in the collection of novels we worked with in class. 
# 
#     First, download that file to your course working directory.   

#     Then, recreate a working version of the code in section 15.8 of the reader below.
#     Note that before you can use the code in that section you will need to read 
#     dtm.rds file into the dtm variable so that the data in the DTM is available to
#     the rest of the code.
# [Code completion + interpretation]
  
  dtm <- readRDS("../data/dtm.rds")








