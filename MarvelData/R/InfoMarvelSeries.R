#'Get Marvel Series' Info
#'
#'Request data of each series from Marvel API
#'Including series'title, description, start year, end year, rating and type
#'
#'@param series A series's title
#'@param publickey A public key you get from https://developer.marvel.com/
#'@param privatekey A private key you get from https://developer.marvel.com/
#'@return A dataset.
#'
#'@export
#'@import httr
#'@import stringr
#'@import jsonlite
#'@import digest
#'@import tidyverse
#'@examples
#'\dontrun{InfoMarvelSeries("Black%20Panther",your_public_key,your_private_key)}
#'

InfoMarvelSeries <- function(series,publickey,privatekey){
  md5input <- str_c("1",privatekey,publickey)
  hash <- digest(md5input,algo = "md5",serialize = FALSE)
  url <- str_c("http://gateway.marvel.com/v1/public/series?title=",series,"&limit=100&ts=1&apikey=",publickey,"&hash=",hash)
  response <- GET(url)
  if (http_error(response)){
    warning("The request produced an error")
  }
  contents <- content(response)
  data <- contents$data$results
  marvel_series <- fromJSON(toJSON(data))
  marvel_series <- marvel_series %>% select(title,description,startYear,endYear,rating,type)
  marvel_series$title <- as.character(marvel_series$title)
  marvel_series$description <- as.character(marvel_series$description)
  marvel_series$startYear <- as.character(marvel_series$startYear)
  marvel_series$endYear <- as.character(marvel_series$endYear)
  marvel_series$rating <- as.character(marvel_series$rating)
  marvel_series$type <- as.character(marvel_series$type)
  return(marvel_series)
}
