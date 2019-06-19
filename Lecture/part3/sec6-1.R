# Vector
# vector는 모든 데이터 형태가 똑같아야 한다.

c(1,2,3,4,5)
c(1,2,3,4,"5")    # 하나만 해도 전체가 적용이 된다.
vec1 <- c(1,2,3,4,5)      # 묶어서 사용할수 있음
vec1
vec1[3]     # 3이라는 숫자를 index라 부른다.
vec1[-3]     # -3은 세번째만 배고 보여주는것
vec1[1:3]
length((vec1))    # vector의 길이를 알아보는것.
vec1[1:(length(vec1)-2)]
vec1[length(vec1)]    # 제일 끝 자리가 나옴
vec1[-1:-3]     # 1에서 3까지 빼고 나머지가 나옴
vec1[2:4]
vec1[2] <- 6; vec1     # 특정한 변수 값을 바꾼다.
vec1
vec1 <- c(vec1,7); vec1    # vector 값을 주고 7를 하나더 주는것.
vec1[7] <- 8; vec1
vec1[9] <- 9; vec1
append(vec1,10,after=3)     # 3은 index. 세번째 자리 다음에 10 나와라.
append(vec1,c(10,11),after=6)
vec <- append(vec1,c(10,11),after=6)
rm(vec)
vec1 <- append(vec1,c(10,11),after=6); vec1
append(vec1, 100, after=0)     # 제일 앞에 100 나와라
c(1,2,3) + c(4,5,6)     # 같은 인덱스끼리 더한다.
c(1,2,3) + 1    # 각각에 1을 더한다.
var1 <- c(1,2,3)
var2 <- c(4,5,6)
var1+var2
var3 <- c('3', '4', '5'); var3
var1 + var3     # var1은 숫자, var3는 캐릭터, 데이터 타입이 다르기 때문에 연산이 안된다.
union(var1, var3)
var4 <- c(1,2,3,4,5)
var1; var4
var1 + var4     # 결과는알려주는데 앞으로 이렇게 하지마.
var5 <- c(1,2,3,4,5,6)
var1 + var5

var1 - var2
var2 <- c(3,4,5)
var1 - var2
setdiff(var1, var2)
setdiff(var2, var1)
intersect(var1, var2)
fruits <- c(10,20,30); fruits
names(fruits) <- c('apple', 'banana', 'mango')
fruits
var5 <- seq(1:6); var5
var6 <- seq(2,-2); var6
var6
even <- c(2,4,6,8,10)
even
even <- seq(2,10,2); even    # 안쓰면 1,-1 로 인식. 이것은 2씩 증가
odd <- seq(1,10,2); even

var8 <- rep(1:3, 2); var8    # 2번 반복해라
var9 <- rep(1:3, each=2); var9     # 2번씩 반복해라

5 %in% even    # even에 5가 포함되어있는지 물어보는것, 5가 포함되지 않아서 False
4 %in% even    # even에 4가 포함되어있는지 물어보는것, 4가 포함되서 True

# 백터형 연습문제 1번
date4 <- seq(from=as.Date('2015-01-01'), to=as.Date('2015-01-31'), by='day'); date4

# 백터형 연습문제 2번
vec1 <- c('사과', '배', '감', '버섯', '고구마'); vec1
vec1[-3]             

# 백터형 연습문제 2번
vec1 <- c('봄', '여름', '가을', '겨울'); vec1
vec2 <- c('봄', '여름', '늦여름', '초가을'); vec2
union(vec1,vec2)
setdiff(vec1,vec2)
intersect(vec1,vec2)
rm(list=ls())
