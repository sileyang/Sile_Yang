data <- read.csv("all_pd.csv")[-1]
data$Country <- as.factor(data$Country)
data_all <- read.csv("all_pd.csv")[-1]