############
# BEGINNING OF EXAM
# You have read the README file, pushed the exam files up to GitHub,
# and synced your repositories.

# Good job - move on to the next question!

############
# QUESTION 1 (5 points)
# The variable `events`, defined below, contains the dates for several
# important events in the 20th century. Write code to convert these dates 
# into R `Date` objects. Then, in a few sentences explain why using a 
# standardized date format is or isn't a good idea.

events = c("Fri August-15 in 1969", "Tue Jun-6 in 1944", "Sat Jan-1 in 2000")

# Code Answer:
library(stringr) #I need the stringr package in order to use the str_replace_all function
events_fixed <- str_replace_all(events, "(Fri|Tue|Sat) |in ", "") #I want to remove the words for the day of the week since its not needed, and the word in
events_fixed <- str_replace_all(events_fixed, "August", "Aug") #Im changing August to the abbreviated version, to match the other strings
dates <- as.Date(events_fixed, "%b-%d %Y")  # %b for abbreviated month name, %d for day, %Y for year

print(dates)
class(dates)

# Narrative Answer:

#Using a standardized date format is a good idea because it helps ensure consistency, which is important when
#the data will be collaborative or needed by other people.  This makes it easier to extract or analyze dates
#when needed, and it helps to reduce the likelihood of errors. By having the same format, 
#collaboration is ultimately improved since scripts become more accessible to everyone, especially since
#it saves time from having to do format conversions


############
# QUESTION 2 (15 points)
# 2.1. The variable `menu`, defined below, contains a string from a local
# restaurant's online menu. Use string processing to convert this string into a
# data frame with separate columns for 'item' and 'price'. Next, combine your
# data-frame with the data frame 'guads', below. This combined data frame should 
# have a populated column called 'restaurant' so it's clear which row came from 
# Mayas (the original 'menu' data) and which came from Taqueria Guadalajaras ('guads').

# Tip! Print the variable after you instantiate it and before you try to write 
# code to answer the rest of the question. This will help you to form a better 
# strategy for splitting the string. You can also use the Regex validator at 
# https://regex101.com/ to verify that your Regex works correctly before you 
# use it in your R code.

menu = "MAYAS
Street taco ......... 3.99
Crispy taco ........... 6.99
Potato taco .......... 4.99
Veggie burrito ........ 7.49
Regular ............. 13.99
Super ............... 15.99
Chimichanga ......... 14.00
Beans, rice & cheese .... 10.99"

guads = data.frame(
  type = c("Taco de camaron", "Taco de pescado", "Taco dorado","Veggie burrito", "Regular", "Super", "Super Giant", "Chimichanga", "Beans, rice & cheese"),
  price = c(3.99, 3.99, 4.29, 9.49, 8.99, 10.99, 20.99, 11.99, 5.99)
)


# Code Answer:

menu_lines <- str_split(menu, "\\n")[[1]] #splitting string into lines
maya_menu <- str_match(menu_lines[-1], "^(.*?)(?:\\.{2,})\\s(\\d+\\.\\d{2})")
maya_df <- data.frame(
  type = maya_menu[, 2], #extracting menu item name
  price = as.numeric(maya_menu[, 3]), #extracting the price from the string
  restaurant = "Mayas"
)

guads$restaurant <- "Taqueria Guadalajaras" #need to add restaurant column before I bind so that it matches the expected columns for both
combined_df <- rbind(maya_df, guads)
combined_df

# Narrative Answer:
#Im not sure what the narrative question is for this
 

# 2.2. Write code to generate a single data visualization to show the price by
# item per restaurant. In a few sentences, describe how your data visualization 
# may be easier to use than looking at the online menus when you and your friends 
# are deciding where to go for lunch.

# Code Answer:
library(ggplot2)
ggplot(data = combined_df, aes(x = type, y = price, fill = restaurant)) +
  geom_bar(stat = "identity", position = "dodge") + # 'dodge' creates side by side bars
  labs(
    title = "Menu Item Prices by Restaurant",
    x = "Menu Item",
    y = "Price (USD)",
    fill = "Restaurant"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) #rotating the x-axis labels for readability


# Narrative Answer:
#' My data viz is easier to look at because comparing stuff with lines is easy to understand since 
#' it feels more intuitive than having to compare numbers, so if you're in the mood for a specific food then
#' you look at the data viz, find the food you want, and compare the
#' two lines. It will be easy to see which one is cheaper, especially since the restaurants are also
#' categorized by color so the bars per restaurant are also easily differentiated. 


#############
# QUESTION 3 (15 points)
# Use the Cat Facts API documentation at 
# https://alexwohlbruck.github.io/cat-facts/docs/ to make a request to 
# the Cat Facts "facts" endpoint and retrieve 5 random facts about cats. 

# Note: you must properly construct the URL for your request by adding the 
# "endpoint" for your specific request as documented on the site to the 
# "base URL for all endpoints" which is also documented on the site.  
# All of the information that you need to construct a well-formed URL for your 
# request appears somewhere in the documentation, and you should be able to do 
# this using your knowledge of how URLs are constructed.

# Code Answer:
library(httr)
library(jsonlite)

cat_facts_url = "https://cat-fact.herokuapp.com/facts" #this the link with the cat facts, provided by the initial link given
cat_response = GET(cat_facts_url) #this line is to generate a response from the API to obtain the data
cat_facts <- content(cat_response, as = "text", encoding = "UTF-8") #this line will process the content of the API response, content() extracts the
                                                                    # body of the response and im parsing it as a text format with UTF-8 encoding
cat_facts <- fromJSON(cat_facts) #parses the text thats formatted in JSON into an R object
cat_facts <- cat_facts$text #Im doing this to only extract the text column from the object
print(cat_facts) #printing the facts


#############
# QUESTION 4 (20 points)
# Wikipedia has a table of female Nobel Laureates at: 
# https://en.wikipedia.org/wiki/List_of_female_Nobel_laureates

# Write code that scrapes the page to get a data frame with the 
# year, name, country, and category for each laureate. You DO NOT need to worry
# about cleaning up the text to remove footnotes, parenthetical notes, 
# dual countries, or dual categories for this question.


# Code Answer:
library('xml2')
female_nobel_link = 'https://en.wikipedia.org/wiki/List_of_female_Nobel_laureates' #read the link in
female_nobel = read_html(female_nobel_link) #process the html information

categories_h3 <- xml_find_all(female_nobel, "//h3") #the categories are under this path
category_ids <- xml_attr(categories_h3, "id") #extract the id under these h3 tags
print(category_ids) 
                  
#I know that this is related to finding the tags and finding out how to extract the specific information you want
#but I did not have time to go through all the tags, but what i wouldve done is get all the information by extracting
#the tags I needed, and then concatenating these informations to a vector and making the vectors columns to a data frame



######################################
# QUESTION 5 (20 points)
# The file `nobel_laureates_messy.rds` (included in the zip file you downloaded 
# that contains this exam file) contains a data frame with information about 
# female Nobel Laureates, scraped from Wikipedia. 

# 5.1. This new data frame is terribly messy. One issue is that while each row 
# corresponds to one laureate,  the `Laureate` column sometimes contains a 
# parenthetical note in addition to the laureate's name. Separate the name of 
# each laureate from these notes, so that the name is alone in the `Laureate` 
# column, and the note is stored in a new column called `Note`.

# Make sure there are no parentheses in the text in the `Note` column. For rows
# where there is no note, the value of the note should be `NA` or the empty 
# string `""` (either is acceptable, but don't use a mix of both).  This question 
# will require you to apply various skills that we learned in this course, 
# including manipulating the columns of a data frame and using regular expressions
# to identify substrings within a string.  

# Hint: The question asks you to apply computational operations across all 
# rows/observations in the data frame.  There are several ways to apply the same 
# function to all observations in R.  Before you begin coding, think about 
# how you will accomplish this iteration.  
                                                                                                        
# Code Answer:
library(stringr)

novel_rds <- readRDS("nobel_laureates_messy.rds")
novel_rds$Note <- str_match(novel_rds$Laureate, "\\(([^)]+)\\)")[,2] ##this extracts text inside parentheses and stores it in 'Note'
novel_rds$Laureate <- str_replace(novel_rds$Laureate, "\\s*\\(.*\\)", "") #removes the note from the name

# 5.2. What is something else you noticed about this data frame that should be
# cleaned before it is used in an analysis?

# Narrative Answer:
#Instead of "Physiology or Medicine" we can narrow it down to either physiology, or just medicine, for each person, to be more specific for our analysis
#Also fix the format of the country, i.e Mother Teresa's column says "India andYugoslavia" instead of 	
#"India and Yugoslavia"

##############
# QUESTION 6 (25 points)
# For this question you will need add the carData package to your environment.
# Next, run this code: 
library(carData)
demo <- carData::MplsDemo
# 6.1. In a paragraph, describe what 'demo' is about and define the variables 
# it contains. Include an explanation of how you determined your answers.

# Narrative Answer:
#I believe 'demo' refers to demographics. The 'neighborhood' column refers to a neighborhood/location,
#' and the 'population' column refers to the population of each neighborhood. The columns 'white', 'black,'
#' and 'foreignBorn', all provide information on the ratio of the race for the population of each neighborhood.
#' The 'hhIncome' seems like its providing the average household income of this population.
#'The 'poverty' column provides information on the ratio for how many people are considered to be in poverty, and the
#' 'collegeGrad' column states how many people from each neighborhood graduated college. I determined these answers
#' by thinking about what the title of the data is (demographics) and what kind of information I expect
#' to see in a demographics data frame

# 6.2. Investigate this dataset and provide a short answer to the questions below.

# a. How many rows and columns are in the data set?
# Narrative Answer: 
  #' There's 84 rows and 8 columns

# b. What are the names and classes of the columns in the data set?
# Narrative Answer:
#neighborhood   population        white        black  foreignBorn     hhIncome      poverty  collegeGrad 
#"character"    "numeric"    "numeric"    "numeric"    "numeric"    "numeric"    "numeric"    "numeric" 

# c. How many missing values are in each column?
# Narrative Answer: 
#zero

# d. How many missing values are in the data set in total?
# Narrative Answer: 
#zero

# Code Answer: Add any code here that you wrote to help you answer questions a-d above.
  #for question a:
  nrow(demo)
  ncol(demo)
  #for question b:
  column_classes <- sapply(demo, class) #apply the class function to every column in demo
  column_classes
  #for question c:
  NA_per_col <- sapply(demo, function(col) sum(is.na(col))) #apply the is.na function to every column and add them all together
  NA_per_col
  #for question D; there was no NA at all in any of the columns so theres none at all in general
    
# 6.3. Write code to help you identify any outliers in 'demo'. You can use 
# statistics or plotting to determine your answer. Return the index of any 
# outliers you discover.
# Code Answer
  
  IQR_outliers <- function(data, col) { #this function finds outliers via IQR
    Q1 <- quantile(data[[col]], 0.25, na.rm = TRUE)
    Q3 <- quantile(data[[col]], 0.75, na.rm = TRUE)
    IQR <- Q3 - Q1 #this is the interquartile range
    
    lower_bound <- Q1 - 1.5 * IQR #calculate first quantile
    upper_bound <- Q3 + 1.5 * IQR #calculate third quantile
    
    #find the indices of outliers
    outliers <- which(data[[col]] < lower_bound | data[[col]] > upper_bound)
    return(outliers)
  }
  
  summary(demo) #to see the quartiles
  outliers_population <- IQR_outliers(demo, "population")
  outliers_white <- IQR_outliers(demo, "white")
  outliers_black <- IQR_outliers(demo, "black")
  outliers_foreign <- IQR_outliers(demo, "foreignBorn")
  outliers_hhIncome <- IQR_outliers(demo, "hhIncome")
  outliers_poverty <- IQR_outliers(demo, "poverty")
  outliers_grad <- IQR_outliers(demo, "collegeGrad")
  
  print(outliers_population) #outliers index 79 and 81
  print(outliers_white) #no outliers
  print(outliers_black) #outliers index 2, 7, 29
  print(outliers_foreign) #outliers index 1, 2, 6, 44, 58, 60
  print(outliers_hhIncome) #no outliers
  print(outliers_poverty) #outliers index 60
  print(outliers_grad) #no outleirs


# 6.4. Write a question to investigate using this data. Then, write code to 
# generate a data visualization that helps address your question.

# Your research question:
#Is the average household income related the amount of college graduates in each neighborhood?


# Code Answer
library(ggplot2)
ggplot(data = demo, aes(x = hhIncome, y = collegeGrad)) +
  geom_point(color = "blue", size = 1, alpha = 0.7) +  #scatter points
  geom_smooth(method = "lm", color = "red", se = TRUE) + #adding a trend line, se = standard error, lm = linear model
  labs(
    title = "Relationship Between Household Income and College Graduates",
    x = "Average Household Income",
    y = "Proportion of College Graduates"
  ) +
  theme_minimal()

#My answer: yes, there seems to be a positive correlation


#############
# END OF EXAM
# Save and push your exam files to GitHub.
#############

# Congratulations, you're done! We wish you a restful spring break.