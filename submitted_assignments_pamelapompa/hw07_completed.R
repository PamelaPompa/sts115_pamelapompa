library('xml2')
#This code will print all 15 featured urls per page of the Featured section when ran

#This is the code to how I started but my actual code to run the function will be below
  #doc = read_html("https://theaggie.org/category/features/")
    #we do this to download the features page 
  #div = xml_find_all(doc, "//div[@id = 'tdi_74']")
    #I saw the that the links to the articles are all inside a div tag with the id "tdi_74". This was different
    #from the course reader so I assume this is the change that was made
  #links = xml_find_all(div, ".//h3/a")
    #Then I saw that the feature page links are within h3 tags and then theyre nested with an a tag
  #feature_urls = xml_attr(links, "href")
    # Get the URLs from the href attribute (I used the course reader for help on how to do this)
  #length(links) # I used this to check that I did get 15 links like expected
    #Now I need to make a function so that I can apply this logic to every page and get all the links

parse_article_links = function(page){
  div = xml_find_all(page, "//div[@id = 'tdi_74']")
  links = xml_find_all(div, ".//h3/a")
  urls = xml_attr(links, "href")
  print(urls) #Im printing the urls to see if each run of this function provides 15 links and to see
              #if they match the expected links for a given page
  
  #This section is to get the next page's URL, since I'll need it in order to find the links for all pages
  #I used the course reader for help here
  nav = xml_find_all(page, "//div[contains(@class, 'page-nav')]")
  next_page = xml_find_all(nav, ".//a[contains(@aria-label, 'next-page')]")
  next_url = xml_attr(next_page, "href")
  
  #Using a list will allow us to return two objects
  list(urls = urls, next_url = next_url)
}

url = "https://theaggie.org/category/features/"
article_urls = list()
i = 1

#This was from the course reader
# On the last page, the next URL will be `NA`.
while (!is.na(url)) {
  # Download and parse the page.
  page = read_html(url)
  result = parse_article_links(page)
  
  # Save the article URLs in the `article_urls` list. The variable `i` is the
  # page number.
  article_urls[[i]] = result$urls
  i = i + 1
  
  # Set the URL to the next URL.
  url = result$next_url
  
  # Sleep for 1/30th of a second so that we never make more than 30 requests
  # per second.
  Sys.sleep(1/30)
}
