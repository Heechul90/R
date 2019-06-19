setwd('D:/Heechul/R/R_Lecture/part2/stage3/ch3-1')
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
library(RColorBrewer)
useSejongDic()

# OPS = 출류율 + 장타율
# OPS/연봉*100

# 연봉대비출루율
txt <- read.csv('주요선수별성적-2013년.csv',stringsAsFactor=F)
txt
baseball <- txt %>%
  mutate(OPS= 출루율 + 장타율) %>%
  mutate(연봉대비OPS = (OPS/연봉)*100) %>%
  mutate(평균출루율 = sum(출루율)/25)
baseball


mean <- mean(baseball$출루율)
mean
# 연봉대비출루율

palete <- c(brewer.pal(12, 'Set3'), 
            brewer.pal(12, 'Set3'),'#FFFFFF') # brewer.pal.info # palete 정보
ggplot(baseball, aes(x=선수명, y=연봉대비출루율)) +
  geom_bar(stat = 'identity', color=palete, fill=palete) +
  ggtitle(paste('야구 선수별 연봉 대비 출루율 분석','\n','(밥값여부계산 ^^;;)')) +
  theme(plot.title = element_text(family = "serif", 
                                  face = "bold", hjust = 0.5, size = 15, color = "black")) +
  geom_text(aes(y=연봉대비출루율+0.6, label=paste(연봉대비출루율,'%')),
            color='black', cex=2) +
  theme_classic() +
  theme(axis.text.x = element_text(angle=90, hjust = 1, vjust = 1, size=8, color='black')) +
  theme(axis.title.y = element_text(size=8, color='red'))
  
  geom_hline(yintercept=평균출루율, 
             color='red', linetype = 'dashed', size=0.5)

ggplot(baseball, aes(x=선수명, y=평균출루율)) +
  geom_line()

gg + geom_line(aes(x='', y=평균출루율, fill='black'))  
# brewer.pal.info # palete 정보
brewer.pal.info
