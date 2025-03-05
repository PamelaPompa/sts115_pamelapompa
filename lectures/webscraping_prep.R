#' content producer to server (i.e Netflix) -> client to server (opens Netflix) -> server to client (provides
#' the media requested)

#nslookup google.com --> returns the  server information and the IP address

#'https://ebba.english.ucsb.edu/search_combined/?ft=dragon&numkw=52
#'https: protocol
#'server: ebba.english.ucsb
#'path to file: /search_combined/index.php
#'query string: ?ft=dragon&numkw=52

install.packages('httr')
install.packages('jsonlite')

library('httr')
library('jsonlite')

url = 'https://restcountries.com/v3.1/all?fields=name'
response = GET(url)

response$content
body = content(response, 'text')

df = fromJSON(body)
names(df)
str(df)

df = fromJSON(body)$name

country_names = df[, c('common', 'official')]
country_names

Sys.sleep(1/10) # will wait 1/10th of a second and will prevent ur code from pinging an API for more than
                # 1/10th of a second
                # will block your IP address since it looks like a malware attack
