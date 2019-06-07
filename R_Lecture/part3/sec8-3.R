# 중요한 부분분

install.packages('googleVis')
library('googleVis')

# sort
sort1 <- Fruits$Sales
sort1
sort(sort1)     # 오름차순으로 정리해서 출력
sort(sort1, decreasing = T)     # 내림차순으로 정리해서 출력

# plyr
install.packages('plyr')
library('plyr')
fruits <- read.csv("fruits_10.csv", header = T)
fruits
ddply(fruits,'name', summarise,sum_qty=sum(qty), sum_price=sum(price))
ddply(fruits,'name', summarise,max_qty=max(qty), min_price=min(price))
ddply(fruits, c('year', 'name'), summarise,max_qty=max(qty), min_price=min(price))
ddply(fruits,'name', transform,sum_qty=sum(qty), pct_qty=(100*qty)/sum(qty))

# dplyr
install.packages('dplyr')
library('dplyr')
data1 <- read.csv("2013년_프로야구선수_성적.csv")
data1

# filter 기능능
data2 <- filter(data1, 경기>120)     # data1에서 경기수가 120 이상인 선수 출력
data2
data3 <- filter(data1, 경기>120 & 득점>80); data3     # data1에서 경기수가 120 이상이고 득점이 80 이상인 선수 출력
data4 <- filter(data1, 포지션=='1루수'| 포지션=='3루수')     # data1에서 1루수나 3루수에 속한 선수 출력
data4 <- filter(data1, 포지션 %in% c('1루수', '3루수'))     # or는 두가지 방법이 있으니 선택해서 사용
data4
select(data1, 선수명, 포지션, 팀)     # 선수명, 포지션, 팀만 출력
select(data1, 순위:타수)     # 순위부터 타수까지 출력
select(data1, -홈런, -타점, -도루)     # 홈런, 타점, 도루 빼고 출력
data1 %>%
  select(선수명, 팀, 경기, 타수) %>% 
  filter(타수>400)     # %>% 400타수 이상인 선수들의 선수명, 팀, 경기, 타수를 출력

data1 %>%
  select(선수명, 팀, 경기, 타수) %>%
  filter(타수>400) %>%
  arrange(타수)     # %>% 400타수 이상인 선수들의 선수명, 팀, 경기, 타수의 오름차순으로 출력

data1 %>%
  select(선수명, 팀, 경기, 타수) %>%
  filter(타수>400) %>%
  arrange(desc(타수))     # %>% 400타수 이상인 선수들의 선수명, 팀, 경기, 타수의 내림차순으로 출력

data1 %>%
  select(선수명, 팀, 출루율, 장타율) %>%
  mutate(OPS = 출루율+장타율) %>%
  arrange(desc(OPS))     # 선수명, 팀, 출루율, 장타율을 출력하고 OPS라는 변수를 하나 만드러 컬럼에 추가하고 OPS 내림차순으로 출력

data2 <- data1 %>%
  select(선수명, 팀, 출루율, 장타율) %>%
  mutate(OPS = 출루율+장타율) %>%
  arrange(desc(OPS))     # data1을 이렇게 가공해서 data2라는 새로운 데이터를 만들어 낼수 있다.
data2

data1 %>%
  group_by(팀) %>%
  summarise(avarage=mean(경기, na.rm = T))     # na.rm=T NA는 지우고 출력하라.

data1 %>%
  group_by(팀) %>%
  summarise_each(funs(mean),경기, 타수, 타율)     # 팀별로 각각 평균을 내라
# furs deprecated 

data1 %>%
  group_by(팀) %>%
  summarise_each(funs(mean,n()), 경기, 타수)

# dplyr 연습문제제
library("googleVis")
attach(Fruits)
Fruits
Fruits_2 <- filter(Fruits, Expenses>80)
Fruits_2
Fruits_3 <- filter(Fruits, Expenses>90, Sales>90)
Fruits_3
Fruits_4 <- filter(Fruits, Expenses>90|Sales>80)
Fruits_4
Fruits_5 <- filter(Fruits, Expenses %in% c(79,91))
Fruits_5 
select(Fruits, Fruit:Sales, -Location)
Fruits %>%
  group_by(Fruit) %>%
  summarise_each(funs(sum), Sales)

Fruits %>%
  group_by(Fruit) %>%
  summarise_each(funs(sum), Sales, Profit)
