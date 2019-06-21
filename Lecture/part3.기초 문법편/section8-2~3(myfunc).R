### 8. 데이터를 원하는 대로 변형하기 - 다양한 함수 사용법

## 2) 많이 사용되는 수학 관련 주요 함수들 사용하기

mat1 <- matrix(c(1:6), nrow=2, byrow=T)
mat1
a <- c(1,1,1)
sweep(mat1, 2, a)     # mat1에서 각 행을 a의 값으로 빼라.
b <- matrix(c(2,2))
b
sweep(mat1, 1, b)     # mat1에서 각 열을 b의 값으로 빼라.

a <- c(1:5); length(a)
length(mat1)
mat1
library(googleVis)
length(Fruits)
Fruits
length(mat1)

log(x)          # 로그계산
log10(x)        # 상용로그 계산
sin(pi)
ceiling(2.3)    # 위쪽으로 가장 낮은 정수
floor(2.3)      # 아래쪽으으로 가장 높은 정수

ceiling(-4.5)
round(2.5)       # 반올림해주는 함수.
round(2.6)
choose(5, 3)     # nCr = n! / r!*(n-r)!   -> 5C3 = 5! / 3!*(5-3)!


## 3) 함수를 직접 만들어서 사용하기 - 사용자 정의 함수
myfunct<- function() {
  return(10)
}
myfunct()

myfunct2 <- function(x) {
  y = x * x;
  return(y)
}
myfunct2(-3)


### 사용자 정의 함수 연습 문제
# 연습문제 1
func_test1 <- function(a, b) {
  c = a - b
  return(c)
}
func_test1(3,2)
func_test1(2,3)

# 연습문제 2
func_test2 <- function(a,b){
  c = a-b
  return(abs(c))
}
func_test2(3,2)
func_test2(2,3)

func_test3 <- function(a,b) {
  c = abs(func_test1(a,b))
  return(c)
}

func_test1(3,2)
func_test1(2,-3)
func_test3(2,-3)

