### 도전미션 1-1. 성형수술 부작용 관련 키워드 분석하기
setwd('D:/Heechul/R/R_Lecture/part2/stage1_Word Cloud/ch1-1')
install.packages('KoNLP')     # 한국어 관련 작업을 할때 필요한 패키지
install.packages('wordcloud')     

library(KoNLP)
library(wordcloud)
useSejongDic()

data1 <- readLines('remake2.txt')
data1

data2 <- sapply(data1, extractNoun, USE.NAMES = F)
data2

data3 <- unlist(data2)
data3

data3 <- gsub('\\d+','', data3)
data3 <- gsub('\\.','', data3)     #
data3 <- gsub(' ','', data3)
data3 <- gsub("\\'",'', data3)     #
data3 <- Filter(function(x) {nchar(x) <= 10}, data3) # 필터해서 10글자 이하만 남게
data3 <- Filter(function(x) {nchar(x) >= 2}, data3) # 필터해서 10글자 이하만 남게

data3

txt <- readLines('성형부작용gsub.txt')     # 제거하고 싶은 단어 목록을 불러옴
txt
cnt_txt <- length(txt)
cnt_txt
i <- 1
for(i in 1:cnt_txt) {
  data3 <- gsub((txt[i]),'', data3)  # i가 1일때 첫번째 단어 '' 바꾸고 다시 돌아가서 2번째 실행
}
data3

write(unlist(data3), 'remake2_2.txt')
data4 <- read.table('remake2_2.txt')
data4
nrow(data4)
wordcount <- table(data4)
wordcount
head(sort(wordcount, decreasing = T),20)

library(RColorBrewer)
palete <- brewer.pal(8, 'Set2')
wordcloud(names(wordcount), freq=wordcount, scale=c(4,0.2), rot.per = 0.25,
          min.freq = 2, random.order = F, random.color = T, colors = palete)
legend(0.2, 1, '성형수술 부작용 관련 키워드 분석', cex=0.7, fill=NA, border=NA,
       bg='white', text.col='red', text.font=4, box.col='black')

