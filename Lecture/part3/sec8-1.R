# Function
?subset()    # 함수를 사용할줄 모를때 이용하면 된다.
# 수학적인 함수들. ex) cos x, cos()
# aggregate(), apply() 이 함수는 조금 어려울수도 있으니 잘 배우셈~!

vec1 <- c(1:5)
vec2 <- c('a','b','c','d','e')
max(vec1)     # 최대값을 구한다.
max(vec2)     # e가 알바벳중 제일 늦기 때문에 최대값이다.
min(vec1)     # 최소값을 구한다.
min(vec2)
mean(vec1)     # 평균값을 구한다.
mean(vec2)     # 인식하지 못한다. NA
sd(vec1)     # 표준편차를 구한다. 표준편차는 분산을 루트한 값이다
sum(vec1)     # 합을 구한다.
var(vec1)     # 분산값을 구한다.

library(googleVis)
Fruits
# aggregate(계산될컬럼~기준될컬럼, 데이터, 함수) 이렇게 입력한다.
aggregate(Sales~Year, Fruits, sum)      # 판매총액(계산될컬럼), 연도별(기준될컬럼)
aggregate(Sales~Year, Fruits, max)      # 최고판매액(계산될컬럼), 연도별(기준될컬럼)
aggregate(Sales~Year, Fruits, mean)      # 평균액(계산될컬럼), 연도별(기준될컬럼)
aggregate(Sales~Fruit, Fruits, sum)      # 총액(계산될컬럼), 품목별(기준될컬럼)
aggregate(Sales~Fruit, Fruits, max)      # 최고판매액(계산될컬럼), 품목별(기준될컬럼)
aggregate(Sales~Fruit+Year, Fruits, max)     #추가조건에는 기준될컬럼 뒤에 + 하면 된다.

# apply(데이터, 방향(1 이면 행 2이면 열), 함수) 어떤 함수를 지정할지를 내가 정한다.
mat1 <- matrix(c(1:6), nrow=2, byrow=T)
mat1
apply(mat1, 1, sum)    # apply(데이터, 방향, 함수) = mat1에서 행 방향으로 다 더하라.
apply(mat1, 2, sum)    # apply(데이터, 방향, 함수) = mat1에서 열 방향으로 다 더하라.
apply(mat1, 1, prod)    # apply(데이터, 방향, 함수) = mat1에서 행 방향으로 누적곱하라
apply(mat1[,c(2,3)],1 ,sum)    # apply(데이터, 방향, 함수) = mat1에서 행 방향으로 2컬럼,3컬럼을 다 더하라.

list1 <- list(Fruits$Sales); list1
list2 <- list(Fruits$Profit); list2

# lapply(c(데이터, 데이터), 함수)
lapply(c(list1, list2), max)     # list1, list2에서 각각 최대값을 구해서 list 형태로 출력하라.
sapply(c(list1, list2), max)     # list1, list2에서 각각 최대값을 구해서 데이터프레임 형태로 출력하라.
lapply(Fruits[,c(4,5)], max)
sapply(Fruits[,c(4,5)], max)

Fruits
tapply(Sales, Fruit, sum)     # attach(Fruits)를 하고 해야 에러가 안난다.
attach(Fruits)
tapply(Sales, Fruit, sum)     # Fruit 기준별로 판매액을 더하라
tapply(Sales, Year, sum)     # Year별로 판매액을 더하라

vec1 <- c(1:5)
vec2 <- seq(10,50,10)
vec3 <- seq(100,500,100)
vec1
vec2
vec3

mapply(sum, vec1, vec2, vec3)


# apply() 계열 함수 연습 문제
data1 <- read.csv('data1.csv') 
data1

apply(data1[,2:15], 2, sum)
apply(data1[,c(-1)], 1, sum)
apply(data1[,-1], 2, sum)

data2 <- read.csv('1-4호선승하차승객수.csv')
data2

attach(data2)
tapply(승차, 노선번호, sum)     # 승차를 더해라 노선번호별로
tapply(하차, 노선번호, sum)     # 하차를 더해라 노선번호별로
apply(data2[,3:4], 2, sum)     # data2에서 열 3번,4번에서 열을 더하라
sapply(data2[,c(3:4)],sum)     # data2에서 열 3번,4번에서 열을 더하라

# aggregate(계산될컬럼~기준될컬럼, 데이터, 함수) 이렇게 입력한다.
aggregate(승차+하차~노선번호, data2, sum)     # 승차,하차를 더해라 노선번호별로
aggregate(승차~노선번호, data2, sum)     # 승차를 더하라 노선번호별로
aggregate(하차~노선번호, data2, sum)     # 하차를 더해라 노선번호별로


apply(data2[,3:4], 2, sum)     # data2에서 열 3번,4번에서 열을 더하라
tapply(승차+하차, 노선번호, sum)

rm(list=ls())
