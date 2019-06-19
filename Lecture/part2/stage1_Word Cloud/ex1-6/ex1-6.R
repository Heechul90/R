### 예제 1-6. 영어 문석 분석하기-스티브 잡스님 연설문 분석하기
setwd('D:/Heechul/R/R_Lecture/part2/stage1_Word Cloud/ex1-6')
install.packages('KoNLP')     # 한국어 관련 작업을 할때 필요한 패키지
install.packages('wordcloud')     
install.packages('stringr')
install.packages('tm')
install.packages('ggplot2')

library(KoNLP)
library(wordcloud)
library(stringr)
library(tm)
library(ggplot2)
useSejongDic()

## 1. 데이터 불러오기
data1 <- readLines('tm_test1.txt')
data1

class(data1)     # 데이터의 형태가 벡터 형태임

## 2. 위 4줄을 tm 패키지가 처리할 수 있는 형태인 Corpus(말뭉치) 형태로 변환
corp1 <- Corpus(VectorSource(data1))
corp1     # 1줄의 1개의 document가 된다. 그래서 4줄이니깐 4 document

inspect(corp1)     # corpus 안의 내용 살펴보기

tdm <- TermDocumentMatrix(corp1)     # tm 패키지가 분석 할 수 있는 term-Document형식의 matrix로 변환
tdm     # terms 15 는 총 15개의 단어를 골랐고 document4 는 소스가 4개 라는 뜻

m <- as.matrix(tdm)     # 일반적으로 사용되는 Matrix로 변환
m

corp2 <- tm_map(corp1, stripWhitespace)     # 여러개의 공백을 하나의 공백으로 변환
corp2 <- tm_map(corp2, tolower)     # 대문자가 있을 경우 소문자로 변환
corp2 <- tm_map(corp2, removeNumbers)     # 숫자를 제거
corp2 <- tm_map(corp2, removePunctuation)     # 마침표, 콤마, 세미콜론, 콜론 등의 문자 제고
sword2 <- c(stopwords('en'), 'and', 'but', 'not')     # 기본 불용어 외 불용어로 쓸 단어 추가
corp2 <- tm_map(corp2, removeWords,sword2)     # 불용어 제거(전치사, 관사 등)



tdm2 <- TermDocumentMatrix(corp2)
tdm2
m2 <- as.matrix(tdm2)
m2

class(m2)
colnames(m2) <- c(1:4)
m2

freq1 <- sort(rowSums(m2), decreasing=T)     # 행의 합계를 구할때 rowSums(m2)
head(freq1, 20)

freq2 <- sort(colSums(m2), decreasing = T)     # 컬럼의 합계를 구할때 colSums(m2)
head(freq2,20)

findFreqTerms(tdm2,2)
findAssocs(tdm2,'apple', 0.5)
findAssocs(tdm2,'apple', 0.6)

library(RColorBrewer)
palete <- brewer.pal(7, 'Set3')
wordcloud(names(freq1), freq=freq1, scale = c(3,0.5), min.freq = 1, colors = palete,
          random.order = F, random.color = T, color=T)
legend(0.2, 1, 'tm package test #1', cex=1, fill=NA, border=NA,
       bg='white', text.col='red', text.font=2, box.col='red')

barplot(freq1, main='tm package test #2', las=2, ylim=c(0,5))

