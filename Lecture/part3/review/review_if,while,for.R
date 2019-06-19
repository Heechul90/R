# 연습문제
#1. 구구단
library(stringr)

for (i in 2:9) {
  line <- str_c(i, '단')
  print(line)
  for (k in 1:9) {
    line <- str_c(i, ' * ', k, ' = ', i*k)
    print(line)
  }
}

for (i in 2:9) {
  line <- paste(i, '단')
  print(line)
  for(k in 1:9) {
    line <- paste(i, '*', k, '=', i*k)
    print(line)
  }
}

for(i in 2:9) {
  gugudan <- paste(i, '단')
  print(gugudan)
  for(k in 1:9) {
    ggg <- paste(i, '*', k, '=', i*k)
    print(ggg)
  }
}


#2. Diamond 그리기
while (T) {
  for (i in 1:4) {
    line <- ''
    if (i != 4) {
      for (k in 1:(3 - (i - 1)))
        line <- str_c(line, ' ')
    }
    for (k in 1:(2*i - 1))
      line <- str_c(line, '#')
    print(line)
  }
  for (i in 3:1) {
    line <- ''
    for (k in 1:(3 - (i - 1)))
      line <- str_c(line, ' ')
    for (k in 1:(2*i - 1))
      line <- str_c(line, '#')
    print(line)
  }
  break;
}

w <- 0
while(w<7) {
  w <- ' '
  print(w)
  w <- w+1
}

#3. 약수 구하는 함수
getDenominator <- function(x) {
  den <- c(1)
  if (x >= 2) {
    for (i in 2:x) {
      if (x %% i == 0)
        den <- c(den, i)
    }
  }
  return(den)
}
getDenominator(60)

##########################
#    for loop 추가
##########################
sum <- 0
for (i in seq(3,100,3)) {
  sum <- sum + i
}
print(sum)
for (i in seq(1,0,1)) {
  print(i)
}
for (i in c(1,3,5,7,9)) {
  print(i)
}