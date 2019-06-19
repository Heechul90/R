### 예제 1-2. 여고생은 어디를 가장 고치고 싶을까요?
setwd('D:/Heechul/R/R_Lecture/part2/stage1_Word Cloud/ex1-2')
install.packages('KoNLP')     # 한국어 관련 작업을 할때 필요한 패키지
install.packages('wordcloud')     

library(KoNLP)
library(wordcloud)
useSejongDic()

## 1. 주요 패키지를 설치하고 로딩해서 분석할 준비를 한다.
data1 <- readLines('remake.txt')
data1
data2 <- sapply(data1, extractNoun, USE.NAMES = F)
data2
data3 <- unlist(data2)
data3
data3 <- Filter(function(x) {nchar(x) <= 10}, data3) # 필터해서 10글자 이하만 남게
data3
head(unlist(data3), 30)
# gsub('변경전글자', '변경후글자', '원본데이터')
data3 <- gsub('\\d+','', data3)
data3 <- gsub('쌍수','쌍꺼풀', data3)
data3 <- gsub('쌍커풀','쌍꺼풀', data3)
data3 <- gsub('메부리코','매부리코', data3)
data3 <- gsub('\\.','', data3)     #
data3 <- gsub(' ','', data3)
data3 <- gsub("\\'",'', data3)     #
data3

## 2. 공백 제거하기
write(unlist(data3), 'remake_2.txt')
data4 <- read.table('remake_2.txt')     # 저장후 다시 테이블 변수로 저장하면 공백이 없어진다.
data4
nrow(data4)
wordcount <- table(data4)
wordcount

## 3. 필요없는 단어들 제거하기2
head(sort(wordcount, decreasing = T), 20)
txt <- readLines('성형gsub.txt')     # 제거하고 싶은 단어 목록을 불러옴
txt
cnt_txt <- length(txt)
cnt_txt
i <- 1
for(i in 1:cnt_txt) {
  data3 <- gsub((txt[i]),'', data3)  # i가 1일때 첫번째 단어 '' 바꾸고 다시 돌아가서 2번째 실행
}
data3
data3 <- Filter(function(x) {nchar(x) >=2}, data3)
data3
write(unlist(data3), 'remake_2.txt')
data4 <- read.table('remake_2.txt')
data4
nrow(data4)
wordcount <- table(data4)
wordcount
head(sort(wordcount, decreasing = T),20)

## 4. 워드 클라우드를 생성
library(RColorBrewer)
palete <- brewer.pal(9, 'Set1')
wordcloud(names(wordcount), freq=wordcount, scale=c(3,0.2), rot.per = 0.25,
          min.freq = 2, random.order = F, random.color = T, colors = palete)
legend(0.2, 1, '여고생들이 선호하는 성형수술 부위', cex=0.6, fill=NA, border=NA,
       bg='white', text.col='red', text.font=1, box.col='black')
