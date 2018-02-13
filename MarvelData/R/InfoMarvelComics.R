#'Get Marvel Comics' Info
#'
#'Request data of each comics from Marvel API
#'Including comics'title, description, issuenumber and format
#'
#'@param comics A comics's title
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
#'\dontrun{InfoMarvelComics("Amazing%20Spider-Man",your_public_key,your_private_key))}
#'

InfoMarvelComics <- function(comics,publickey,privatekey){
  md5input <- str_c("1",privatekey,publickey)
  hash <- digest(md5input,algo = "md5",serialize = FALSE)
  url <- str_c("http://gateway.marvel.com/v1/public/comics?title=",comics,"&limit=100&ts=1&apikey=",publickey,"&hash=",hash)
  response <- GET(url)
  if (http_error(response)){
    warning("The request produced an error")
  }
  contents <- content(response)
  data <- contents$data$results
  marvel_comics <- fromJSON(toJSON(data))
  marvel_comics <- marvel_comics %>% select(title,issueNumber,description,format)
  total <- as.numeric(contents$data$total)
  n = total%/%100
  list <- list()
  for (i in (1:n+1)){
    num = i*100
    list <-  c(list,num)
  }
  for (count in list){
    url <- str_c("http://gateway.marvel.com/v1/public/comics?title=",comics,"&limit=100&offset=400&ts=1&apikey=",publickey,"&hash=",hash)
    response <- GET(url)
    response
    if (http_error(response)){
      warning("The request produced an error")
    }
    contents <- content(response)
    data <- contents$data$results
    new_data <- fromJSON(toJSON(data))
    new_data <- new_data %>% select(title,issueNumber,description,format)
    marvel_comics <- rbind(marvel_comics,new_data)
  }
  marvel_comics$title <- as.character(marvel_comics$title)
  marvel_comics$issueNumber <- as.character(marvel_comics$issueNumber)
  marvel_comics$description <- as.character(marvel_comics$description)
  marvel_comics$format <- as.character(marvel_comics$format)
  return(marvel_comics)
}
