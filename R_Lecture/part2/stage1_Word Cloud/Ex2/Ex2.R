# 예제 1-2 여고생은 어디를 가장 고치고 싶을까요?

setwd('D:/Heechul/R/R_Lecture/part2/stage1_Word Cloud/Ex2')
install.packages('KoNLP')
install.packages('wordcloud')
library(KoNLP)
library(wordcloud)
useSejongDic()
library(RColorBrewer)


# 위에 주요 패키지 설치하고 로딩해서 분석할 준비를 하자잉잉
data1 <- readLines('remake.txt')
data1

data2 <- sapply(data1, extractNoun,USE.NAMES = F)
data2

# step1 필요없는 단어 제거하기 1
data3 <- unlist(data2)
data3 <- Filter(function(x) {nchar(x) <= 10}, data3) #글자수 10개 이하만 걸러내자
head(unlist(data3), 30)

data3 <- gsub('\\d', '', data3)
data3 <- gsub('쌍수', '쌍꺼풀', data3)
data3 <- gsub('쌍커풀', '쌍커풀', data3)
data3 <- gsub('메부리코', '매부리코', data3)
data3 <- gsub('\\.', '', data3)
data3 <- gsub(' ', '', data3)
data3 <- gsub("\\'", '', data3)
data3

# step2 공백 제거 하기
write(unlist(data3), 'remake_2.txt')
data4 <- read.table('remake_2.txt')
data4
nrow(data4)
wordcount <- table(data4)
wordcount

# step3 필요 없는 단어들 제거하기2
head(sort(wordcount,decreasing = T), 20)
txt <- readLines('성형gsub.txt')
txt
cnt_txt <- length(txt)
cnt_txt
i <- 1
for(i in 1:cnt_txt) {
  data3 <- gsub((txt[i]), '', data3)
}
data3
data3 <- Filter(function(x) {nchar(x)>=2}, data3)
head(unlist(data3), 30)
write(unlist(data3),'remake_2.txt')
data4 <- read.table('remake_2.txt')
data4
nrow(data4)
wordcount <- table(data4)
wordcount
head(sort(wordcount, decreasing = T), 30)

# step4 워드클라우드를 생성하자자
palete <- brewer.pal(9,'Set3')
wordcloud(names(wordcount), freq = wordcount, scale = c(5,0.2), rot.per = 0.2, min.freq = 1,
          random.order = F, random.color = T, colors=palete)
legend(0.3, 1, '여고생들이 선호하는 성형수술 부위', cex=0.8,fill=NA,border=NA,bg='white',
       text.col='red', text.font=2, box.col='red')
