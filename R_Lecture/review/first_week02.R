# 작업용 데이터 가져 오기와 작업 후 저장 하기기

list.files()
setwd("D:\\Heechul\\R\\R_Lecture\\data")
lsit.files()
setwd("D:/Heechul/R/R_Lecture/data")
list.files()
list.files(recursive = T)     # 하위 디렉토리 내용까지 전부 출력
list.files(all.files=T)

# scan
scan <- scan('scan_1.txt')
scan
scan2 <- scan('scan_2.txt')
scan2
scan2 <- scan('scan_2.txt', what='')
scan2
scan3 <- scan('scan_3.txt', what='')
scan3
scan <- scan('scan_1.txt', what='')
scan
scan4 <- scan('scan_4.txt', what='')
scan4

# input
input <- scan()
input
input2 <- scan(what='')
input2
input3 <- readline()
input3
input4 <- readline("Are you OK?:")

# read.table
fruits <- read.table('fruits.txt')
fruits
fruits <- read.table('fruits.txt', header=T)
fruits
fruits2 <- read.table('fruits_2.txt')
fruits2
fruits2 <- read.table('fruits_2.txt', header=T); fruits2
fruits2 <- read.table('fruits_2.txt', skip=3); fruits2
fruits2 <- read.table('fruits_2.txt', skip=4); fruits2
fruits3 <- read.table('fruits.txt', header = T, nrow=2)
fruits3

# read.csv
fruit3 <- read.csv('fruits_3.csv')
fruit3
fruit4 <- read.csv('fruits_4.csv')
fruit4
fruit4 <- read.csv('fruits_4.csv', header = F)
fruit4
label <- c('NO', 'NAME', 'PRICE', 'QTY')
fruit4
fruit4 <- read.csv('fruits_4.csv', header=F, col.names=label)
fruit4

# read.csv.sql
install.packages('googleVis')
library(googleVis)
library()
libpaths()
install.packages()
update.packages()
.libPaths()
R_LIBS
Sys.getenv('R_LIBS')
.libPaths()
install.packages('googleVis')
.libPaths("C:/Program Files/R/R-3.6.0/library")
install.packages('googleVis')
.libPaths()
