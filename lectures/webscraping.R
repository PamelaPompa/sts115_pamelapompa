install.packages('xml2')
install.packages('rvest')

library('xml2')
library('rvest')

html = r"(
<html>
  <head>
    <title>This is the page title!</title>
  </head>
  <body>
    <h1>This is a header!</h1>
    <p>This is a paragraph.
      <a href="http://www.r-project.org/">Here's a website!</a>
    </p>
    <p id="hello">This is another paragraph.</p>
  </body>
</html> )"

doc = read_html(html)
doc

paragraphs = xml_find_all(doc, '/html/body/p')
paragraphs = xml_find_all(doc, '//p')
paragraphs

links = xml_find_all(doc, '//p/a')
xml_find_all(doc, '//h1|//p')

hello = xml_find_all(doc, '//p[@id = "hello"]')
hello

paragraphs = xml_find_all(doc, '//*[contains(text(), "paragraph")]')
paragraph2 =xml_find_all(doc, '//p[2]')
paragraph2

# California Cities

cities_url = 'https://en.wikipedia.org/wiki/List_of_municipalities_in_California'
doc2 = read_html(cities_url)
cities_table = xml_find_all(doc2, '//table[contains(@class, "plainrowheaders")]')
cities_table

cities_df = html_table(cities_table)[[1]]
cities_df
class(cities_df)

cities = cities_df[-1,]
cities
names(cities) = c('name', 'type', 'county', 'pop2020', 'pop2010', 'pop_change', 'mi2', 'km2', 'density', 'date')
cities

dates = as.Date(cities$date, format = "%B %d, %Y")
cities$date = dates
cities$date

install.packages('stringr')
library('stringr')

pop20_str = str_replace_all(cities$pop2020, ',', '')
pop20_str

pop20 = as.numeric(pop20_str) #wont work cuz theres commas, remove them
pop20
cities$pop2020 = pop20

write.csv(cities, './data/california_cities.csv')

# Cal Aggie

aggie_url = 'https://theaggie.org/category/features/'

aggie1 = read_html(aggie_url)
aggie1

inner_block = xml_find_all(aggie1, '//div[@class="td-main-content-wrap]')
feature_blocks = xml_find_all(inner_block, './/h3[@class="entry-title td-module')
feature_block_links = xml_find_all(inner_block, './/a')

blocks = xml_find_all(aggie1, '//div[@class = "tdb_module_loop td_module_wrap td-animation-stack td-cpt-post"]')
block_headers = xml_find_all(blocks, './/h3[@class="entry-title td-module-title"]')    
blocks_links = xml_find_all(block_headers)
