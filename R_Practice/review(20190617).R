mf1<- function(x) {
  if(x>0) {
    x <- x*x
    return(x)
  } else {
    x <- 0 
    return(x) } 
}
mf1(2)
mf1(5)
mf1(-1)

mf2 <- function(x) {
  if(x>0) {
    x <- x*2
    return(x)
  } else if(x==0) {
    x <- 0
    return(x)
  } else {
    x <- x*2
    return(x)
  }
}
mf2(0)
mf(-1)
mf2(-1)
mf2(-4)

myf1 <- function(x) {
  if(x>5) {
    x <- 1 
    return(x)
  } else {
    x <- 0
    return(x)
  }
}
myf1(6)
myf1(1)

myf2 <- function(x) {
  if(x>=0) {
    x <- 1
    return(x)
  } else {
    x <- 0
    return(x)
  }
}
myf2(34)
myf2(-21)

myf3 <- function(a,b) {
  if(a>b) {
    c <- a-b
    return(c)
  } else if(b>a) {
    c <- b-a
    return(c)
  }
}
myf3(5,3)
myf3(2,9)

myf4 <- function(x) {
  if(x<0) {
    x <- 0
    return(x)
  } else if (x>=0 & x<5) {
    x <- 1
    return(x)
  } else {
    x <- 10
    return(x)
  }
}
myf4(-1)
myf4(0)
myf4(5)
myf4(4.9999999)


myf5 <- function(x) {
    if (x == 'Y' | x == 'y') {
      return('Yes')
    } else {
      return('Not Yes')
    }
  }


myf5('y')
  
for3 <- function(z) {
  for(i in 1:z*10) {
    print(i)
  }
}
for3(5)
for3(9)
