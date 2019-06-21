# 반복문
# while 보통 사용함 제한적이지 않음
# for 횟수를 정해놓고 사용(제한적)

# while, 조건식에 영향이 가는 놈을 꼭 써줘라, 그래야 무한 반복 안한다.
no <- 0     # 여기까지 실해하면 n == 0
while (no < 10) {
  print(no)
  no <- no+1;
}     # 여기실행을 하면 n==10 이 된다.

no <- 0     # 여기까지 실해하면 n == 0
while (no < 10) {
  print(no)
  if(no==4) {
    break
  }
  no <- no+1;
}     # break가 걸려서 no == 4 이다.

no <- -1
while (no <=10) {
  no <- no + 1
  if(no %% 2 == 1)
    next
  print(no)
}

for (i in 1:10) {
  print(i)
}

sum <- 0
for (i in 1:100) {
  sum <- sum + i
}
print(sum)

sum <- 0
for (i in 1:100) {
  if (i %% 3 == 0)
    sum <- sum + i
}
print(sum)

multiple <- function(limit, number) {
  sum <- 0
  for (i in 1:limit) {
    if (i %% number == 0)
      sum <- sum + i
  }
  return(sum)
}
multiple(1000, 4)

library(stringr)
for (i in 1:5) {
  line <- ''
  for(k in 1:i) {
    line <- str_c(line, '#')
  }
  print(line)
}
for (i in 5:1) {
  line <- ''
  for(k in 1:i) {
    line <- str_c(line, '#')
  }
  print(line)
}

while (T) {
  for (i in 1:4) {
    line <- ''
    for(k in 1:i) {
      line <- str_c(line, '#')
    }
    print(line)
  }
  for (i in 1:5) {
    line <- ''
    if (i != 1) {
      for (k in 1:(i-1))
        line <- str_c(line, ' ')
    }
    for (k in i:5) {
      line <- str_c(line, '#')
    }
    print(line)
  }
  break;
}

# while

no <- 0
while (no<5) {
  print(no)
  no <-no+1
}



# for
# 1부터 10까지의 합
for( 변수 in 초기값 : 끝나는값 : 증가분)
  for (i in 1:10) {
    print(i)
  }
sum(1:10)

# 1부터 100까지의 합
sum <- 0     # 더하기는 초기값을 0으로 설정, 곱하기는 1로 설정
for(i in 1:100) {
  sum <- sum+i
}
print(sum)

# 1부터 100까지 3의 배수의 합
sum <- 0     
for(i in 1:100) {
  if(i%%3==0) {
    sum <- sum+i  
  }
}
print(sum)

# 1부터 1000가지 4의 배수의 합
sum <- 0
for (i in 3:1000) {
  if( i%% 4 == 0)
    sum <- sum+i
}
print(sum)

# 1부터 1000가지 4의 배수의 합
multiple <- function(limit, number) {
  sum <- 0
  for (i in 1:limit) {
    if(i %% number == 0)
      sum <- sum+i
  }
  print(sum)
}
multiple(1000,4)

color <- c()
for(i in 1:length(my_ray4)) {
  if(my_ray4[i] >= 10) {
    colores <- c(colores,"red")
  } else if(my_ray4[i] >=6) {
    colors <- c(colors,"Yellow")
  } else {
    colors <- c(colors,'green')
  }
}

library(stringr)
for (i in 5:1) {
  line <- ''
  for(k in 1:i) {
    line <- str_c(line, '#')
  }
  print(line)
}

for (i in 1:5) {
  line <- ''
  if(i !=1) {
    for(k in 1:(i-1))
      line <- str_c(line, '')
  } 
  for(k in i:5) {
    line <- str_c(line, '#')
  }
  print(line)
}

for (i in 1:5) {
  
}

# 연습문제
#1. 구구단
for (i in 2:9) {
  line <- str_c(i, '단')
  print(line)
  for (k in 1:9) {
    line <- str_c(i, ' * ', k, ' = ', i*k)
    print(line)
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


