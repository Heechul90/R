setwd('D:/Heechul/R/R_Lecture/test')
library(KoNLP)
library(wordcloud)
library(stringr)
library(ggplot2)
library(dplyr)
library(plyr)
library(reshape2)

## 1. 다음의 문장을 좀더 효율적으로 개선하시오.
#1-1
vec1 <- c(1:5)
vec1
vec2 <- c(10:5)
vec2
vec3 <- rep(1:3,each=2)
vec3
vec4 <- rep(c(1:3),2)
vec4
vec5 <- seq(1,11,2)
vec5

## 2. 다음과 같이 네 명의 학생이 중간 시험과 기말 시험을 봤다
# 2-1
name <- c('강경학', '김태균', '이성열', '정은원')
mid <- c(90,78,94,70)
final <- c(50,60,90,92)


df_source <- data.frame(name, mid, final)
df_source

colnames(df_source) <- c('이름', '중간', '기말')
df_source

# 2-2
df_source <- df_source %>%
  mutate(평균 = (중간+기말)/2)
df_source


## 3.
cbind(df_source, '학점'= c('C', 'D', 'A', 'B'))


## 4
# even : 짝수 합, odd : 홀수 합
num <- c(1:100)
oddsum <- 0
for(i in num){
  if(i %% 2 == 0){
    oddsum <- oddsum+i
  }
}
cat(oddsum)



## 5
iris
head(iris)

iris1 <- iris %>%
  select(Species, Sepal.Width) %>%
  filter(Species== 'setosa')
iris1

# 5-1 
ggplot(data=iris1, aes(x=Species, y=Sepal.Width)) +
  geom_boxplot()

#5-2


## 6
mpg

mpg6 <- mpg %>%
  filter(manufacturer == 'toyota') %>%
  group_by(class) %>%
  mutate(cty와hwy평균= (cty+hwy)/2) %>%
  arrange(desc(cty와hwy평균)) %>%
  head(3)
mpg6


## 7
mpg

# 7-1
mpg7 <- mpg %>%
  filter(class == 'suv') %>%
  arrange(desc(cty)) %>%
  head(7)

mpg7  

# 7-2
mpg77 <- mpg7 %>%
  select(manufacturer, cty, class)
mpg77

mpg77 <- cbind(mpg77, '순위'= c('1', '2', '3', '4', '5', '6', '7'))

ggplot(mpg77, aes(x=순위, y=cty, fill=순위)) +
  geom_bar(position='dodge', stat='identity')



## 8
# 8-1
diamonds


# 8-2
diamonds

diamonds$price <- diamonds$price/1000

ggplot(diamonds, aes(x=clarity, y=price,fill= clarity)) +
  geom_bar(stat = 'identity')


# 9-1

txt <- read.csv('야구성적.csv')
txt

baseball <- txt %>%
  mutate(OPS= 출루율+ 장타율) %>%
  mutate(연봉대비OPS= (OPS/연봉)*100)
baseball

# 9-2

ggplot(baseball, aes(x=선수명, y= 연봉대비OPS, fill=선수명)) +
  geom_bar(stat = 'identity') +
  theme(axis.text.x  = element_text(angle=90, hjust=1))


# 10
