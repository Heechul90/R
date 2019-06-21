### 도전미션 2-1. '프로포즈 선물' 검색어 분석 결과를 그래프로 표시 하기
setwd('D:/Heechul/R/R_Lecture/part2/stage2/ch2-1')
install.packages('KoNLP')     # 한국어 관련 작업을 할때 필요한 패키지
install.packages('wordcloud')     
install.packages('stringr')
install.packages('ggplot2')
install.packages('dplyr')
install.packages('coord')
library(KoNLP)
library(wordcloud)
library(stringr)
library(ggplot2)
library(dplyr)
library(RColorBrewer)
useSejongDic()

## 파일 불러와서 명사만 뽑아내기
propose <- readLines('data/propose.txt')
propose
propose <- sapply(propose, extractNoun, USE.NAMES = F)
propose


## 필터와 스트링어로 단어 골라내기
propose <- unlist(propose)
propose
propose <- Filter(function(x) {nchar(x)>=2}, propose)
propose

propose <- str_replace_all(propose, '[^[:alpha:]]','') # 영어, 한글 빼고 지우기
propose <- str_replace_all(propose, '[A-z]','') # 모든 영문자 제거
propose <- str_replace_all(propose, '\\s','') # 공백 제거
propose <- str_replace_all(propose, '\\d','') # 숫자 제거
propose

## gsub.txt 파일로 for문으로 단어 지우기
proposegsub <- readLines('proposegsub.txt')
proposegsub
cnt_propose <- length(proposegsub)
cnt_propose
i <- 1
for(i in 1:cnt_propose) {
  propose <- gsub((proposegsub[i]),'', propose)
}
propose

## 저장하고 테이블로 불러와 확인하기
write(unlist(propose), 'propose_2.txt')
rev <- read.table('propose_2.txt')
rev
nrow(rev)
wordcount <- table(rev)
wordcount
head(sort(wordcount, decreasing = T), 30)


##  TOP10 개 뽑아서 데이터 프레임 만들기
top10 <- head(sort(wordcount, decreasing = T), 10)
top10 
df_top10 <- data.frame(top10)

## 라벨 만들기
options(digits = 2)
df_top10 <- df_top10 %>%
  mutate(pct = Freq/sum(Freq)*100) %>%
  mutate(ylabel01 = paste(Freq, '건',sep=' ')) %>%
  mutate(ylabel02 = paste('(',round(pct, 2),'%',')', sep='')) %>%
  mutate(ylabel03 = paste(Freq, '건', '\n', round(pct, 2),'%', sep='')) %>%
  mutate(ypos = cumsum(pct)- 0.5*pct)
df_top10


## 프로포즈 선물 TOP 10 bar 만들기
brewer.pal.info
palete <- brewer.pal(10, 'Paired')

ggplot(df_top10, aes(x=rev, y=Freq)) +
  geom_bar(stat = 'identity', fill=palete) +
  ggtitle('프로포즈 선물 TOP 10') +
  theme(plot.title = element_text(face = "bold", hjust = 0.5,
                                  size = 15, color = "black")) +# 그래프 제목 수정
  ylab('') +
  xlab('') +
  theme(axis.text.x=element_text(angle=90, hjust=1,
                                 vjust=0, colour="black", size=8)) + # x축 변수 이름 수정
  theme(axis.text.y=element_text(hjust=0,
                                 vjust=1, colour="black", size=8)) +  # y축 변수 이름 수정
  # geom_text(aes(y=Freq+0.5, label=ylabel03), color='black') +
  geom_text(aes(y=Freq+1, label=ylabel01), color='black', size=3) +
  geom_text(aes(y=Freq-1, label=ylabel02), color='black', size=3) +
  theme_classic()

# 프로포즈 선물 TOP 10 옆으로 누운 bar 만들기
brewer.pal.info
palete <- brewer.pal(10, 'Paired')

ggplot(df_top10, aes(x=rev, y=Freq)) +
  geom_bar(stat = 'identity', fill=palete) +
  coord_flip() +
  ggtitle('프로포즈 선물 TOP 10') +
  theme(plot.title = element_text(face = "bold", hjust = 0.5,
                                  size = 15, color = "black")) +# 그래프 제목 수정
  ylab('') +
  xlab('') +
  theme(axis.text.x=element_text(angle=90, hjust=1, vjust=0, colour="black", size=8)) + # x축 변수 이름 수정
  theme(axis.text.y=element_text(hjust=0, vjust=1, colour="black", size=8)) +  # y축 변수 이름 수정
  # geom_text(aes(y=Freq+0.5, label=ylabel03), color='black') +
  geom_text(aes(y=Freq+5, label=ylabel01), color='black', size=3) +
  geom_text(aes(y=Freq-3, label=ylabel02), color='black', size=3) +
  theme_classic()


# 프로포즈 선물 TOP 10 pie 만들기
brewer.pal.info
palete <- brewer.pal(10, 'Paired')

ggplot(df_top10, aes(x='', y=pct)) +
  geom_bar(stat = 'identity', fill=palete) +
  coord_polar('y', start=0) +
  ggtitle('프로포즈 선물 TOP 10') +
  theme(plot.title = element_text(face = "bold", hjust = 0.5,
                                  size = 15, color = "black")) +# 그래프 제목 수정
  ylab('') +
  xlab('') +
  theme(axis.text.x=element_text(angle=90, hjust=1, vjust=0, colour="black", size=8)) + # x축 변수 이름 수정
  theme(axis.text.y=element_text(hjust=0, vjust=1, colour="black", size=8)) +  # y축 변수 이름 수정
  # geom_text(aes(y=Freq+0.5, label=ylabel03), color='black') +
  geom_text(aes(y=ypos, label=ylabel03), color='black', size=3) +
  theme_classic()
  
 
  
