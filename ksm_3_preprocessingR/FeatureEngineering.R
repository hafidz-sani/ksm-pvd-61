library(naniar)
library(zoo)
library(dplyr)
library(VIM)
library(caret)
library(factoextra)

#Feature Engineering
head(airquality)
# Missing Value
MissValue <- sapply(airquality, function (x) sum(is.na(x)))
MissValue
list_na <- colnames(airquality)[ apply(airquality, 2, anyNA) ]
list_na
prop_miss(airquality) # prop_miss : berguna untuk mengetahui proporsi missing value dari dataset
n_complete(airquality) # n_complete : berguna untuk mengetahu proporsi non-missing value dari dataset dalam bentuk jumlah angka
prop_complete(airquality) # prop_complete : berguna untuk mengetahui proporsi non-missing value dari dataset dalam bentuk persen

# Feature Selection
# Strategi yang digunakan untuk feature selection ini adalah menghapus fitur yang memiliki nilai varians yang rendah
bloodbrain_x = bbbDescr
bloodbrain_x
str(bloodbrain_x)
# Untuk mengecek fitur yang memiliki nilai fitur yang rendah , kita dapat menggunakan nearZeroVar() dari library(caret)
# Identify near zero variance predictors: remove_cols
remove_cols <- nearZeroVar(bloodbrain_x, names = TRUE, 
                           freqCut = 2, uniqueCut = 20)

remove_cols
# Get all column names from bloodbrain_x: all_cols
all_cols <- names(bloodbrain_x)
all_cols
# Remove from data: bloodbrain_x_small
bloodbrain_x_small <- bloodbrain_x[ , setdiff(all_cols, remove_cols)]
bloodbrain_x_small
str(bloodbrain_x_small)
dim(bloodbrain_x)
dim(bloodbrain_x_small)


#preproc = preProcess(bloodbrain_x, method = "nzv", freqCut = 2, uniqueCut = 20)
#bloodbrain_x_small_1 = predict(preproc, bloodbrain_x)
#dim(bloodbrain_x_small_1)
