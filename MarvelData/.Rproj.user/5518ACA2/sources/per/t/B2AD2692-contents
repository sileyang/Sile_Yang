#'Get Marvel Events' Info
#'
#'Request data of each events from Marvel API
#'Including event's title, description, start year and end year
#'A user can select more info of comics, characters and series related to the events as well.
#'
#'@param events A events's title
#'@param publickey A public key you get from https://developer.marvel.com/
#'@param privatekey A private key you get from https://developer.marvel.com/
#'@param select There are three chocies of "select": "comics","series" and "events". It returns different datasets containing info of event's comics, series and characters. If you want to return info of events, you can ignore this param.
#'@return A dataset. The data depends on your choice in param "select"
#'
#'@export
#'@import httr
#'@import stringr
#'@import jsonlite
#'@import digest
#'@import tidyverse
#'@examples
#'\dontrun{InfoMarvelEvents("Civil%20War",your_public_key,your_private_key)}
#'

InfoMarvelEvents <- function(events,publickey,privatekey,select="select"){
  md5input <- str_c("1",privatekey,publickey)
  hash <- digest(md5input,algo = "md5",serialize = FALSE)
  url <- str_c("http://gateway.marvel.com/v1/public/events?name=",events,"&limit=100&ts=1&apikey=",publickey,"&hash=",hash)
  response <- GET(url)
  if (http_error(response)){
    warning("The request produced an error")
  }
  contents <- content(response)
  data <- contents$data$results
  marvel_events <- fromJSON(toJSON(data))
  if (select == "select"){
    marvel_events <- marvel_events %>% select(title,description,start,end)
    marvel_events$title <- as.character(marvel_events$title)
    marvel_events$description <- as.character(marvel_events$description)
    marvel_events$start <- as.character(marvel_events$start)
    marvel_events$end <- as.character(marvel_events$end)
    return(marvel_events)
  }
  if (select == "characters"){
    characters <- as.data.frame(marvel_events$characters$items)
    characters <- characters %>% select(name)
    characters$name <- as.character(characters$name)
    return(characters)
  }
  if (select == "comics"){
    comics <- as.data.frame(marvel_events$comics$items)
    comics <- comics %>% select(name)
    comics$name <- as.character(comics$name)
    return(comics)
  }
  if (select == "series"){
    series <- as.data.frame(marvel_events$series$items)
    series <- series %>% select(name)
    series$name <- as.character(series$name)
    return(series)
  }

}
