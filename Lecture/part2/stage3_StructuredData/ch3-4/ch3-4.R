setwd('D:/Heechul/R/R_Lecture/part2/stage3/ch3-4')
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


txt <- read.csv('고용형태별_취업자현황_근무일수.csv',stringsAsFactor=F)
txt

employ <- melt(txt, id=c('년도'))
employ

# 고용 형태별 근무일수[단위:일] 출처:통계
ggplot(employ, aes(x=년도, y=value, fill=variable, color=variable, group=variable)) +
  geom_line(linetype=1, size=1) +
  geom_point(shape=19, size=2) +
  xlab(' ') +
  geom_vline(xintercept=seq(2007,2013,1), color='gray', lty="dashed", size=0.1) +
  ylab(' ') +
  geom_hline(yintercept=seq(10,25,1), color='gray', lty='dashed', size=0.1) +
  ggtitle(paste('고용 형태별 근무일수[단위:일] 출처:통계청')) +
  theme(plot.title = element_text(face = 'bold',hjust = 0.5, size = 15, color = 'black')) +
  theme(axis.text.x = element_text(angle=90, hjust = 1, vjust = 1, color= 'black', size=8))

# 고용 형태별 급여현황[단위:천원] 출처:통계청
txt1 <- read.csv('고용형태별_취업자현황_월급현황.csv',stringsAsFactor=F)
txt1

employ1 <- melt(txt1, id=c('년도'))
employ1

ggplot(employ1, aes(x=년도, y=value, fill=variable, color=variable, group=variable)) +
  geom_line(linetype=1, size=1) +
  geom_point(shape=19, size=2) +
  xlab(' ') +
  geom_vline(xintercept=seq(2007,2013,1), color='gray', lty="dashed", size=0.1) +
  ylab(' ') +
  geom_hline(yintercept=seq(500,3000,100), color='gray', lty='dashed', size=0.1) +
  ggtitle(paste('고용 형태별 급여현황[단위:천원] 출처:통계청')) +
  theme(plot.title = element_text(face = 'bold',hjust = 0.5, size = 15, color = 'black')) +
  theme(axis.text.x = element_text(angle=90, hjust = 1, vjust = 1, color= 'black', size=8))



  geom_hline(yintercept=seq(0,30,5), lty='dashed', size=0.1)
  
  
  ggtitle(paste('고용 형태별 근무일수[단위:일] 출처:통계청')) +
  theme_classic(base_family = 'malgun', base_size = 8) +
  theme(axis.text.x = element_text(angle=30, hjust = 1, vjust = 1, color= 'blue', size=8))
legend(0.3, 10, '', cex=0.6, fill=NA, border=NA, bg='white',
       text.col='red', text.font=4, box.col='red', box.lty = 5)  



theme_classic(base_family = 'malgun', base_size = 10) +
  ggtitle(paste('연도별 요양 기관별 보험 청구 금액 현황(단위:백만원)','\n','출처:건강보험심사평가원'))
geom_text(aes(y=Freq, label=ylabel), color='black') +
  ggtitle('Hiphop Words TOP 10') +
  theme(plot.title = element_text(face = 'bold',hjust = 0.5, size = 15, color = 'red'))

abline(h=seq(0,6000,500), v=seq(1,100,1), lty=3,lwd=0.2)
col <- names(count[1,2:10])
colors <- c('violet', 'blue', 'red', 'black', 'orange', 'green', 'cyan', 'yellow', 'brown', 'pink')
legend(1,6000, col, cex=0.3, col=colors, lty = 1, lwd = 2, bg='white')
