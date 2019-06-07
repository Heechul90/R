setwd("D:/Heechul/R_Lecture/data")
getwd()

txt1 <- read.csv("factor_test.txt")
txt1
factor1 <- factor(txt1$blood)
factor1
factor2 <- factor(txt1$name)
factor1
factor2
factor3 <- factor(txt1$sex); factor3
summary(factor1)
summary(factor2)
summary(factor3)

c(1,2,3,4,5)
c(1:10)
vec1 <- c(1:5)
vec1
vec1(3)
vec1[3]
vec1[-3]
vec1 <- c('사과', '배', '감', '버섯', '고구마')
vec1
vec1[-3]
vec1 <- c('봄', '여름', '가을', '겨울')
vec2 <- c('봄', '여름', '늦여름', '초가을')
vec1
vec2
union(vec1, vec2)
setdiff(vec1, vec2)
intersect(vec1, vec2)

# Matrix
mat1 <- matrix(c(1:4))
mat1
mat2 <- matrix(c(1:4), nrow=2)
mat2
mat3 <- matrix(c(1:4), nrow=2, byrow=T); mat3

mat4 <- matrix(c(1:9), nrow=3, byrow=3); mat4
mat4 <- rbind(mat4, c(10:12))
mat4
mat4 <- cbind(mat4, c(13, 14, 15, 16)); mat4
mat4 <- rbind(mat4, c(12, 12, 12, 12))
mat4
mat4 <- rbind(mat4, c(1, 2, 3, 4))
mat4

mat5 <- matrix(c('a', 'b', 'c', 'd'), nrow=2, byrow=T); mat5
mat5 <- cbind(mat5, c('e', 'f')); mat5
colnames(mat5) <- c('First', 'Second', 'Third'); mat5

# Matrix형 연습문제
seasons <- matrix(c('봄', '여름', '가을', '겨울')); seasons
seasons <- matrix(c('봄', '여름', '가을', '겨울'), nrow=2); seasons
seasons <- matrix(c('봄', '여름', '가을', '겨울'), nrow=2, byrow=T); seasons
seasons[,2]
seasons2 <- rbind(seasons, c('초봄', '초가을')); seasons2
seasons3 <- cbind(seasons2, c('초여름', '초겨울', '한겨울')); seasons3

# list
list <- list(name='James Seo', address='Seoul', tel='010-4250-4296', pay=500)
list     # $name 이 부분을 key라 하고, "James Seo" 부분을 Value라고 부른다.
list$name
list$ tel
list$birthday <- '1990-10-09'
list
list$tel <- NULL
list

# data.frame
no <- c(1:4)
name <- c('Apple', 'Peach', 'Banana', 'Grape')
price <- c(500, 200, 100, 50)
qty <- c(5, 2, 4, 7)
sales <- data.frame(NO=no, NAME=name, PRICE=price, QTY=qty)
sales

sales2 <- matrix(c(1, 'Apple', 500, 5, 2, 'Peach', 200, 2,3, 'Banana', 100, 4, 4, 'Grape', 50, 7
                 ), nrow=4, byrow=T); sales2
df1 <- data.frame(sales2)
df1
names(df1) <- c('NO', 'NAME', 'PRICE', 'QTY'); df1
df1
df1
sales
subset(sales, qty<5)

no <- c(1,2,3)
name <- c('apple', 'banana', 'peach')
price <- c(100, 200, 300)
df1 <- data.frame(NO=no, NAME=name, PRICE=price)
df1
no <- c(10,20,30)
name <- c('train', 'car', 'airplane')
price <- c(1000, 2000, 3000)
df2 <- data.frame(NO=no, NAME=name, PRICE=price)
df2
df3 <- cbind(df1, df2); df3
df4 <- rbind(df1, df2); df4
df1 <- data.frame(name=c('apple', 'banana', 'cherry'),
                  price=c(300, 200, 100)); df1
df2 <- data.frame(name=c('apple', 'cherry', 'berry'),
                  qty=c(10, 20, 30)); df2
df1; df2
merge(df1,df2)    # 공통으로 들어있는 것만 출력함
merge(df1, df2, all=T)    # 데이터가 없는것도 모두 나오게 출력함
cbind(df1, df2)
rbind(df1, df2)

rm(list=ls())
