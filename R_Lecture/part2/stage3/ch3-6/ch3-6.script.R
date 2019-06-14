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
library(extrafont)
useSejongDic()
getwd()
windowsFonts(malgun = "맑은 고딕")
theme_update(text = element_text(family = "malgun"))


bus <- read.csv('버스노선별이용현황합계.csv')
bus
bus_melt <- melt(bus, id=c('버스노선번호'))
bus_melt
bus_melt$value<- bus_melt$value/1000
bus_melt

ggplot(bus_melt, aes(x=버스노선번호, y=value, fill=variable)) +
  geom_bar(stat="identity", position="dodge", color="black") +
  geom_text(aes(y=value, label=value), color='black', size=3) +
  labs(x='노선명',y='이용승객수(단위:천명)') +
  theme_bw(base_family='malgun', base_size = 10) +
  theme(axis.text.x  = element_text(angle=90, hjust=1)) +
  ggtitle('서울 주요 마을버스 이용승객 현황(2014년 1월)') +
  theme(plot.title = element_text(family="malgun", face = "bold", hjust = 0.5,
                                  vjust = 2.5, size = 15, color = "darkblue"))




  

  