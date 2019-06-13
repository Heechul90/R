setwd('D:/Heechul/R/R_Lecture/part2/stage3/ch3-3')
install.packages('KoNLP')
install.packages('wordcloud')
install.packages('stringr')
install.packages('reshape2')
library(KoNLP)
library(wordcloud)
library(stringr)
library(ggplot2)
library(dplyr)
library(plyr)
library(reshape2)
useSejongDic()
getwd()


count <- read.csv('2000-2013년 연령별실업율_연령별평균_세로.csv',stringsAsFactor=F)
count
colnames(count) = c('년도', '20대', '30대', '40대', '50대', '60세이상')
count

count_1 <- melt(count, id=c('년도'), variable.name='연령별', value.name='실업율')
count_1

ggplot(count_1, aes(x=년도, y=실업율)) +
  geom_line(linetype=1, size=1) +
  ggtitle(paste('일단기다려봐라'))



ggplot(count2, aes(x=년도, y=value, fill=variable)) +
  geom_line(linetype=1, size=1) +
  theme_classic(base_family = 'malgun', base_size = 10) +
  ggtitle(paste('연도별 요양 기관별 보험 청구 금액 현황(단위:백만원)','\n','출처:건강보험심사평가원'))


  theme(axis.text.x = element_text(angle=90, hjust = 1, vjust = 1, size=7)) +
  geom_text(aes(y=연봉대비출루율+0.5, label=연봉대비출루율), color='black', size=3)