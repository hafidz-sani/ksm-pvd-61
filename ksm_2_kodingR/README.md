# KSM 2 PVD - Koding Rapi dengan R

Jum'at, 29 Oktober 2021

Acuan materi
1. [The tidyverse style guide](https://style.tidyverse.org/index.html)
2. [R Best Practices: R you writing the R way!](https://blog.quantinsti.com/r-best-practices-r-you-writing-the-r-way/)
3. [Beyond Basic R - Introduction and Best Practices](https://waterdata.usgs.gov/blog/intro-best-practices/)
4. [Best Practices for Writing R Code](https://swcarpentry.github.io/r-novice-inflammation/06-best-practices-R/)
5. [Basic Syntax Markdown](https://www.markdownguide.org/basic-syntax)


## Alokasi Folder dan File
1. Satu projek diletakkan dalam satu folder yang sama dan akses setiap file menggunakan relative path. Contoh :

```r
# GOOD
data_riset3 <- read.csv("data/riset3.csv", header = TRUE)

# BAD
data_riset3 <- read.csv("E:/Belajar Programming/R/Project/PVD/riset3/data/riset3.csv", 
						header = TRUE)
```

2. Antara input, source code dan output diletakkan dalam folder yang berbeda. 
3. Penamaan file sebaiknya sesuai dengan isinya dan menghindari karakter-karakter khusus dan whitespace

```r
# GOOD
rumus_estimasi_kepuasan.R
barplot_kepuasaan_data_jakarta.R

# BAD
rumus estimasi kepuasan.R
rumus_rumus.R
barplot.R
``` 


## Susunan Kode

1. Letakkan pemanggilan `library()` dan hard-coded variabel dibagian atas file.

```r
library(xlsx)
library(ggplot2)

file_data <- 'riset3.csv'
```

2. Gunakan identasi, 4-8 spasi

```r
# GOOD
if (tinggi == 145) {
	if (berat > 58) {
    	print("Overweight")
    } else {
    	print("Normal")
    }
}

# BAD
if (tinggi == 145) {
if (berat > 58) {
print("Overweight")
} else {
print("Normal")
}
}
```

3. Batasi panjang satu baris kode, disarankan maksimal 80 karakter dalam 1 baris kode.
4. Letakkan definisi function dibagian atas

```r
# GOOD
addNumber <- function(a, b) {
	a + b
}

subtractNumber <- function(a, b) {
	a - b
}

addNumber(2, 3)
subtractNumber(2, 3)

# BAD
addNumber <- function(a, b) {
	a + b
}
addNumber(2, 3)

subtractNumber <- function(a, b) {
	a - b
}
subtractNumber(2, 3)
```

5. Lakukan pengelompokkan pada code

```r
# GOOD
library(dplyr)
library(ggplot2)

file_input <- "riset3.csv"
file_output <- "barplot_kepuasan_data_jakarta.png"

data_riset3 <- read.csv(file_input)
head(data_riset3)

# BAD
library(dplyr)
library(ggplot2)
file_input <- "riset3.csv"
data_riset3 <- read.csv(file_input)
head(data_riset3)
file_output <- "barplot_kepuasan_data_jakarta.png"
```

## Syntax

#### Penamaan Variabel dan Function
- Nama variabel menggambarkan isi dari variabel atau function dan harus jelas

```r
# Good
day_one

# Bad
first_day_of_the_month
fdotm
do
```
- Jika memungkinkan, hindari penggunaan nama yang telah dipakai oleh R

``` r
# GOOD
lst < c(10, 20)
mean_x <- mean(x)

# BAD
c <- c(10, 20)
mean <- mean(x)
```

- Konsisten style dalam satu file.

```r
# camelCase
addNumber
dayOne

# snake_case
add_number
dayOne
```

#### Spasi
- Gunakan spasi setelah koma (sebelum koma tidak pakai spasi)

```r
# GOOD
x[, 1]

# BAD
x[,1]
x[ ,1]
x[ , 1]
```

- Jangan gunakan spasi didalam dan diluar pada tanda kurung ketika melakukan pemanggilan fungsi

```r
# GOOD
mean(x, na.rm = TRUE)

# BAD
mean (x, na.rm = TRUE)
mean( x, na.rm = TRUE )
```

- Gunakan spasi sebelum dan sesuda `()` ketika menggunakan `if`, `for`, dan `while`

```r
# GOOD
if (debug) {
	show(x)
}

# BAD
if(debug){
	show(x)
}
```

- Gunakan spasi setelah `()` ketika digunakan pada function

```r
# GOOD
function(x) {}
addNumber <- function(a,b) {}

# Bad
function (x) {}
function(x){}
```

- Inflix operator (`==`, `+`, `<-`, dll) harus dikelilingi oleh spasi

```r
# GOOD
height <- (feet * 12) + inches
mean(x, na.rm = TRUE)

# BAD
height<-feet*12+inches
mean(x, na.rm=TRUE)
```

#### Function
- Nama argumen hanya ditulis untuk argumen yang opsinal.

```r
# GOOD
mean(1:10, na.rm = TRUE)
data_riset3 <- read.csv("data/riset3.csv", header = TRUE)

# BAD
mean(x = 1:10, , FALSE)
mean(, TRUE, x = c(1:10, NA))
data_riset3 <- read.csv(file = "data/riset3.csv", header = TRUE)
```

- Hindari assignment pada pemanggilan function

```r
# GOOD
x <- complicated_function()
if (nzchar(x) < 1) {
	# do something
}

# BAD
if (nzchar(x <- complicated_function()) < 1) {
	# do something
}
```

- Gunakan `return()` hanya ketika ingin mengembalikan nilai ditengah-tengah function

```
# GOOD
findAbs <- function(x) {
	if (x > 0) {
		return(x)
	}
	x * -1
}
addNumber <- function(a, b) {
	a + b
}

# BAD
addNumber <- function(a, b) {
	return(a + b)
}
```


#### Control Flow
- Penulisan `if`, harus menggunakan identasi, `{` berada satu baris dengan deklarasi `if`, dan `}` berada pada akhir dan berdiri sendiri (kecuali terdapat `else`)

```r
# GOOD
if (y == 0) {
	if (x > 0) {
		log(x)
	} else {
    	message("x is negative or zero")
	}
} else {
	y^x
}

# BAD
if (y == 0) 
{
if (x > 0) {
	log(x)
} 
else {
    message("x is negative or zero")
}
} else {
	y^x
}
```

#### Long Lines
- Jika pemanggilan function terlalu panjang, pecah dalam beberapa baris

```r
# GOOD
do_something_very_complicated(
	something = "that",
	requires = many,
	arguments = "some of which may be long"
)

# BAD
do_something_very_complicated("that", requires, many, arguments,
                              "some of which may be long"
                              )
```

#### Assignment
Gunakan `<-` untuk assignment variabel dan gunakan `=` untuk assignment nilai parameter pada pemanggilan function

```r
# Good
x <- 5
mean_x <- mean(x, na.rm = TRUE)

# BAD
x = 5
x <- mean(x, na.rm <- TRUE)
```

#### Komentar
Hindari memberikan komentar pada sesuatu yang sudah jelas

```r
# GOOD

# Mengkatagorikan apakah seseorang memilki berat yang normal/overweight
if (tinggi < 145) {
	if (berat > 58) {
    	print("Overweight")
    } else {
    	print("Normal")
    }
}

# BAD

# Jika tinggi lebih kecil dari 145 cm
if (tinggi < 145) {
	# Jika berat lebih besar dari 58 kg, maka overwight. Jika lebih kecil maka normal.
	if (berat > 58) {
    	print("Overweight")
    } else {
    	print("Normal")
    }
}
```

Komentar juga sebaiknya diberikan pada syntax yang jarang dipakai atau sulit dimengerti. 


## Pipes
Pipes `%>%` sering digunakan ketika kita bekerja dengan library `dplyr`. Pipes ini berguna untuk meletakkan variabel yang berada disebelah kiri pipe menjadi argumen pertama pada fungsi yang ada disebelah kanan.

```r
data_riset3 %>% 
	select(index_x) %>%
    filter(index_x > 30) %>%
    mean()
```

Perintah diatas sama dengan

```r
mean(filter(select(data_riset3, index_x)), index_x > 30)
```

#### Spasi
Sebelum pipe harus memiliki spasi dan diikuti oleh baris baru. Baris baru diberikan indent

```r
# GOOD
iris %>%
	group_by(Species) %>%
	summarize_if(is.numeric, mean) %>%
    ungroup() %>%
    gather(measure, value, -Species) %>%
    arrange(value)

# BAD
iris %>% group_by(Species) %>% summarize_all(mean) %>%
ungroup %>% gather(measure, value, -Species) %>%
arrange(value)
```

#### Long Lines

```r
iris %>%
	group_by(Species) %>%
	summarise(
		Sepal.Length = mean(Sepal.Length),
    	Sepal.Width = mean(Sepal.Width),
    	Species = n_distinct(Species)
	) %>%
	filter(Sepal.Length > 2.5)  
```

#### Short Pipes

```r
# GOOD
iris %>% arrange(Species)

iris %>% 
  arrange(Species)

# RECOMMENDED
arrange(iris, Species)
```

#### Assignment

- Style 1

```r
iris_long <-
	iris %>%
	gather(measure, value, -Species) %>%
	arrange(-value)
```

- Style 2

```r
# RECOMMENDED
iris_long <- iris %>%
	gather(measure, value, -Species) %>%
	arrange(-value)
```

- Style 3

```r
iris %>%
	gather(measure, value, -Species) %>%
	arrange(-value) ->
	iris_long
```


## Ggplot (`+`)

#### Spasi
Sebelum `+` harus memiliki spasi dan diikuti oleh baris baru.

```r
# GOOD
iris %>%
	filter(Species == "setosa") %>%
	ggplot(aes(x = Sepal.Width, y = Sepal.Length)) +
	geom_point()

# BAD
iris %>%
	filter(Species == "setosa") %>%
	ggplot(aes(x = Sepal.Width, y = Sepal.Length)) +
    	geom_point()

# BAD
iris %>%
	filter(Species == "setosa") %>%
	ggplot(aes(x = Sepal.Width, y = Sepal.Length)) + geom_point()
```

#### Long Lines
Jika argumen dalam ggplot telalu banyak, pecah menjadi beberapa baris

```r
# GOOD
iris %>% 
	ggplot(aes(x = Sepal.Width, y = Sepal.Length, color = Species)) +
	geom_point() +
	labs(
		x = "Sepal width, in cm",
		y = "Sepal length, in cm",
		title = "Sepal length vs. width of irises"
	) 

# BAD
iris %>% 
	ggplot(aes(x = Sepal.Width, y = Sepal.Length, color = Species)) +
	geom_point() +
	labs(x = "Sepal width, in cm", y = "Sepal length, in cm", title = "Sepal length vs. width of irises") 
```

## R Markdown

1. Satu chunk code untuk satu output
2. Heading

```markdown
# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6
```
3. **Bold**, *Italic*, ***Bold Italic***, ~~Strikethrough~~

```markdown
**bold**
*italic*
***bold italic***
~~strikethrough~~
```

4. Escaping `backticks`

```markdown
`escaping this line`
```

[Aturan Lainnya](https://www.markdownguide.org/basic-syntax)

**Tambahan** : Gunakan library `rmdformats` untuk memperbagus hasil knit html. [Rmdformats](https://bookdown.org/yihui/rmarkdown/rmdformats.html)

## Tambahan

1. Hindari menggunakan `attach()`
2. Hindari menggunakan `file_choose`
3. Hindari menyimpan workspace ketika exit dari RStudio
4. Konsisten dalam satu file
