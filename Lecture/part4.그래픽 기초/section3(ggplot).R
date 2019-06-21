# welcome to ggplot2 world~!
# 파이썬에서도 사용하니 잘자라잘자라자라자랒ㄹ잘 알아둘것!!
install.packages('ggplot2')
library(ggplot2)
library(dplyr)
library(plyr)

getwd()
korea <- read.table('data/학생별국어성적_new.txt', header=T, sep=',')
korea

# ggplot(dataframe, aes(x=x축 이름, y=y축 이름)) + geom 함수......
ggplot(korea, aes(x=이름,y=점수)) + geom_point()
ggplot(korea, aes(x=이름,y=점수)) + geom_bar(stat = 'identity')
# green으로 막대기 색 채우고 red로 막기서 선 색 지정
ggplot(korea, aes(x=이름,y=점수)) + geom_bar(stat = 'identity', fill='green', colour='red')
gg <- ggplot(korea, aes(x=이름,y=점수)) + geom_bar(stat = 'identity', fill='green', colour='red')

# theme은 주로 글자와 관련된 기능을 설정합니다.
gg + theme(axis.text.x = element_text(angle=45, hjust = 1, vjust = 1, color = 'blue', size=8))

score_kem1 <- read.csv('data/학생별과목별성적_국영수_new.csv', header=T)
score_kem1
score_kem <- arrange(score_kem1, 이름, 과목)
score_kem
score_kem2 <- ddply(score_kem,'이름', transform, 누적합계=cumsum(점수))
score_kem2
score_kem3 <- ddply(score_kem2, '이름', transform, 누적합계 = cumsum(점수), label=cumsum(점수)-0.5*점수)
score_kem3

ggplot(score_kem3, aes(x=이름, y=점수, fill=과목)) + geom_bar(stat = 'identity') + geom_text(aes(y=label, label=paste(점수,'점')), colour='black', size=3)

score_kem
sort_kem <- score_kem1 %>%
  group_by(이름)
  

sort_kem
#누적점수가 다 합산된다 문제있다 모르겠다.


ggplot(sort_kem, aes(x=이름, y=점수, fill=과목)) + geom_bar(stat = 'identity') + geom_text(aes(y=label, label=paste(점수,'점')), colour='black', size=4)



score <- read.table('data/학생별전체성적_new.txt', header=T, sep=',')
score

score1 <- score %>%
  select(이름,영어)

score1

ggplot(score1, aes(x=영어, y=reorder(이름,영어))) +
  geom_point(size=3) +
  theme_bw() + 
  theme(panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank(),
          panel.grid.major.y = element_line(color='red', linetype = 'dashed'))

# geom_point() 
install.packages('gridExtra')
library(gridExtra)
v_mt <- mtcars
v_mt
str(v_mt)
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point()

ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(colour='blue')

ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(aes(color=factor(am)))

ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(aes(color=factor(am)), size=2)

ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(aes(color=factor(am))) +
  geom_point(aes(size=wt))

ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(aes(shape=factor(am)), size=3)

ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(aes(shape=factor(am), color=factor(am), size=(wt)))

ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(aes(shape=factor(am), color=factor(am), size=(wt))) +
  scale_color_manual(values=c('red', 'green'))

ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(aes(shape=factor(am), color=factor(am), size=wt)) +
  scale_color_manual(values=c('red', 'green')) +
  geom_line()

# geom_line() 함수

three <- read.csv('data/학생별과목별성적_3기_3명.csv', header=T)
three             
str(three)

sort_score <- three %>%
  arrange(이름, 과목)
sort_score

ggplot(sort_score, aes(x=과목, y=점수, color=이름, group=이름)) + geom_line()

ggplot(sort_score, aes(x=과목, y=점수, color=이름, group=이름)) + geom_line() +
  geom_point()

ggplot(sort_score, aes(x=과목, y=점수, color=이름, group=이름)) + 
  geom_line(size=1) +
  geom_point(size=3, shape=25)


# geom_area() 함수
dis <- read.csv('data/1군전염병발병현황_년도별.csv', stringsAsFactors=T)
dis

ggplot(dis, aes(x=년도별, y=장티푸스, group=1)) +
  geom_line()

ggplot(dis, aes(x=년도별, y=장티푸스, group=1)) +
  geom_line() +
  geom_area(fill='yellow', color='red')

ggplot(dis, aes(x=년도별, y=장티푸스, group=1)) +
  geom_line(color='red') +
  geom_area(fill='red', alpha=0.2,)

sort_score

ggplot(sort_score, aes(x=과목, y=점수, color=이름, group=이름)) +
  geom_line() +
  geom_point() +
  geom_area()
