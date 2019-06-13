setwd('D:/Heechul/R/R_Lecture/part2/stage3/ch3-6')
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
library(googleVis)
useSejongDic()
getwd()


count <- read.csv('버스노선별이용현황합계.csv', header=T)
count


ggplot(count, aes(x=버스노선번호, y=승차인원, fill='green')) +
  geom_bar(position = 'dodge', stat = 'identity') 



# 구글차트로 바로 만들기
hos <- gvisColumnChart(count,option=list(title='버스노선별이용현황', height=200000, weight=30))
header <- hos$html$header
header <- gsub('utf-8','', header)
hos$html$header <- header
plot(hos)


  

  