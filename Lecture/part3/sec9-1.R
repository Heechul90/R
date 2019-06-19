# 조건문과 반복문

myAbs <- function(x) {
  if (x >= 0) {
    return(x)
  } else {return(-x)
  }
 }
myAbs(-3,2)  


myAbs <- function(x) {
  if (x>=0) {
    return(x)
  } else {
    return(-x)
  }
}
myAbs(-2)

myF1 <- function(x) {
  if (x>0) {
    return(x*x)
  } else {
    return(0)
  }
}
myF1(4.6)

# 예 3
myF2 <- function(x) {
  if(x>0) {
    return(2*x)
  } else if(x==0) {
    return(0)
  } else {
    return(2*x)
  }
}
myF2(4.6)
myF2(0)
myF2(-4)


# ifelse 문
# ifelse(a,b,c) a가 참이면 b를 출력하고 거짓이면 c를 출력.

number <- scan()
result <- ifelse(number%%2 == 0, '짝수', '홀수')
result
number
result
number <- scan()
scan
number
result <- ifelse(number%%2 == 0, '짝수', '홀수')
result

# 연습문제 1
myf1 <- function(x) {
  if(x>5) {
    return(1) 
  } else {
    return(0)
  }
}
myf1(6)
myf1(3)
# return(ifelse(x>5, 1, 0))

# 연습문제 2
myf2 <- function(x) {
  if(x>=0) {
    return(1)
  } else {
    return(0)
  }
}
myf2(12)
myf2(-12)


# 연습문제 3
myf3 <- function(a, b) {
  if(a>b) {
    return(a-b)
  } else {
    return(b-a)
  }
}
myf3(4,5)
myf3(7,-3)

# 연습문제 4
myf4 <- function(x) {
  if(x<0) {
    return(0)
  } else if(x>= | x<=5) {
    return(1)
  } else if(x>5) {
    return(10)
  } else {
    return(-1)
  }
}
myf4(7)


# 연습문제 5
myf5 <- function(input) {
  if (input =='Y' || input =='y') {
    return('Yes')
  } else {
    return('Not Yes')
  }
}
  
ans <- scan(what='')
myf5('y')  

