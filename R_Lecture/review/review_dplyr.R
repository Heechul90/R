install.packages('dplyr')
library(dplyr)

setwd('D:/Heechul/R/R_Lecture/data')
data1 <- read.csv('2013년_프로야구선수_성적.csv')
data1

# filter
data2 <- filter(data1, 경기>120)
data2
data3 <- filter(data1, 경기>120& 득점>80)
data3
data4 <- filter(data1, 포지션 %in% c('1루수', '3루수'))
data4

# select
select(data1, 선수명, 포지션, 팀)
select(data1, 순위:타수)
select(data1, -홈런, -타점, -도루)

# 여러문장을 조합해서 사용하는 방법인 %>%
data1 %>%
  select(선수명, 경기, 타수) %>%
  filter(타수>400)

# 오름차순, 내림차순순
data1 %>%
  select(선수명, 경기, 타수) %>%
  filter(타수>400) %>%
  arrange(타수)

data1 %>%
  select(선수명, 경기, 타수) %>%
  filter(타수>400) %>%
  arrange(desc(타수))

# mutate 함수
data1 %>%
  select(선수명, 경기, 타수) %>%
  mutate(경기x타수 = 경기*타수) %>%
  arrange(타수)

# summarise 와 group_by
data1 %>%
  group_by(팀) %>%
  summarise(avarage = mean(경기, na.rm = T)

data1 %>%
  group_by(팀) %>%
  summarise_each(funs(mean), 경기, 타수)

data1 %>%
  group_by(팀) %>%
  summarise_each(funs(mean,n()), 경기, 타수)

# 412p 연습문제
install.packages('googleVis')
library(googleVis)
attach(Fruits)

# 연습문제 1
Fruits
filter(Fruits, Expenses>80)

# 연습문제 2
filter(Fruits, Expenses>90 & Sales >90)

# 연습문제 3
filter(Fruits, Expenses > 90 | Sales > 80)

# 연습문제 4
filter(Fruits, Expenses %in% c(79,91))

# 연습문제 5
select(Fruits, Fruit: Sales, -Location)

# 연습문제 6
Fruits %>%
  group_by(Fruit) %>%
  summarise_each(funs(sum), Sales)

# 연습문제 7
Fruits %>%
  group_by(Fruit) %>%
  summarise_each(funs(sum), Sales, Profit)

# dplyr 연습문제 (mpg)
install.packages('ggplot2')
library(ggplot2)
mpg

# 문제 1
mpg1 <- filter(mpg, displ<=4)
mpg1
mpg11 <- filter(mpg, displ>=5)
mpg11
mean(mpg1$hwy); mean(mpg11$hwy)

# 선생님 풀이
mpg01 <- filter(mpg, displ <= 4)
mpg011 <- filter(mpg, displ >= 5)
mean(mpg01$hwy); mean(mpg011$hwy)

# 문제 2
mpg2 <- mpg %>%
  group_by(manufacturer) %>%
  filter(manufacturer %in% c('audi', 'toyota')) %>%
  summarise_each(funs(mean), cty)
mpg2

# 선생님 풀이이
mpg02 <- filter(mpg, manufacturer=='audi')
mpg022 <- filter(mpg, manufacturer=='toyota')
mean(mpg02$cty); mean(mpg022$cty)

mpg %>%
  filter(manufacturer %in% c('audi', 'toyota')) %>%
  group_by(manufacturer) %>%
  summarise(average = mean(cty))

# 문제 3
mpg3 <- mpg %>%
  filter(manufacturer %in% c('chevrolet', 'ford', 'honda')) %>%
  summarise_each(funs(mean), hwy)
mpg3

# 선생님 풀이이
mpg %>%
  filter(manufacturer %in% c('chevrolet', 'ford', 'honda')) %>%
  summarise(average = mean(hwy))

# 문제 4
mpg4 <- select(mpg, cty, class)
head(mpg4)
tail(mpg4)

# 선생님 풀이이
mpg04 <- select(mpg, class, cty)
head(mpg04); tail(mpg04)

# 문제 5
mpg5 <- mpg4 %>%
  group_by(class) %>%
  filter(class %in% c('suv', 'compact')) %>%
  summarise_each(funs(mean), cty)
mpg5

# 선생님 풀이 
mpg4 %>%
  filter(class %in% c('suv', 'compact')) %>%
  group_by(class) %>%
  summarise(average = mean(cty))

# 문제 6
mpg6 <- mpg %>%
  filter(manufacturer == 'audi') %>%
  select(manufacturer, model, hwy) %>%
  arrange(desc(hwy)) %>%
  head(5)
mpg6

# 선생님 풀이이
mpg %>%
  filter(manufacturer == 'audi') %>%
  select(manufacturer, model, hwy) %>%
  arrange(desc(hwy)) %>%
  head(5)

# 문제 7
mpg
# 7-1
mpg7_1 <- mpg %>%
  mutate(합산연비변수 = hwy+cty)
mpg7_1

# 선생님 풀이 
mpg_new <- mpg %>%
  mutate(cty_hwy = cty + hwy)
mpg_new

# 7-2
mpg7_2 <- mpg7_1 %>%
  mutate(평균연비변수= 합산연비변수 / 2)
mpg7_2

# 선생님 풀이 
mpg_new <- mpg_new %>%
  mutate(ch_avg = cty_hwy /2)
mpg_new

# 7_3
mpg7_3 <- mpg7_2 %>%
  arrange(desc(평균연비변수)) %>%
  head(3)
mpg7_3

# 선생님 풀이 
mpg_new %>%
  arrange(desc(ch_avg)) %>%
  head(3)

# 7_4
mpg7_4 <- mpg %>%
  mutate(합산연비변수= cty+hwy, 평균연비변수= 합산연비변수/2) %>%
  arrange(desc(평균연비변수)) %>%
  head(3)
mpg7_4

# 선생님 풀이
mpg %>%
  select(-displ:-drv) %>%
  mutate(cty_hwy = cty + hwy, ch_avg = cty_hwy/2) %>%
  arrange(desc(ch_avg)) %>%
  head(3)

# 문제 8
mpg8 <- mpg %>%
  group_by(class) %>%
  summarise_each(funs(mean), cty)
mpg8

# 선생님 풀이 
mpg %>%
  group_by(class) %>%
  summarise(average = mean(cty))


# 문제 9
mpg9 <- mpg %>%
  group_by(class) %>%
  summarise_each(funs(mean), cty) %>%
  arrange(desc(cty))
mpg9

# 선생님 풀이 
mpg %>%
  group_by(class) %>%
  summarise(average = mean(cty)) %>%
  arrange(desc(average))

# 문제 10
mpg10 <- mpg %>%
  group_by(manufacturer) %>%
  summarise_each(funs(mean), hwy) %>%
  arrange(desc(hwy)) %>%
  head(3)
mpg10

# 선생님 풀이 
mpg %>%
  group_by(manufacturer) %>%
  summarise(average = mean(hwy)) %>%
  arrange(desc(average)) %>%
  head(3)

# 문제 11
mpg11 <- mpg %>%
  group_by(manufacturer) %>%
  filter(class== 'compact') %>%
  summarise_each(funs(n()), class) %>%
  arrange(desc(class))
mpg11

# 선생님 풀이
mpg %>%
  filter(class == 'compact') %>%
  group_by(manufacturer) %>%
  summarise(count = n()) %>%
  arrange(desc(count))
