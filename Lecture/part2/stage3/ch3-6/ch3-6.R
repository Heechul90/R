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

txt <- read.csv('버스노선별이용현황합계.csv')
txt

data <- melt(txt, id=c('버스노선번호'))
data
head(data)
data$value <- data$value/1000

ggplot(data, aes(x=버스노선번호, y=value)) +
  geom_bar(stat = 'identity', position="dodge", width=0.9, colour='black', aes(fill=variable)) +
  scale_fill_manual(values=c("#33FF00","#FFFF00")) +
  ggtitle('서울 주요 마을 버스 이용 승객 현황(2014년 1월)') +
  theme(plot.title = element_text(family="malgun", face = "bold", hjust = 0.5,
                                  vjust = 2.5, size = 15, color = "black")) +
  ylab('이용승객수(단위:천명)') +
  xlab('노선명') +
  theme(panel.background = element_rect(fill='white', color='black', linetype='solid')) +
  theme(axis.text.x  = element_text(angle=90, hjust=1)) +
  geom_hline(yintercept=seq(0,300,100), color='gray', lty='dashed', size=0.1) +
  geom_text(aes(y=value, label=value), color='red', size=3) +
  geom_hline(yintercept=seq(0, 300, 10), color='white', linetype = 'dashed', size=0.1) +
  theme(legend.position='none')
legend(1, 250, c('승차인원', '하차인원'), cex = 0.7, fill = 'black')

  
  
  
# 배경화면 옵션 사이트 https://rpackage.blogspot.com/2018/05/ggplot2-theme-background.html
  
theme(legend.position='none')
  geom_text(aes(y=value, label=value), color='black', size=3) +
  labs(x='노선명',y='이용승객수(단위:천명)') +
  theme_bw(base_family='malgun', base_size = 10) +
  theme(axis.text.x  = element_text(angle=90, hjust=1)) +
  ggtitle('서울 주요 마을버스 이용승객 현황(2014년 1월)') +
  theme(plot.title = element_text(family="malgun", face = "bold", hjust = 0.5,
                                  vjust = 2.5, size = 15, color = "darkblue"))
