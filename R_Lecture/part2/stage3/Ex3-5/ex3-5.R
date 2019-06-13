setwd('D:/Heechul/R/R_Lecture/part2/stage3/Ex3-5')
install.packages('KoNLP')
install.packages('wordcloud')
install.packages('stringr')
install.packages('reshape')
library(KoNLP)
library(wordcloud)
library(stringr)
library(ggplot2)
library(dplyr)
library(plyr)
library(reshape)
useSejongDic()

count <- read.csv('연도별요양기관별보험청구금액_2004_2013_세로.csv', stringsAsFactor=F)
count

count2 <- melt(count, id=c('년도'), variable.name='병원종류', value.name='금액')
count2

count2$금액 <- count2$금액/1000000
count2

ggplot(count2, aes(x=년도, y=금액, fill=병원종류)) +
  geom_line(linetype=1, size=1)
 
  

  
  
  theme_classic(base_family = 'malgun', base_size = 10) +
  ggtitle(paste('연도별 요양 기관별 보험 청구 금액 현황(단위:백만원)','\n','출처:건강보험심사평가원'))
  geom_text(aes(y=Freq, label=ylabel), color='black') +
  ggtitle('Hiphop Words TOP 10') +
  theme(plot.title = element_text(face = 'bold',hjust = 0.5, size = 15, color = 'red'))
