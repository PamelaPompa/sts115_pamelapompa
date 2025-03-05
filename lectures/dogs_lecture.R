list.files()

list.files("<path>")

source("<path") # runs a code without having to be in it

#rds file: R Data Serialized --> unique format to the R world, this data structures allows you to
#save large data in a stored space

#csv file: comma separated values --> transfering files back and forth between people
# -the commas represent columns

# file extension: anything after the "." in a file ex) picture.jpg

dogs <- readRDS("./data/dogs.RDS")

class(dogs)

str(dogs)
mydataframe$myvariable

ncol(dogs)
nrow(dogs)
rownames(dogs)
summary(dogs)

dogs$breed
mean(dogs$weight) # leads to NA
mean(dogs$weight, na.rm = TRUE)
range(dogs$height, na.rm = TRUE)
dogs$breed = "Beagle" # turns them all into Beagle

NA
"NA"
class(NA)
class("NA")

str(dogs)
summary(dogs)

dogs$weight
class(c(1,NA))
class(c("hello", NA, "hi"))


NA + 1 || NA * 10
NA == NA

is.na(NA) || is.na(5) || is.na("5")
is.na(dogs$weight)


# Infinity

6/0 # same for negative numerator
Inf + 1 # same for subtraction
class(Inf)
Inf == Inf
is.infinite(Inf) # checks for negative or positive infinity
is.infinite(5) # false

# Not a number 
0/0
NaN
class(NaN)
NaN == NaN # returns NA
is.nan(NaN)

# Null

dim(dogs) # rows and columns
dim(c(1, 2)) # NULL; not an error, just means R doesn't have information/a result for that
class(NULL)
NULL == NULL # logical(0)
is.null(NULL)

str(dogs) # look at the Factor

A feature in a data set is categorical if it measures a qualitative category.
Some examples of categories are:
  -Music genres, colors, answers (yes, no), months

dogs2 <- read.csv("./data/dogs.csv")

class(dogs$group)
class(dogs$breed)

colors = c("red", "green", "blue", "red")
class(colors)
colors_cat = factor(colors)
colors

class(colors_cat)
levels(colors_cat)
colors_cat[1:2]

table(colors_cat[1:2])
table(colors[1:2])

?factor

factor(colors, c("red", "blue", "green", "purple")) # good for performance of my code
colors
colors_cat
colors_cat[1:2]
droplevels(colors_cat[1:2])

x = c(1, 2, 2)
x[1]
