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
# 구구단만들기
for (i in 1:9) {
  line <- str_c(line,i)
print(line)
  }

ex1 <- function(x) {
  if(x==2) {
    for(i in 1:9)
      gugu <- sum+i
  }
  print(gugu)
} 
ex1(2)

ex1 <- function(x) {
  if(x==2) {
    for (i in 1:9) {
      print(cat(x, '*', i, '=', (i*x)))
    }
  }
  if(x==3) {
    for (i in 1:9) {
      print(cat(x, '*', i, '=', (i*x)))
    }
  }
  if(x==4) {
    for (i in 1:9) {
      print(cat(x, '*', i, '=', (i*x)))
    }
  }
  if(x==5) {
    for (i in 1:9) {
      print(cat(x, '*', i, '=', (i*x)))
    }
  }
  if(x==6) {
    for (i in 1:9) {
      print(cat(x, '*', i, '=', (i*x)))
    }
  }
  if(x==7) {
    for (i in 1:9) {
      print(cat(x, '*', i, '=', (i*x)))
    }
  }
  if(x==8) {
    for (i in 1:9) {
      print(cat(x, '*', i, '=', (i*x)))
    }
  }
  if(x==9) {
    for (i in 1:9) {
      print(cat(x, '*', i, '=', (i*x)))
    }
  }
}
ex1(7)

# 구구단 만들기
ex11 <- for(i in 2:9) {
  for(k in 1:9) {
    print(cat(i, '*', k, '=', (i*k)))
  }
}

# 선생님이한것.
for (i in 2:9) {
  line <- str_c(i, '단')
  print
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

ex2 <- for(i in 1:7) {
  blank <- ''
  
}
ex2
