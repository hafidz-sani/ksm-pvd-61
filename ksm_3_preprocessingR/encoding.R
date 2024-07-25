
# building a data frame
A <- as.factor(c('y', 'z', 'x', 'y', 'z'))
B <- as.factor(c('y', 'x', 'z', 'z', 'x'))
C <- as.factor(c('k', 'i', 'i', 'j', 'k'))
df <- data.frame(A, B, C)
df

# encoding
df[, 1:2] <- encode_ordinal(df[[,1:2]], order = c('x', 'y', 'z'))
df[, 3] <- encode_ordinal(df[, 3, drop = FALSE], order = c('i', 'j', 'k'))
print(df)

# one-hot
# building a data frame
A <- as.factor(c('x', 'y', 'x'))
B <- as.factor(c('i', 'j', 'k'))
df <- data.frame(A, B)
df
# encoding
df0 <- encode_onehot(df)
df0 <- cbind(df, df0)
print(df0)
df0 <- encode_onehot(df, colname.sep = '-', drop1st = TRUE)
df0 <- cbind(df, df0)
rm(df)
print(df0)

library(mltools)
library(data.table)
customers <- data.table(
  id=c(10, 20, 30, 40, 50),
  gender=c('male', 'female', 'female', 'male', 'female'),
  mood=c('happy', 'sad', 'happy', 'sad','happy'),
  outcome=c(1, 1, 0, 0, 0))
customers_1h <- one_hot(customers)
customers_1h

set.seed(555)
data01 <- data.frame(ID = seq(1,100,by=1),
                   Colour = sample(c("Red","Green","Bl# Creating Dataset
X <- c('A','B','C','D','E','F')
Y <- c(15,16,20,19,19,17)
Z <- c(5.0,4.0,5.0,2.0,1.0,3.0)

dataframe <- data.frame(Name = X, Age = Y, CGPA = Z )

# applying scale function
dataframe[2 : 3] <- as.data.frame(scale(dataframe[2 : 3]))

# displaying result
dataframe
ue"), 100, replace = TRUE),
                   Quality = sample(c("Poor","Average","Good"), 100, replace = TRUE)
)

data01

# dummyVars 
library(caret)
dummy <- dummyVars(" ~ .", data=data01)
newdata <- data.frame(predict(dummy, newdata = data01))
newdata
