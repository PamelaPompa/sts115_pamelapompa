print("Hello Elise")
print(mtcars) #good for complicated data structures

name = "Colton"
message("Hello Elise")
message("Hello ", name)
message("Hello\nElise") #works for \n
print("Hello\nElise") #doesnt interpret \n

warning('Warn ', name)
stop('Error! ', name)

message(mtcars) #unreadable, missing row names --> message is better for text/messages

cat('Hello', name)
cat(1:5, sep = ', ')
cat('Hello', name, file = 'log.txt', fill=TRUE)
cat('How is your data cleaning going?',
  file = 'log.txt',
  append=TRUE,
  fill=TRUE)

cat('Quoth the raven\'s friend "Nevermore".')
cat("The path to my home folder is C:\\users\\home")
cat(r"(The path to my home folder is C:\users\home.)") #allows you to skip having to escape things

x = read.csv('my_data.csv', fileEncoding = 'Latin1') #File encoding could be ASCII, etc

cat("\U61")
cat("\U1F600")

Sys.setlocale(locale = 'en_US')

#Colton's Section

library(stringr)
?'stringr-data'
length(sentences)
sentences[1:5]

toppings <- c('apple', 'banana', 'pear', 'pineapple')
grepl(pattern = 'a', x = toppings) #checks if a is in each element of the vector, returns T/F
                                  #the l in grepl is for logic vector (T/F)
str_detect(toppings, 'a') #also returns T/F
str_view(toppings, 'a') #shows you where the a is

viz <- str_view(toppings, 'a')
viz

grep(pattern = 'a', x = toppings) #tells you which element has the a (i.e 1, 2, 3, 4)
str_which(toppings, 'a') #tells you which element has the a

loc <- gregexpr(pattern = 'a', text = toppings, fixed = T)
loc
sapply(loc, function(x) length(attr(x, "match.length"))) #counting how many times there's an 'a'
viz

str_count(toppings, 'a') #counting how many times there's an 'a'

str(gregexec(pattern = 'a', text = toppings))
str_locate(toppings, 'a') #tells you where it finds the 'a'
str_locate_all(toppings, 'a') #tells you where it finds all the 'a's per element
viz

fruit_smoothie <- c(
  "apples and oranges and pears and bananas",
  "pineapples and mangoes and guava"
)

str_split(fruit_smoothie, 'and') #removed the and

str_view(fruit_smoothie, 'and') #highlights the ands in the strings

str_split(fruit_smoothie, ' and ')[1] #only split for the first element/list in the vector

str_split_fixed(fruit_smoothie, ' and ', 3) #split the lists into elements of 3 based on the ands it finds
str_split_fixed(fruit_smoothie, ' and ', 2) #split the lists into elements of 3 based on the first and it finds

dates <- as.Date(c('31-03-1990', '29-12-2093', '03-07-2043'), 
                 "%d-%m-%Y")
class(dates) #defined as a Date

dates <- as.Date(c('31Mar1990', '29Dec2093', '03Jul2043'), 
                 "%d%b%Y") #%b is the abbreviated month
dates
class(dates)

str_split_fixed(dates, "-", 3)#extracts every section of the date
str_split_fixed(dates, "-", 3)[,1] #extracts the year of every list/date

fruit_smoothie
length(sentences)
str_replace(fruit_smoothie, ' and ', ', ') #only replaced the first 'and'
str_replace_all(fruit_smoothie, ' and ', ', ') 

str_view(fruit_smoothie, '^(.*( and ))')
str_view(fruit_smoothie, '^(.*?( and ))')

x = 'dog'
str_view(x, 'd.g') #returns dog
str_view(x, '.') #found every character
str_view(x, '^.') #returns first character
str_view(x, '.$') #returns last character

x = c('dog', 'ding', 'dug', 'dig', 'dim', 'dip', 'dung')
str_view(x, 'd.g') #returns everything with d(any character)g
str_view(x, '.') #found every character
str_view(x, '^.') #returns first character
str_view(x, '.$') #returns last character
str_view(x, 'd..g') #returns everything with d(any character)(any character)g
str_view(x, 'd.+g') #returns d(any mix of characters in between d and g)g
str_view(x, '[g-p]$') #returns the end??
str_view(x, '[gp]$') #returns anything with a g at the end
str_view(x, '[^m]$')

?regex

str_view(x, "(?<=^.{1})")
str_view(x, "(?<=^.{1})(.)(?=.{1}$)")

str_view(fruit_smoothie, '\\sand') #\s is space
str_view(fruit_smoothie, '[^[:blank:]]and') #negates everything?
str_view(fruit_smoothie, '[^[:blank:]]') #negates blanks?

length(sentences)
str_view(sentences[1:5], '\\.') #capture all periods
str_view(sentences[1:5], '[:punct:]') #capture every punctuation
str_match(sentences[1:5], '[:punct:]')
str_match_all(sentences[1:5], '[:punct:]')
str_extract_all(sentences[1:5], '[:punct:]')
unique(str_extract_all(sentences, '[:punct:]'))

str_replace_all(sentences[1:5], '\\.', "!")

#FOR HOMEWORK 8
century19 <- readRDS('data/c19_novels_raw.rds')
idx <- which(sapply(century19,
                    function(x) any(grepl("WUTHERING", x, ignore.case = T))))
century19[[idx]][1:5]

str_view(century19[[idx]][1:5], pattern = '\\S+')
str_view(tail(century19[[idx]], pattern = '\\S+'))
sum(str_count(century19[[idx]], '\\S+'))
sum(str_count(century19[[idx]], 'Heathcliff'))

library(ggplot2)

words <- unlist(str_split(tolower(paste(century19[[idx]], '')), '\\s+'))
words_clean <- unlist(str_split((str_replace_all(words, "[:punct:]", ' ')), '\\s+'))
#check youre doing lowercase instead of uppercase S
#uppercase S negates while lowercase s captures
words_clean
head(words_clean)
words_clean <- words_clean[words_clean != '']
head(words_clean)
word_counts <- table(words_clean)
head(word_counts)
tail(word_counts)

thousand_count <- word_counts[word_counts > 1000]
thousand_count

df <- data.frame(
  word = names(thousand_count),
  n = as.numeric(thousand_count)
)
df

ggplot(df, aes(word, n)) +
  geom_col(fill = 'lightblue') +
  xlab(NULL) +
  coord_flip() +
  theme_bw() +
  labs(y = "Word Freq. for Wuthering Heights")

install.packages('tidytext')

nrow(tidytext::stop_words)

tidytext::stop_words

stop_words <- paste(str_to_lower(tidytext::stop_words), collapse = '\\b|\\b')
stop_words <- paste0("\\b", stop_words, '\\b')
clean_wuther <- str_remove_all(words_clean, stop_words)
head(clean_wuther)
clean_wuther <- clean_wuther[clean_wuther != '']
clean_wuther[1:5]
sum(str_count(words_clean, '\\S+'))
sum(str_count(clean_wuther, '\\S+'))
sum(str_count(clean_wuther, '[1-9]*'))


word_counts <- table(clean_wuther)
head(word_counts)
word_counts <- sort(word_counts, decreasing = T)
hundred_count <- word_counts[word_counts > 100]

df <- data.frame(
  word = names(hundred_count), 
  n = as.numeric(hundred_count)
)

df$word <- factor(df$word, level = df$word[order(df$n)])
str(df)

ggplot(df, aes(word, n)) +
  geom_col(fill = "lightblue") +
  xlab(NULL) +
  coord_flip() +
  theme_bw() +
  labs(y = 'Important Word Freq. for Wuthering Heights')