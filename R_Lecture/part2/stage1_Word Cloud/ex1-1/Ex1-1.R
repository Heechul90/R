### 예제 1-1. 서울시 응답소 페이지 분석하기
setwd('D:/Heechul/R/R_Lecture/part2/stage1_Word Cloud/ex1-1')
install.packages('KoNLP')     # 한국어 관련 작업을 할때 필요한 패키지
install.packages('wordcloud')     

library(KoNLP)
library(wordcloud)

useSejongDic()


## 1. 분석할 원본 데이터를 변수로 읽기
data1 <- readLines('seoul_new.txt')
data1

## 2. 데이터 중에서 명사만 골라낸 후 nouns 변수에 할당
data2 <- sapply(data1, extractNoun, USE.NAMES = F)
data2

## 3. 추출된 명사를 30개만 출력해서 확인
head(unlist(data2), 30)
data3 <- unlist(data2)
data3

## 4. 위 출력 결과에서 원하지 않는 내용 걸러내기
data3 <- gsub('\\d+','', data3)     # 모든 숫자 없애기
data3 <- gsub('서울시','', data3)
data3 <- gsub('서울','', data3)
data3 <- gsub('요청','', data3)
data3 <- gsub('제안','', data3)
data3 <- gsub(' ','', data3)
data3 <- gsub('-','', data3)
data3

## 5. 파일로 저장한 후 데이블 형태로 변환하여 불러들임
write(unlist(data3), 'seoul_2.txt')

## 6. 수정 완료된 파일을 read.table 명령으로 다시 변수에 불러들임
data4 <- read.table('seoul_2.txt')
data4

## 7. 화면에 그래픽으로 출력하기 전에 text 형태로 결과를 확인
nrow(data4)

wordcount <- table(data4)
wordcount

head(sort(wordcount, decreasing = T), 20)

data3 <- gsub('OO','', data3)
data3 <- gsub('개선','', data3)
data3 <- gsub('문제','', data3)
data3 <- gsub('관리','', data3)
data3 <- gsub('민원','', data3)
data3 <- gsub('이용','', data3)
data3 <- gsub('관련','', data3)
data3 <- gsub('시장','', data3)

## 8. 다시 파일로 저장한 후 데이블 형태로 변환하여 불러들임
write(unlist(data3), 'seoul_2.txt')

## 9. 다시 수정 완료된 파일을 read.table 명령으로 다시 변수에 불러들임
data4 <- read.table('seoul_2.txt')
data4

## 10. 다시 화면에 그래픽으로 출력하기 전에 text 형태로 결과를 확인
nrow(data4)

wordcount <- table(data4)
wordcount

head(sort(wordcount, decreasing = T), 20)

## wordcloud 형태로 그래픽 출력
library(RColorBrewer)
palete <- brewer.pal(9, 'Set3')

wordcloud(names(wordcount), freq=wordcount, scale=c(4,0.2), rot.per = 0.25,
          min.freq = 1, random.order = F, random.color = T, colors = palete)
legend(0.22, 1, '서울시 응답소 요청사항 분석', cex=0.6, fill=NA, border=NA,
       bg='gray', text.col='red', text.font=10, box.col='black')
