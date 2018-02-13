data <- read.csv("MUS_year.csv", header = T)[, -1]
colnames(data) <- c("State", 1967:2017)
rownames(data) <- data$State
data <- data[, -1]

data2 <- read.csv("total_year.csv", header = T)



