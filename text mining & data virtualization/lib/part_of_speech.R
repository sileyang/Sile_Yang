part_of_speech <- function(author,total_observation){
  spooky_author <- spooky %>% filter(author == author)
  unipostagger <- rdr_model(language = "English", annotation = "UniversalPOS")
  data_author <- data.frame()
  for (i in (1:total_observation)){
    spooky_author_sub <- spooky_author[i,]
    sentences <- tokenize_sentences(spooky_author_sub$text, simplify = TRUE)
    unipostags <- rdr_pos(unipostagger, sentences)
    unipostags <- unipostags %>% select(token,pos)
    data_author <- rbind(data_author, unipostags)
  }
  data_author$author <- str_c(author)
  write.csv(data_author,file = str_c("data/",author,".csv"))
}