### 4. R 에게 줄 수 있는 자료들 -1

## 1) 숫자형과 주요 산술 연산자
print(5/2)
print(5%/%2)
print(5%/%2)     # 나눗셈의 몫을 구해준다.
print(5%%2)      # 나눗셈의 나머지를 구해준다.
                 # 3의 배수는 x%%3의 값이 0이 되는 수.
print(5^2)
print(5*5)

print(1+2*3)
print((1+2)*3)

print(100000+100000)
2e+05        # 2 * 10의 5승.
1/1000000
1e-06        # 1 / 10의6승.
1/10000
1/1000

print('1'+'2')     # '' 이 표시는 문자를 표현하기에 문자를 더하는것은 적용할수 없다.
as.numeric('1') + as.numeric('2')


## 2) 문자형
'first'
"second"       # 작은 다움표, 큰 다움표는 R에서 상관없이 적용된다.
first          # 다움표 없이 그냥 사용하면 변수 이름으로 인식해서 에러가 난다.
first <- 1     # first 변수에 1이라고 지정해주면 다음부터는 first가 1로 인식한다.
first

class(1)
class('1')


## 3) TRUE / FALSE 값 (진리값)
3 & 0     # 논리식의 &이다.
3 & 3
3 & 1
3 | 0
!0
!3
class(!0)


## 4) NA 형 & NULL 형
cat(1,NA,2)          # NA가 그대로 출력된다.
cat(1,NULL,2)        # NULL 값이 제거되고 출력된다.

sum(1,NA,2)          # NA를 더하니까 결과가 NA로 출력된다.
sum(1,NULL,2)        # NULL 값은 제외 해버리고 나머지 값만 더해서 결과가 나온다.
sum(1, NA, 2,na.rm = T)

class(NA)
class(NULL)


## 5)Factor 형
setwd('D:/Workspace/R_Data_Anailysis/part3/data')
txt1 <- read.csv("factor_test.csv")
txt1 <- read.csv("factor_test.csv")
txt1

factor1 <- factor(txt1$blood)
factor1

summary(factor1)
gender1 <- factor(txt1$sex)
gender1

view(txt1)
View(txt1)


## 6) 날짜와 시간
# 기존 방법으로 날짜와 시간 제어하기
Sys.Date()
sys.date()
Sys.date()
Sys.Date()              # 2019-05-30 기본표현. 바꾸고 싶으면 뭔가를 해야한다.
Sys.time()
Sys.Time()
Sys.time()
date
date()
Class(Sys.Date())
class(Sys.Date())
classs("2019-05-30")   # 문자열로 쓰면 연산이 불가능하다. 그래서 연산을 하기 위해서 문자열을 쓰지 않는다.

as.Date("01-11-2013", format="%d-%m-%Y")            # Y 대문자면 년도를 4자리, 소문자면 년도가 2자리.
as.Date("01-11-2013", format= "%y-%m-%d")
as.Date("01-11-2013", format= "%y-%m-%d")
as.Date("2013년10월9일", format= "%Y년 %m월 %d일")
as.Date("05-30", format= "%m-%d")
as.Date(10, origin= "2019-05-30")
as.Date(20, origin=date())                           # origin= 문자열만 가능하다. 
as.Date(-10, origin= "1990-10-09")
"2019-05-30" - "2019-05-27"                          # 문자열이기 때문에 연산이 되지 않음.
as.Date("2019-05-30") - as.Date("2019-05-27")        #이런식으로 바꿔줘야 한다.
as.Date("2019-05-30") + 20
as.Date("2019-11-14") - as.Date("2019-05-30")
as.Date("2019-11-14") - Sys.Date("2019-05-30")
as.Date("2019-11-14") - Sys.Date()
as.Date("2014-11-11 20:00:00") - as.Date("2014-11-11 18:30")
as.POSIXct("2014-11-11 20:00:00") - as.POSIXct("2014-11-11 18:30")     # as.POSIXct는 시분초까지 다 계산된다.

# lubridate 패키지로 날짜와 시간 제어하기
install.packages("lubridate")
library(lubridate)

now()
date <- now()
year(date)
month(date)
month(date)
month(date, label= T)
day(date)
wday(date)     # 날짜에 요일을 추가 일=1, 월=2, 화=3, 수=4, 목=5, 금=6, 토=7
wday(date, label = T)
date <- date - days(2); date
date+months(3)
date <- hm("22:30") ; date
date <- hms("22:30:05") ; date
