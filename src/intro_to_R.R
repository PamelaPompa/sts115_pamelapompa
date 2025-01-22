cake_area <- 3.14*8^2
cake_slice <- cake_area/9

cake_flavor <- 'chocolate'

#this calculates the log2 of 8
log(8, base=2)
log(x=8,
    base=2)

# numbers
time.min <- c(5, 4, 4, 12, 10, 2, 3, 4, 4, 5, 19)

# strings
pets <- c("woof", "woof", "cat", "woof", "woof", "cat", "woof", "woof", "woof",
          "woof", "woof")
place <- c("Temple", "Yakitori", "Panera", "Yakitori", "Guads", "Home",
           "Tea List", "Raising Canes", "Pachamama", "Lazi Cow", "Wok of Flame")

#not vectorized = sum, length


# current data (vectors)
time.min
place
pets

# create new data (vectors)
distance.mi <- c(0.9, 0.6, 0.8, 0.6, 2, 100, 0.6, 0.7, 0.8, 1, 3.7)

major <- c("chicanix studies", "human development", "economics", "undeclared",
           "psychology", "MMM", "psychology", "undeclared", "human development",
           "undeclared", "GG")

# combine vectors into dataframe
my.data <- data.frame(place, distance.mi, time.min, major, pets)

obspts <- read.csv('~/sts115_pamelapompa/data/obspts.csv')
