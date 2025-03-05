install.packages("ggplot2") # stands for grammar of graphics
library(ggplot2)

wine = read.csv("data/wine_enthusiast_rankings.csv.crdownload")
wine_cv = subset(wine, region_2 == "Central Valley" & variety == "Cabernet Sauvignon")

ggplot()

#add a data layer
ggplot(wine_cv)

#add a geometry
ggplot(wine_cv) + geom_point()

#add aesthetic mapping
ggplot(wine_cv) + aes(x = price, y = points) + geom_point()

#set color = "blue" in aesthetic (wrong)
ggplot(wine_cv) + aes(x = price, y = points, color = "blue") + geom_point() #R is looking for a column
                                                                            #that contains only one value 
                                                                            #with the string "blue"

#set color = "blue" in aesthetic (right)
ggplot(wine_cv) + aes(x = price, y = points) + geom_point(color = "blue") #constant values can be applied in
                                                                          #in the geometry functions
                                                                          #while the aesthetic mapping is for
                                                                          #telling R how to utilize your data

#use the alpha channel to show overlapping points
ggplot(wine_cv) + aes(x = price, y = points) + geom_point(color = "blue", alpha = 0.2) #allows you to see
                                                                                       #overlapping with dots

#add a underrated column (high ranking, low price)
underrated_wines = subset(wine_cv, price < 20 & points > 85)

#plot price vs ranking for underrated wines, colored by central valley sub region
ggplot(underrated_wines) + aes(x = price, y = points, color = region_1) + geom_point()
                                                                                #the 4 values are categorical
                                                                                 #R selects 4 colors that are
                                                                                # different from one another
                                                           #if it was numerical, R would try to do a gradient

#add the taster's name to each point
ggplot(underrated_wines) + aes(x = price, y = points, color = region_1, label = taster_name) +
  geom_text() + geom_point()

#provide a specific color to the points (method 1)
ggplot(underrated_wines) + aes(x = price, y = points, color = region_1, label = taster_name) +
  geom_text() + geom_point(color = "black")

#let black be the global setting but override the color of text with a local aesthetic
ggplot(underrated_wines) + aes(x = price, y = points, label = taster_name) +
  geom_text(mapping=aes(color = region_1)) + geom_point()

#now offset the text and points so overlapping is minimized + add a title
ggplot(underrated_wines) + aes(x = price, y = points, label = taster_name) +
  geom_text(mapping=aes(color = region_1), position = position_jitter(seed = 1)) +
  geom_point(position = position_jitter(seed = 1)) + labs(title = "Scores vs price of underrated wines",
                                                          subtitle = "Data from Wine Enthusiast Magazine",
                                                          x = "Price ($s)", y = "Ranking (out of 100)", 
                                                          color = "Central valley subregion")

