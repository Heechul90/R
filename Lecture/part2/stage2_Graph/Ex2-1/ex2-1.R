### 예제 2-1. '제주도 여행코스 추천' 검색어 결과를 그래프로 표시하기
setwd('D:/Heechul/R/R_Lecture/part2/stage2/ex2-1')
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
mergeUserDic(data.frame(readLines('제주도여행지.txt'), 'ncn'))

# 파일 불러오기
txt <- readLines('data/jeju.txt')
txt

# 명사만 골라 내기
place <- sapply(txt, extractNoun, USE.NAMES = F)
place

# 제목 빼고 리스트로 만들기
cdata <- unlist(place)
cdata

# 영어,한글빼고 다 지우기
place <- str_replace_all(cdata, '[^[:alpha:]]','')
place
place <- gsub(' ','', place)
place

# 지울 글자 txt파일에 넣고 반복문으로 지우기
txt <- readLines('data/제주도여행코스gsub.txt')
txt

cnt_txt <- length(txt)
cnt_txt
i <- 1
for(i in 1:cnt_txt) {
  place <- gsub((txt[i]), '', place)
}
place

# 필터로 2글자 이상만 남기기
place <- Filter(function(x) {nchar(x) >= 2}, place)
place

# 저장하고 table로 다시 불러오기. 공백 지우기
write(unlist(place), 'jeju_2.txt')
rev <- read.table('jeju_2.txt')
rev
nrow(rev)

# 테이블로 바꿔주고 탑20 확인하기
wordcount <- table(rev)
wordcount
head(sort(wordcount, decreasing = T), 20)

## wordcloud 생성
palete <- brewer.pal(7, 'Set3')
wordcloud(names(wordcount), freq=wordcount, scale = c(3,0.1), min.freq = 2, colors = palete,
          random.order = F, random.color = T, color=T)
legend(0.3, 1, '제주도 추천 여행 코스', cex=0.6, fill=NA, border=NA,
       bg='white', text.col='red', text.font=2, box.col='red')

### top10만 뽑아서 그래프 만들어 보기
top10 <- head(sort(wordcount, decreasing = T), 10)
top10
## ggplot으로 bar 형 그래프 만들기

df_top10 <- data.frame(top10)
df_top10

ggplot(df_top10, aes(x=rev, y=Freq, fill=rev)) +
  geom_bar(stat = 'identity') +
  ggtitle('그래프 제목 수정') +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 15, color = "darkblue")) + # 그래프 제목 수정
  ylab('y축 이름 수정') +
  xlab('x축 이름 수정') +
  theme(axis.text.x=element_text(angle=90, hjust=1, vjust=1, colour="black", size=8)) + # x축 변수 이름 수정
  theme(axis.text.y=element_text(hjust=1, vjust=1, colour="red", size=8)) +  # y축 변수 이름 수정
  geom_text(aes(y=Freq+0.5, label=rev), color='black') +
  geom_text(aes(y=Freq-0.5, label=ylabel), color='black')


## ggplot으로 pie 형 그래프 만들기

ggplot(df_top10, aes(x='', y=Freq, fill=rev)) +
  geom_bar(stat = 'identity', width=1) +
  coord_polar('y', start = 0) +
  geom_text(aes(y=ypos, label=ylabel), color='black')

## 라벨 만들기
options(digits = 2)     # 수숫점 둘째짜리까지
df_top10
df_top10 <- df_top10 %>%
  mutate(pct = Freq / sum(Freq) * 100) %>%
  # mutate(pct = Freq / sum(Freq) * 100) %>%
  # mutate(ylabel = paste(pct, '%',sep='')) %>%
  # mutate(ylabel = paste(sprintf("%4.1f", pct), '%', sep='')) %>%
  mutate(ylabel = paste(sprintf("%s\n%4.1f", rev, pct), '%', sep='')) %>%
  arrange(desc(rev)) %>%
  mutate(ypos = cumsum(pct)- 0.5*pct)
df_top10

ggplot(df_top10, aes(x='', y=Freq, fill=rev)) +
  geom_bar(stat = 'identity') +
  coord_polar('y', start = 0) +
  geom_text(aes(y=ypos, label=pct), color='black')

## ggplot으로 옆으로 누운 bar 형 그래프 만들기

df_top10 <- data.frame(top10)
df_top10

ggplot(df_top10, aes(x=rev, y=Freq, fill=rev)) +
  geom_bar(stat = 'identity') +
  coord_flip() +
  ggtitle('그래프 제목 수정') +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 15, color = "darkblue")) + # 그래프 제목 수정
  ylab('y축 이름 수정') +
  xlab('x축 이름 수정') +
  theme(axis.text.x=element_text(angle=90, hjust=1, vjust=1, colour="black", size=8)) + # x축 변수 이름 수정
  theme(axis.text.y=element_text(hjust=1, vjust=1, colour="red", size=8)) +  # y축 변수 이름 수정
  geom_text(aes(y=Freq-0.8, label=ylabel), color='black')    # 지금 ylabel이 다 만들어진거임

