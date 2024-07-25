library(dplyr)

#make this example reproducible 
set.seed(1)

#create original data frame
df <- data.frame(var1= runif(10, 0, 50), 
                 var2= runif(10, 2, 23),
                 var3= runif(10, 5, 38))

#view original data frame 
df

#scale var1 to have mean = 0 and standard deviation = 1
df2 <- df %>% 
  mutate_at(c('var1'), ~(scale(.) %>% 
                           as.vector))
df2
