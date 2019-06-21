setwd('D:/Heechul/R/R_Lecture/part2/stage3/ch3-7')
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


bus09 <- read.csv('마포09번이용현황.csv')
length(bus09$승차인원)
bus09$number <- c(1:length(bus09$승차인원))
stop <- bus09$정류소명
ggplot(bus09, aes(x=정류소명)) +
  geom_point(color='orange', aes(x=number, y=승차인원)) +
  geom_line(color='orange', aes(x=number, y=승차인원)) +
  geom_point(color='blue', aes(x=number, y=하차인원)) +
  geom_line(color='blue', aes(x=number, y=하차인원)) +
  labs(x='정류소명', y='승하차 인원 (단위: 천명)') +
  scale_x_continuous(breaks = 1:32, labels = stop) +
  theme(axis.text.x=element_text(angle=45, hjust=1, vjust=1,
                                 colour="black", size=8)) +
  scale_y_continuous(breaks = seq(0,40000,10000), labels = c(0,10,20,30,40)) +
  ggtitle('마포09번 정류소별 승하차 인원') +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue")) +
  geom_hline(yintercept=seq(0, 40000, 10000), 
             color='grey', linetype = 'dashed', size=0.1) +
  geom_vline(xintercept=seq(0, 30, 5), 
             color='grey', linetype = 'dashed', size=0.1)

bus09$정류소명 <- paste(1:length(bus09$정류소명),'.',bus09$정류소명, sep='')
bus09$정류소명 <- factor(bus09$정류소명, levels=unique(bus09$정류소명))
mBus <- melt(bus09, id=c('정류소명'),
             variable.name='구분', value.name='인원')
mBus <- mBus %>%
  filter(구분 %in% c('승차인원', '하차인원'))
mBus
ggplot(mBus, aes(x=정류소명, y=인원, color=구분, group=구분)) +
  geom_point(size=3) +
  geom_line(size=1) +
  labs(x='정류소명', y='승하차 인원 (단위: 천명)') +
  theme(axis.text.x=element_text(angle=90, hjust=1, vjust=1,
                                 colour="black", size=8)) +
  scale_y_continuous(breaks = seq(0,40000,10000), labels = c(0,10,20,30,40)) +
  ggtitle('마포09번 정류소별 승하차 인원') +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue")) +
  geom_hline(yintercept=seq(0, 40000, 10000), 
             color='grey', linetype = 'dashed', size=0.1) +
  geom_vline(xintercept=seq(0, 30, 5), 
             color='grey', linetype = 'dashed', size=0.1)
