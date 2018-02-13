#'Get ALL Marvel Characters' Info
#'
#' Request data from Marvel API
#' to get a dataset including ALL Marvel characters'name and short description (total 1491)
#'
#'@param publickey A public key you get from https://developer.marvel.com/
#'@param privatekey A private key you get from https://developer.marvel.com/
#'@return A dataset including characters' name and short description.
#'@keywords Marvel,Characters,data
#'
#'@export
#'@import httr
#'@import stringr
#'@import jsonlite
#'@import digest
#'@import tidyverse
#'@examples
#'\dontrun{MarvelCharacters(your_public_key,your_private_key)}
#'

MarvelCharacters <- function(publickey,privatekey){
  md5input <- str_c("1",privatekey,publickey)
  hash <- digest(md5input,algo = "md5",serialize = FALSE)
  url <- str_c("http://gateway.marvel.com/v1/public/characters?limit=100&&ts=1&apikey=",publickey,"&hash=",hash)
  response <- GET(url)
  if (http_error(response)){
    warning("The request produced an error")
  }
  contents <- content(response)
  data <- contents$data$results
  marvel_data <- fromJSON(toJSON(data))
  marvel_data <- marvel_data %>% select(name,description)
  list = c(100,200,300,400,500,600,700,900,1000,1100,1200,1300,1400)
  for (offset in list){
    url <- str_c("http://gateway.marvel.com/v1/public/characters?limit=100&offset=",offset,"&ts=1&apikey=",publickey,"&hash=",hash)
    response <- GET(url)
    if (http_error(response)){
      warning("The request produced an error")
    }
    contents <- content(response)
    data <- contents$data$results
    new_data <- fromJSON(toJSON(data))
    new_data <- new_data %>% select(name,description)
    marvel_data <- rbind(marvel_data,new_data)
  }
  marvel_data$name <- as.character(marvel_data$name)
  marvel_data$description <- as.character(marvel_data$description)
  return(marvel_data)
}
