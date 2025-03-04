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


# 1. All of the questions in this homework use the Best in Show data set. 
#      The data is the file `dogs.rds`.

#   a. Load the data set and use R functions to inspect the number of 
#      columns, number of rows, names of columns, and column data types.
#      [code completion + comprehension]

        dogs <- readRDS("../data/dogs.rds")
        
        ncol(dogs) # 18 columns (ncol returns the number of columns)
        
        nrow(dogs) # 172 rows   (nrow returns the number of rows)
        
        colnames(dogs)  #(colnames returns the names of the columns)
        #"breed"             "group"             "datadog"           "popularity_all"    "popularity"       
        #"lifetime_cost"     "intelligence_rank" "longevity"         "ailments"          "price"            
        #"food_cost"         "grooming"          "kids"              "megarank_kids"     "megarank"         
        #"size"              "weight"            "height"           
        
        column_types <- sapply(dogs, class)
        print(column_types)
        #breed             group           datadog    popularity_all        popularity     lifetime_cost 
        #"character"      "factor"         "numeric"    integer"            "integer"       "numeric" 
        #intelligence_rank      longevity         ailments            price         food_cost   grooming 
        #"integer"              "numeric"         "integer"         "numeric"       "numeric"    "factor" 
        #kids         megarank_kids       megarank             size            weight            height 
        #"factor"       "integer"         "integer"          "factor"         "numeric"         "numeric" 
        
        #The words not in quotation marks are the names of the columns and the words in quotations
        #underneath of the column names are the respective data type of each column
        #I used the sapply function to apply the class function to every column in the dogs data
        #frame and then I printed out the results; the class function is what helps return the data
        #type of every column
        
        
#   b. Make a scatter plot that shows the relationship between height and
#      weight. In 2-3 sentences, discuss any patterns you see in the plot.
#      [code completion + comprehension + interpretation]
        
        library(ggplot2) # using this in order to load in the library I need to create the scatter plot
        ggplot(dogs) + aes(x=weight, y=height) + geom_point()
        #I used ggplot(dogs) to show that I want my plot to be based on the dogs data frame, then I set 
        #my x to the weight column and my y to the height column via the aes() function, and then I 
        #stated I wanted my geometry to be points (since I want a scatterplot)
        
        #'My interpretation is that as the weight increase, so does the height; this is a positive
        #'correlation with the two variables. This would mean that usually, if a dog has a high weight, 
        #'they also tend to be tall. Around 100 pounds in weight, the height stagnates to a straight
        #'line; this tells me that there is an average limit to the max height a dog can be and the additional
        #' weight difference may just be due to diet or the body proportions of the dog (i.e the dog may have
        #'more muscle than other breeds)
        
        
#   c. Set the color of the points in the scatter plot from part b to a single 
#      color of your choosing. (Tip: Choose a color from one of the sites 
#      shared in the lesson (e.g. https://coolors.co/palettes/trending))
#      [code completion + comprehension]
        ggplot(dogs) + aes(x=weight, y=height) + geom_point( color = "#D41159")
        
        #The color I chose was a recommend color I saw when I searched up color blind friendly palettes
        #I set the color command inside the geom_point() function because I wanted to specify that the
        #points themselves should be this color. If you put it inside the aes() function then it would cause
        #a weird output because R would be looking for a column that contains only one value with the string
        #"#D41159"
      

# 2.
#   a. Make a bar plot that shows the number of dogs in each "group" of dogs.
#      [code completion + comprehension]
        ggplot(dogs) + aes(x = group) + geom_bar()
        #I used ggplot(dogs) to show that I want my plot to be based on the dogs data frame, then I set 
        #my x to the group column since that's the information I want to compare. The y was automatically
        #set to the count/number of dogs in each group. I switched the geometry function to geom_bar
        #since I wanted a bar plot
        
#   b. Are any groups much larger or smaller than the others? Describe what your 
#       visualization shows.
#      [interpretation]
        
        #The groups are overall the same amount give or take (range from 25-28) but the two groups that
        #are noticeably less than the two other groups are non-sporting (19) and toy (19)
      
#   c. Fill in the bars based on the size of the dog, and set the position 
#       argument of the bar geometry to the one you think best communicates the 
#       data. Explain why you chose this position.
#      [code completion + comprehension + interpretation]
        ggplot(dogs) + aes(x = group, fill = size) +
        geom_bar(position = "dodge") + labs(x = "Group", y = "Size")
        #'I chose the "dodge" option for my position because I think when it comes to comparing the three
        #'types of sizes per group, it makes the most sense to have them side by side since this makes it
        #'visually easier to understand. That way, you can see the count/amount for the 3 sizes for each
        #'group. Since the sizes are also color coded in 3 different categories, having the bars side by side
        #'is helpful when you want to compare a specific size among every size group
        #'(e.g., you can compare all small bars for every group by looking at the respective color).


# 3.
#   a. Which geometry function makes a histogram? Use the ggplot2 website or
#      cheat sheet to find out.
#      [code completion + comprehension]
        #The geom_histogram() function is the one that makes a histogram. The code below is an
        #example of how you could use it.
        
        ggplot(dogs) + aes(x = weight) + geom_histogram()
        
#   b. Make a histogram of longevity for the dogs data. How long do most dogs
#      typically live? Explain in 1-2 sentences.
#      [code completion + comprehension + interpretation]
        
        ggplot(dogs) + aes(x = longevity) + geom_histogram()
        
        #Most dogs typically live around 12~ years. I could infer this amount by looking at the 
        #histogram, since most of the values are clustered and peaking in count around this year amount.
  
#   c. Inside the geometry function for histograms, play around with the bins
#      argument. (e.g. bins = 10, bins = 50). What do you think this is doing?
#      [code completion + comprehension]
        
        ggplot(dogs) + aes(x = longevity) + geom_histogram(bins = 50)
        
        #I think a "bin" refers to how many bars there is, so the higher the bin number the
        #more detailed the histogram is, while the lower the bin number the more simplified and combined
        #the groups are.


# 4.
#   a. Modify your plot from Question 1 so that the shape of the points is
#      determined by the "group" of the dog. [code completion + comprehension]
        
        ggplot(dogs) + aes(x=weight, y=height, shape = group) + geom_point( color = "#D41159")
        
        #each group gets a different shape representation/symbol on the graph
        
#   b. Do height and weight effectively separate the different groups of dogs?
#      In other words, are there clear boundaries between the groups in the
#      plot (as opposed to being mixed together)? Are some groups better
#      separated than others?
#      [interpretation]
        
        #Height and weight dont really separate the groups of dogs; they're all intertwined among
        #the graph line. I guess this is because there is still a variation in breeds
        #within the groups (e.g a Beagle and a Bloodhound are both in the hound group, but there is
        #definitely a difference in average size between them.)
        #As for whether there are some groups being better separated than others, I suppose overall
        # the hound group looks to be somewhat of an outlier group because on average they weigh the
        #most compared to the other groups.
        
#   c. How might you improve the readability of this graph in order to visualize
#      this potential relationship more clearly?
#      [interpretation]
        #' I think it would be better to make the groups different colors rather than different shapes
        #' since it would make the groups visually pop out more. It would also make it easier to 
        #' notice the patterns among the groups since it's a bit hard to find the specific groups when they're
        #' intertwined/mixed in together throughout the graph.


# 5. In a paragraph, answer the following questions for the “Best in Show” 
#    visualization (https://informationisbeautiful.net/visualizations/best-in-show-whats-the-top-data-dog/) 
#    that was built using the dogs dataset.
#    a. Who do you think is the intended audience for this data visualization? 
#        How do you think that could influence data collection, metrics calculations, 
#        and graphics choices?
        #[interpretation]
        
          #' I suppose the intended audience may be for dog owners or breeders, since it may help them
          #' figure out which breed of dog they would prefer, or simply see where their dogs fall under.
          #' I figure this may be the intended audience because the visualization includes information such
          #' as their longevity, costs, grooming, and appetite.
          #' The graphics are very simple and easy to understand since they separate the dog groups by color
          #' and also illustrate the silhouette for the dog. I feel like if this were meant to be for a niche
          #' audience, they wouldn't have bothered in spending time to be descriptive with the graphics and
          #' would instead focus more on the numbers. Furthermore, the labels describing the different
          #' sections of the graph makes this seem as if it's meant to generalize to the public population
          #' (e.g "Hot Dogs!", or "Inexplicably Overrated") rather than labels meant to show any scientific
          #'correlation among the groups.
          
      
#    b. Who/what is included in this data visualization and who is left out? 
#        What do you think the impact of that decision could be on conclusions drawn
#        from viewers of the data visualization? 
#       [interpretation]
        
        #' The "kids" column was left out, which I believe would affect the conclusions that could be drawn
        #' from the data set. For example, in the visualization, a Border Collie is highly ranked in the
        #' "Hot Dogs" section, but in the data section, it ranked low on interactions with kids. I
        #' think that if someone was trying to use this visualization to figure out what kind of dog they
        #' want for their family, whether or not a dog would interact well with kids is probably very 
        #' important information for them that could change the conclusions they derive from this visualization.
      
#    c. What could the potential impact of this visualization be on those 
#       who are left-out? [interpretation]
        
        #(I dont understand the question so I'll give two possible answers)
        
        #The potential impact of excluding the 'kids' column from the visualization could be significant
        #for families with children. Without information on how different dog breeds interact with kids,
        #families might make adoption decisions that aren't well-suited to their household, potentially
        #leading to challenges or mismatches in expectations.
        
        #OR: If this is referring to some dog breeds being left out, then I guess this would mean that
        #they would not be considered by people looking at this visualization and the adoption rates
        #for the left-out breed could decline (which would only really happen if this visualization became
        #really popular and influenced a lot of people)
        
      
# 6. Select your favorite data visualization from https://viz.wtf/ 
# (that was not featured during class or in the reader). 
#   a. Type the direct url to the viz you selected here: 
        
        #https://viz.wtf/post/673291209724329984/fun-activity-draw-the-rest-of-the-circular-pie
        
        
#   b. Describe in a few sentences the "data story" you think that this visualization 
#       is trying to tell.
        
        #I believe the visualization is trying to show how many Americans believe in *one* of the
        #statements given (the statements being that Biden is illegitimate, or that using force was
        #justified in restoring Trump to office). As well as, how many believe in *both* statements,
        #and how many believe in *neither*.
        
#   c. In a paragraph, what makes this a "bad" visualization? Evaluate the visualization 
#       based on the visualization principles and perception rules discussed in class 
#       (i.e., Gestalt principles, plot type, accessibility, critical reading, etc.), 
#       and suggest a few changes to improve the graphic.
        
        #'The visualization is given in form of a half circle, which is a worse take than just doing a pie
        #'chart lol. Presenting the data in this way is bad because humans have a hard time properly gauging
        #'area, so seeing the size of the sections doesn't exactly help us correlate the significance
        #'of the data. Furthermore, the sizes aren't even accurate; the side on the right is 8% yet it's
        #'like double the size of the section that is only 18%. One of the categories is 74% yet only 
        #'comprises of like, nearly 1/3rd of the half-circle too. Furthermore, there are 3 separate categories,
        #'but only 2 different colors; why are two categories the same color if they represent different things?
        #'I think the two colors that were chosen are also not color blind friendly.
        #'Another issue is that I don't think combining the "agrees with one of the statements" into one category
        #'is actually helpful; it would be better to split this category into two (to represent which statement
        #'was agreed with separately) and have 4 categories in total.
        
        #The visualization 
#   d. Describe in 1-2 sentences one thing that this visualization actually already does well.
        # I think the information overall is technically presented in a simple and straightforward way since
        #'it's not very wordy and focuses more on visuals, so it's not overwhelming.



# 7. Look at the plot posted with this assignment on Canvas.
#    a. Identify the marks and channels in this plot. Write them out for this answer
        #'I think the marks are the fact that the plot is a scatterplot. The channels
        #' are that the dots are different shapes determined by the group, the dots are different colors,
        #' and the x-axis is determined by the longevity while the y-axis is determined by lifetime_cost.
    
#    b. Write the code to generate this plot. (Hint: start with identifying the 
#        variables on each axis, then think about the types of channels).
        
        ggplot(dogs) + aes(x = longevity, y = lifetime_cost, shape = group, color = group) + geom_point() +
        labs(title = "Dogs", x = "Longevity (years)", y = "lifetime_cost")
        
#    c. Propose 4 improvements to the plot based on best practices.
        #'1) Modify the title to be more representative of what the data is trying to show, e.g:
        #'"Relationship Between Dog Longevity and Lifetime Cost"
        #'2) Add a color or shape to the working group
        #'3) Make some of the dots transparent to show overlapping
        #'4) Add some jitter to help reduce overlapping
      
#    d. Modify the code to implement at least two of those changes.
        ggplot(dogs) + aes(x = longevity, y = lifetime_cost, shape = group, color = group) +
          geom_point(position = position_jitter(seed = 1)) +
          labs(title = "Relationship Between Dog Longevity and Lifetime Cost",
                 x = "Longevity (years)", y = "lifetime_cost")


