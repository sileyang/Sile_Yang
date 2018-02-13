#'Request data of each characters from Marvel API
#'Including characters'name, description, comics, events and series.
#'
#'@param Character A character's name
#'@param publickey A public key you get from https://developer.marvel.com/
#'@param privatekey A private key you get from https://developer.marvel.com/
#'@param select There are three chocies of "select": "comics","series" and "events". It returns different datasets containing info of character's comics, series and events. If you want to return info of characters, you can ignore this param.
#'@return A dataset. The data depends on your choice in param "select"
#'
#'@export
#'@import httr
#'@import stringr
#'@import jsonlite
#'@import digest
#'@import tidyverse
#'@examples
#'\dontrun{InfoMarvelCharacters("Thor",your_public_key,your_private_key)}
#'
#'

InfoMarvelCharacters <- function(Character,publickey,privatekey,select="select"){
  md5input <- str_c("1",privatekey,publickey)
  hash <- digest(md5input,algo = "md5",serialize = FALSE)
  url <- str_c("http://gateway.marvel.com/v1/public/characters?name=",Character,"&ts=1&apikey=",publickey,"&hash=",hash)
  response <- GET(url)
  if (http_error(response)){
    warning("The request produced an error")
  }
  contents <- content(response)
  data <- contents$data$results
  marvel_char <- fromJSON(toJSON(data))
  CharacterID <- marvel_char$id
  if (select == "select"){
    marvel_char$name <-as.character(marvel_char$name)
    marvel_char$description <- as.character(marvel_char$description)
    char <- marvel_char %>% select(name,description)
    return(char)
  }
  if (select == "comics"){
    marvelc <- marvel_char$comics
    comics <- as.data.frame(marvelc$items)
    comics <- comics %>% select(name)
    comics$name <- as.character(comics$name)
    return(comics)
  }
  if (select == "events"){
    marvele <-marvel_char$events
    events <- as.data.frame(marvele$items)
    events <- events %>% select(name)
    events$name <- as.character(events$name)
    return(events)
  }
  if (select == "series"){
    marvels <- marvel_char$series
    series <- as.data.frame(marvels$items)
    series <- series %>% select(name)
    series$name <- as.character(series$name)
    return(series)
  }
}
