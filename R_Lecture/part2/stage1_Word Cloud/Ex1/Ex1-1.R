# 예제 1-1 서울시 응답소 페이지 분석하기

setwd('D:/Heechul/R/R_Lecture/part2/stage1_Word Cloud/Ex1')
install.packages('rJava')
install.packages('KoNLP')
install.packages('wordcloud')
library(rJava)
library(KoNLP)
library(wordcloud)
useSejongDic()
library(RColorBrewer)

# 파일에서 읽은 raw데이터
data1 <- readLines('seoul_new.txt')
data1  
ddd <- readLines('data/seoul_new.txt')

# 명사만추출하는 함수
extractNoun('서울시 버스정책을 역행하는 행위를 고발합니다')

# 여러건의 데이터를 한꺼번에 저장하는 함수수
data2 <- sapply(data1, extractNoun, USE.NAMES = F)
data2
head(unlist(data2), 30)

# list가 아닌 명사 데이터
data3 <- unlist(data2)
data3

# 삭제하는 과정입니다.
data3 <- gsub('\\d+','',data3)     # 모든숫자 없애기
data3 <- gsub('서울시','', data3)     # 서울시라는 단어 모두 없애기
data3 <- gsub('서울','', data3)     # 서울이라는 단어 모두 없애기
data3 <- gsub('요청','', data3)     # 요청이라는 단어 모두 없애기
data3 <- gsub('제안','', data3)     # 제안이라는 단어 모두없애기
data3 <- gsub(' ','', data3)     # '' 모두 없애기
data3 <- gsub('-','', data3)     # - 모두 없애기
data3

write(unlist(data3), 'seoul_2.txt')
data4 <- read.table('seoul_2.txt')
data4

head(data4)
nrow(data4)
wordcount <- table(data4)
wordcount
head(sort(wordcount, decreasing = T), 20)

# 다시 삭제하고 싶은거 삭제하고 위에거 반복하기.
data3 <- gsub('OO','', data3)
data3 <- gsub('개선','', data3)
data3 <- gsub('문제','', data3)
data3 <- gsub('관리','', data3)
data3 <- gsub('민원','', data3)
data3 <- gsub('이용','', data3)
data3 <- gsub('관련','', data3)
data3 <- gsub('시장','', data3)
data3

write(unlist(data3), 'seoul_3.txt')
data4 <- read.table('seoul_3.txt')
wordcount <- table(data4)
head(sort(wordcount, decreasing = T),20)

# word Cloud 형태로 그래픽으로 출력
palete <- brewer.pal(8,'Dark2')

wordcloud(names(wordcount), freq = wordcount, scale = c(5,0.3), rot.per = 0.1, min.freq = 1,
          random.order = F, random.color = T, colors = palete)
legend(0.2, 0.9, '서울시 응답소 요청사항 분석', cex=0.6, fill=NA, border=NA, bg='white',
       text.col='red', text.font=2, box.col='red')

# '한' 하고 '님'하고 없애고 다시 실행
data3 <- gsub('님','', data3)
data3 <- gsub('한','', data3)

write(unlist(data3), 'seoul_3.txt')
data4 <- read.table('seoul_3.txt')
wordcount <- table(data4)
head(sort(wordcount, decreasing = T),20)

palete <- brewer.pal(8,'Dark2')

wordcloud(names(wordcount), freq = wordcount, scale = c(5,0.3), rot.per = 0.2, min.freq = 1,
          random.order = F, random.color = T, colors = palete)
legend(0.2, 0.9, '서울시 응답소 요청사항 분석', cex=0.6, fill=NA, border=NA, bg='white',
       text.col='red', text.font=2, box.col='red')


# KoNLP 패키지지
# 명사를 찾아줘잉
v1 <- ('봄이 지나면 여름이고 여름이 지나면 가을입니다.그리고 겨울이죠')
v1
extractNoun(v1)

# 띄어쓰기를 잘 해야 한다.
v2 <- ('봄이지나 면여름이고 여름이지나면가을 입니다')
extractNoun(v2)

v3 <- c('봄이 지나면 여름이고 여름이 지나면 가을입니다', '그리고 겨울이죠')
v3
extractNoun(v3)

v4 <- sapply(v3, extractNoun, USE.NAMES = F)
v4


# wordcloud 패키지지

wordcloud(c(letters, LETTERS, 0:9), seq(1,1000, len=62))
palete <- brewer.pal(9,'Set1')
wordcloud(c(letters,LETTERS,0:9), seq(1,1000, len=62), colors=palete)
