# 예제 1-6 스티브 잡스 연설문 분석하기

install.packages('tm')
library(tm)
library(wordcloud)
setwd('D:/Heechul/R/R_Lecture/part2/stage1_Word Cloud/data')

# tm 패키지 동작 확인
data1 <- readLines('tm_test1.txt')
data1
class(data1)
# data1 <- iconv(data1, 'WINDOWS-1252','UTF-8') = 맥 사용할때 깨지면 이렇게 변환
corp1 <- Corpus(VectorSource(data1))
corp1
inspect(corp1)

tdm <- TermDocumentMatrix(corp1)
tdm

m <- as.matrix(tdm)
m
stopwords('en')
stopwords('dutch')

corp2 <- tm_map(corp1, stripWhitespace)
corp2 <- tm_map(corp2, tolower)
corp2 <- tm_map(corp2, removeNumbers)
corp2 <- tm_map(corp2, removePunctuation)

sword2 <- c(stopwords('en'),'and','but','not')
corp2 <- tm_map(corp2, removeWords, sword2)

corp2
tdm2 <- TermDocumentMatrix(corp2)   # 여기 안된다알아봐라
tdm2

m2 <- as.matrix(tdm2)
m2

class(m2)

colnames(m2) <- c(1:4)
m2

freq1 <- sort(rowSums(m2), decreasing = T)
head(freq1,20)

freq2 <- sort(colSums(m2), decreasing = T)
head(freq2)

findFreqTerms(tdm2,2)

findAssocs(tdm2,'apple',0.5)

findAssocs(tdm2,'apple',0.6)

library(RColorBrewer)
palete <- brewer.pal(7,'Set3')
wordcloud(names(freq1), freq=freq1, scale=c(5,1), min.freq=1, colors=palete, random.order = F, random.color = T)

barplot(freq1, main='tm package test #2', las=2, ylim=c(0,5))
