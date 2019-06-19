### 예제 1-3. 제주도 추천 여행코스 찾기
setwd('D:/Heechul/R/R_Lecture/part2/stage1_Word Cloud/ex1-3')
install.packages('KoNLP')     # 한국어 관련 작업을 할때 필요한 패키지
install.packages('wordcloud')     
install.packages('stringr')

library(KoNLP)
library(wordcloud)
library(stringr)
useSejongDic()

txt <- readLines('jeju.txt')
txt

place <- sapply(txt, extractNoun, USE.NAMES = F)
place

cdata <- unlist(place)

# str_replace_all(원본데이터),찾을글자,바꿀글자)
place <- str_replace_all(cdata,'[^[:alpha:]]','')     # 한글, 영어 외는 삭제
place <- gsub(' ','', place)

# 지울 단어 불러와서 반복문으로 지우기
txt <- readLines('제주도여행코스gsub.txt')
txt
cnt_txt <- length(txt)
cnt_txt
i <- 1
for(i in 1:cnt_txt) {
  place <- gsub((txt[i]), '', place)
}
place

# 필터링으로 지우기
place <- Filter(function(x){nchar(x) >=2}, place)
place

# 저장후 테이블로 불러서 공백 지우기
write(unlist(place), 'jeju_2.txt')
rev <- read.table('jeju_2.txt')
rev
nrow(rev)
wordcount <- table(rev)
wordcount
head(sort(wordcount, decreasing = T), 20)

# 워드크라우드 생성
library(RColorBrewer)
palete <- brewer.pal(9, 'Set1')

wordcloud(names(wordcount), freq=wordcount, scale=c(2,0.2), rot.per = 0.25,
          min.freq = 2, random.order = F, random.color = T, colors = palete)
legend(0.3, 1, '제주도 추천 여행 코스 분석', cex=0.5, fill=NA, border=NA,
       bg='white', text.col='red', text.font=4, box.col='red')
