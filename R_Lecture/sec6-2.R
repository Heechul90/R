# Matrix

mat1 <- matrix(c(1,2,3,4))
mat1
mat2 <- matrix(c(1,2,3,4), nrow=2); mat2     # nrow 를 사용하여 2행을 만들라고 요청
mat3 <- matrix(c(1,2,3,4), nrow=2, byrow=T); mat3     # byrow=T 가로로 입력하라고 요청

rm(mat4)

mat3[1,1]     # 1행 1열 출력
mat3[1,]     # 1행을 출력
mat3[,1]     # 1열을 출력


mat4 <- matrix(seq(1:9), nrow=3, byrow=T); mat4
mat4 <- matrix(seq(1:9), nrow=3,); mat4
mat4 <- matrix(seq(1:9), nrow=3, byrow=T); mat4

# 새로운 행과 열을 추가
mat4 <- rbind(mat4,c(10,11,12)); mat4     # 행과열의 수가 맞아야 한다.
mat4 <- matrix(seq(1:9), nrow=3, byrow=T); mat4
mat4 <- rbind(mat4,c(10,11,12)); mat4
mat4 <- cbind(mat4,c(13,14,15,16)); mat4

mat5 <- matrix(c('a','b','c','d'), nrow=2, byrow=T); mat5

colnames(mat5) <- c('First', 'Second', 'Third')
mat5
mat5 <- cbind(mat5, c('e', 'f'))
mat5
colnames(mat5) <- c('First', 'Second', 'Third')
mat5


# Maxtrix형 연습문제
seasons <- matrix(c('봄','여름','가을','겨울'), nrow=2); seasons
seasons <- matrix(c('봄','여름','가을','겨울'), nrow=2, byrow=T); seasons

seasons(2,)
seasons[2,]
seasons[,1]
seasons[2,]
seasons[,2]

seasons_2 <- rbind(seasons,c('초봄', '초가을')); seasons_2

seasons_3 <- cbind(seasons_2, c('초여름', '초겨울', '한겨울')); seasons_3



# Array

array1 <- array(c(1:12), dim=c(4,3)); array1
array1 <- array(c(1:12), dim=c(4,3), byrow=T); array1     # byrow를 적용할수 없다.

array2 <- array(c(1:12), dim=c(2,2,3)); array2
array2

array2[1,1,2]


# List

# list1 <- list(name='James Seo, address='Seoul', tel='010-8706-4712', pay=500)

list1 <- list(name='홍길동', address='천국', tel='010-8706-4712', age=300)
list1
list1$name     # 리스트 안에 들어있는 키를 불러오는 것
list1$age
list1$address
list1[1:2]
list1$birthday <- '1719-05-30'
list1
list1$birthday <- NULL
list1
rm(list=ls())
