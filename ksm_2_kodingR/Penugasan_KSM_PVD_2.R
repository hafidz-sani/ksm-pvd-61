# Load Library (note: install package terlebih dulu jika ada package yang belum terinstall)
library(dplyr)
library(ggplot2)
library(plyr)
library(readxl)

# Perbaiki penulisan sintaks dan ubah path sesuai penyimpanan lokal masing-masing sesuai kaidah yang benar
mydata <- read_xls(path = "D:/Dataset/Sample - Superstore Sales.xls", range = NULL, col_names = TRUE )
View(mydata)

## Buatlah sintaks untuk mengubah nama semua variabel (kolom) sesuai dengan konsep Camel Case

# SENGAJA DIKOSONGKAN


## Ubah format penulisan pipe operator di bawah ini dengan kaidah yang benar
## Clue : Pipes diletakkan dimana variabel yang berada disebelah kiri pipe menjadi argumen pertama pada fungsi yang ada di sebelah kanan.
selected_data <- (filter(select(mydata, c(RowID, OrderPriority, Sales, Discount, Profit)), OrderPriority == 'High'))

## Perbaiki indentasi pada sintaks di bawah ini sesuai dengan yang telah diajarkan
for (i in 1:nrow(selected_data)) {
selected_data$no[i] <- i 
if (selected_data$Sales[i] < quantile(selected_data$Sales, probs = c(0.3))) selected_data$no[i] <- -1
}

count(selected_data)

# Perbaikilah format penulisan fungsi dan argumen di bawah ini sesuai dengan kaidah yang benar
summarise(selected_data, meansales = mean(Sales), mediansales = median(Sales), sdsales = sd(Sales))


# ============================================================================ #
# Perbaikilah format penulisan kode di bawah ini agar sesuai dengan yang diajarkan mengenai best practice code using R
set.seed(123)
df <- data.frame(data = mydata)
head(x = df)

# Basic histogram
ggplot(df, aes(x = ShippingCost)) + geom_histogram()

# Change the width of bins
df %>% ggplot(aes(x = ShippingCost)) 
  + geom_histogram(binwidth = 1)

# Change colors
plot <- df %>% ggplot(aes(x = ShippingCost)) + 
  geom_histogram(color = "black", fill = "white")
plot

mu <- ddply(df,"OrderPriority",summarise,grp.mean=mean(Sales))

head(mu)

plot <- ggplot(df, aes(x = Sales, color = OrderPriority)) + 
  geom_histogram(fill = "white", position = "dodge") +
  geom_vline(data = mu, 
             aes(xintercept = grp.mean, color = OrderPriority), 
             linetype="dashed") + xlim(0,100) 
plot

# Continuous colors
plot + scale_color_brewer(palette="Paired") + 
  theme_classic() + theme(legend.position="top")

# Discrete colors
plot + scale_color_brewer(palette = "Dark2") + theme_minimal() + 
  theme_classic() + 
  theme(legend.position = "top")

# Gradient colors
plot + scale_color_brewer(palette = "Accent") + 
  theme_minimal() + theme(legend.position = "top")
