# Method 1 : Using scale function
# Creating Dataset
X <- c('A','B','C','D','E','F')
Y <- c(15,16,20,19,19,17)
Z <- c(5.0,4.0,5.0,2.0,1.0,3.0)

dataframe <- data.frame(Name = X, Age = Y, CGPA = Z )
dataframe
# applying scale function
dataframe[2 : 3] <- as.data.frame(scale(dataframe[2 : 3]))

# displaying result
dataframe

# Method 2 : Using base R
# Creating Dataset
X <- c('A', 'B', 'C', 'D', 'E', 'F')
Y <- c(15, 16, 20, 19, 19, 17)
Z <- c(5.0, 4.0, 5.0, 2.0, 1.0, 3.0)

dataframe <- data.frame(Name = X, Age = Y, CGPA = Z )

# creating Standardization function
standardize = function(x){
  z <- (x - mean(x)) / sd(x)
  return( z)
}

# apply your function to the dataset
dataframe[2:3] <-
  apply(dataframe[2:3], 2, standardize)

#displaying result
dataframe

