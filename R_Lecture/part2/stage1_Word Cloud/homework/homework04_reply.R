# 연습문제 

setwd('D:/Heechul/R/R_Lecture/part2/stage1_Word Cloud/Exercise')
install.packages('KoNLP')
install.packages('wordcloud')
library(KoNLP)
library(wordcloud)
useSejongDic()
library(RColorBrewer)
library(stringr)


## 파일 불러오기

reply01 <- readLines("data/응답소_2015_01.txt")
reply02 <- readLines("data/응답소_2015_02.txt")
reply03 <- readLines("data/응답소_2015_03.txt")
reply04 <- readLines("data/응답소_2015_04.txt")
reply05 <- readLines("data/응답소_2015_05.txt")
reply06 <- readLines("data/응답소_2015_06.txt")
reply07 <- readLines("data/응답소_2015_07.txt")
reply08 <- readLines("data/응답소_2015_08.txt")
reply09 <- readLines("data/응답소_2015_09.txt")
reply10 <- readLines("data/응답소_2015_10.txt")
reply11 <- readLines("data/응답소_2015_11.txt")
reply12 <- readLines("data/응답소_2015_12.txt")

## 명사만 골라낸 뒤, 제목 없애고 리스트로 만들기
reply01 <- sapply(reply01, extractNoun, USE.NAMES=F)
reply01 <- unlist(reply01)
reply01
reply02 <- sapply(reply02, extractNoun, USE.NAMES=F)
reply02 <- unlist(reply02)
reply02
reply03 <- sapply(reply03, extractNoun, USE.NAMES=F)
reply03 <- unlist(reply03)
reply03
reply04 <- sapply(reply04, extractNoun, USE.NAMES=F)
reply04 <- unlist(reply04)
reply05
reply05 <- sapply(reply05, extractNoun, USE.NAMES=F)
reply05 <- unlist(reply05)
reply05
reply06 <- sapply(reply06, extractNoun, USE.NAMES=F)
reply06 <- unlist(reply06)
reply06
reply07 <- sapply(reply07, extractNoun, USE.NAMES=F)
reply07 <- unlist(reply07)
reply07
reply08 <- sapply(reply08, extractNoun, USE.NAMES=F)
reply08 <- unlist(reply08)
reply08
reply09 <- sapply(reply09, extractNoun, USE.NAMES=F)
reply09 <- unlist(reply09)
reply09
reply10 <- sapply(reply10, extractNoun, USE.NAMES=F)
reply10 <- unlist(reply10)
reply10
reply11 <- sapply(reply11, extractNoun, USE.NAMES=F)
reply11 <- unlist(reply11)
reply11
reply12 <- sapply(reply12, extractNoun, USE.NAMES=F)
reply12 <- unlist(reply12)
reply12

## 리스트된 캐릭터를 하나로 합치기
totalreply <- c(reply01, reply02, reply03, reply04, reply05, reply06,
                reply07, reply08, reply09, reply10, reply11, reply12)
totalreply

## 단어 없애기
totalreply <- str_replace_all(totalreply, '[^[:alpha:]]','') # 영어, 한글 빼고 지우기
totalreply <- str_replace_all(totalreply, '[A-z]','') # 모든 영문자 제거
totalreply <- str_replace_all(totalreply, '\\s','') # 공백 제거
totalreply <- str_replace_all(totalreply, '\\d','') # 숫자 제거
totalreply

## 필터로 두 글자 이상만 남기기
totalreply <- Filter(function(x) {nchar(x) >= 2}, totalreply)
totalreply <- Filter(function(x) {nchar(x) <= 6}, totalreply)
totalreply

## 저장해서 다시 불러와 공백 없애고 필요없는 단어 확인하기(단어지우고 여기서 반복실행.두번째)
write(unlist(totalreply), 'totalreply.txt')
rev <- read.table('totalreply.txt')
rev
nrow(rev)
wordcount <- table(rev)
wordcount
head(sort(wordcount,decreasing=T), 100)

wordcount <- wordcount[wordcount > 1] # 빈도수가 1인 명사 제외

## txt 파일 불러와서 단어 지우기(여기로 와서 반복실행.첫번째)
replygsub <- readLines('data/응답소gsub.txt')
replygsub

cnt_replygsub <- length(replygsub)
cnt_replygsub
i <- 1
for(i in 1:cnt_replygsub) {
  totalreply <- gsub((replygsub[i]), '', totalreply)
}
totalreply

### wordcloud 만들기
palete <- brewer.pal(9,"Set1")
par(oma=rep(0,4))
wordcloud(names(wordcount),freq=wordcount,scale=c(4,0.1),rot.per=0.25,min.freq=5,
          random.order=F,random.color=T,colors=palete)
legend(0.25,1,'2015년 서울시 응답소 분석',cex=0.8,fill=NA,border=NA,bg="white",
       text.col="black",text.font=9,box.col="green")
