var1 <- "aaa" ; var1
var2 <- 111; var2
var3 <- Sys.Date(); var3
var4 <- c("a", "b", "c"); var4
222 -> var5 -> var6
var5; var6;
var8 <- var9 <- 222

string1 <- "Very Easy R Programming"; string1
string2 <- "I'm James Seo"; string2
string3 <- 'He said, "I am single".'; string3
string4 <- "He said, \"I am single\"."; string4

comp <- c(1,"2")
comp   # 자동 형 변환
class(comp)

num1 <- 1
num2 <- 2
num1 + num2
char1 <- "a"
num1 + char1

seq1 <- 1:5    # 반드시 기억할것!!!!
seq1

seq2 <- 'a':'f'     # 문자는 적용되지 않는다. 숫자만 가능. 파이썬에서도 가능. 자바는 안됨.
date1 <- seq(from=as.Date('2014-01-01'), to=as.Date('2014-01-31'), by=1)
date1
date2 <- seq(from=as.Date('2014-01-01'), to=as.Date('2014-05-31'), by='month')
date2
date3 <- seq(from=as.Date('2014-01-01'), to=as.Date('2020-05-31'), by='year')
date3
objects()
.hidden <- 3
.hidden   # .으로 시작하는 변수는 변수창에 보이지 않는다. 하지만 실행은 된다.

rm(string2)     # 변수를 지우는 것   # 변수를 구지 지우는 경우는 없음. 
ls()     # 내가 사용하고 있는 변수를 다 보여준다.
rm(list = ls())     # 내가 사용하던 변수 다 삭제. 히든변수는 삭제되지 않는다.
