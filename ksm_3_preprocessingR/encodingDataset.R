dataset <- read.csv("C:/Users/Hp/Downloads/Dataset/Dataset.csv", header = TRUE)
dataset <- data.frame(dataset)
dataset

# Ordinal Encoding
dataset$Country <- encode_ordinal(dataset$Country, order = c('France', 'Spain', 'Germany'))
dataset
dataset$Purchased <- encode_ordinal(dataset$Purchased, order = c('No', 'Yes'))
dataset

table(dataset[["Country"]],
      encode_ordinal(dataset[["Country"]], order = c('France', 'Spain', 'Germany')))
table(dataset[["Purchased"]],
      encode_ordinal(dataset[["Purchased"]], order = c('No', 'Yes')))
dataset

# Onehot Encoding
library(caret)
dummy <- dummyVars(" ~ .", data=dataset)
newdata <- data.frame(predict(dummy, newdata = dataset))
newdata

