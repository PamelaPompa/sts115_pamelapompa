library('xml2')
#This code will print all 15 featured urls per page of the Featured section when ran

#this is the function that will help extract the 15 links for the respective page plugged in
parse_article_links = function(page){
  div = xml_find_all(page, "//div[@id = 'tdi_74']") #tdi_74 is the id associated with the div tag that contains all the feature links
    #This id was different from the course reader so I think this is the change that was made
  links = xml_find_all(div, ".//h3/a") #this is because the feature page links are within h3 tags and then theyre
    #nested with an a tag; helps narrow our search for the links to avoid the picture links
  urls = xml_attr(links, "href")  # Get the URLs from the href attribute (I used the course reader for help on how to do this)
  print(urls) #Im printing the urls to see if each run of this function provides 15 links and to see
              #if they match the expected links for a given page
  
  #This section is to get the next page's URL, since I'll need it in order to find the links for all pages
  #I used the course reader for help here
  nav = xml_find_all(page, "//div[contains(@class, 'page-nav')]") #the page-nav class contains the link to the next page
  next_page = xml_find_all(nav, ".//a[contains(@aria-label, 'next-page')]")
  next_url = xml_attr(next_page, "href") #we extract the url from the next_page variable to get the url for the next page
  
  #Using a list will allow us to return two objects for the respective page we checked
  list(urls = urls, next_url = next_url) #urls = the 15 feature links, next_url = the link for the next page
}

url = "https://theaggie.org/category/features/" #this is the first page we are checking (page 1 of features)
#this url has to be initialized outside of the while loop so that we have something to plug in to start with
article_urls = list() #this is a list because we will be checking various pages; it will contain the 15 links
                      #for every page
i = 1 #i is set to 1 to represent that we are starting on page 1

#This while loop was from the course reader
# On the last page, the next URL will be `NA`.

while (!is.na(url)) { #while the url is not NA means while the url exists aka we havent gone past the last page
  # Download and parse the page.
  page = read_html(url)  #the read_html function helps us download the url we plug in
  result = parse_article_links(page) #result is set to the list created in parse_article_links
  
  # Save the article URLs in the `article_urls` list. The variable `i` is the
  # page number. Example: if we are on page 5, i will be 5 and we will save the respective links of the
  #5th page in the 5th position of article_urls
  article_urls[[i]] = result$urls #result$urls refers to the the list of the featured links obtained from parse_article_links
  i = i + 1 #this increases the i variable by 1 to represent that we are moving onto the next page
  
  # Set the URL to the next URL.
  url = result$next_url #this will be the next url we plug into the read_html function and then into the page
                        #variable, which we will then use to plug into the parse_article_links function we made
                        #in order to check that page
  
  # Sleep for 1/30th of a second so that we never make more than 30 requests
  # per second, otherwise we might make our requests look like a malware attack
  Sys.sleep(1/30)
}
