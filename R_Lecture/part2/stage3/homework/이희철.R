library(KoNLP)
library(wordcloud)
library(stringr)
library(ggplot2)
library(dplyr)
library(plyr)
library(reshape2)
library(RColorBrewer)
useSejongDic()

### 3-1
# 연봉대비출루율
txt <- read.csv('주요선수별성적-2013년.csv',stringsAsFactor=F)
baseball <- txt %>%
  mutate(OPS= 출루율 + 장타율) %>%
  mutate(연봉대비OPS = (OPS/연봉)*100) %>%
  mutate(평균출루율 = sum(출루율)/25)

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

### 3-4
txt <- read.csv('고용형태별_취업자현황_근무일수.csv',stringsAsFactor=F)

employ <- melt(txt, id=c('년도'))

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

employ1 <- melt(txt1, id=c('년도'))

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



### 3-6
txt <- read.csv('버스노선별이용현황합계.csv')

data <- melt(txt, id=c('버스노선번호'))
data$value <- data$value/1000

ggplot(data, aes(x=버스노선번호, y=value, fill=variable)) +
  geom_bar(stat = 'identity', position="dodge", width=0.9, colour='black') +
  ggtitle('서울 주요 마을 버스 이용 승객 현황(2014년 1월)') +
  theme(plot.title = element_text(family="malgun", face = "bold", hjust = 0.5,
                                  vjust = 2.5, size = 15, color = "black")) +
  scale_fill_manual(values=c("#669933","#FFCC66")) +
  ylab('이용승객수(단위:천명)') +
  xlab('노선명') +
  theme(axis.text.x = element_text(angle=90, hjust=1)) +
  theme(panel.background = element_rect(fill='white', color='black', linetype='solid'))
