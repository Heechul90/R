# 연습문제 

setwd('D:/Heechul/R/R_Lecture/part2/stage1_Word Cloud/Exercise')
install.packages('KoNLP')
install.packages('wordcloud')
library(KoNLP)
library(wordcloud)
useSejongDic()
library(RColorBrewer)
library(stringr)

data1 <-readLines('응답소_2015_01.txt')
data2 <- sapply(data1, extractNoun, USE.NAMES = F)
data2
head(unlist(data2), 30)
cdata <- unlist(data2)
cdata
data2 <- str_replace_all(cdata, '[^[:alpha:]]', '')
data2 <- gsub(' ','', data2)
data2


txt <- readLines('응답했니gsub.txt')
txt
cnt_txt <- length(txt)
cnt_txt
i <- 1
for(i in 1:cnt_txt) {
  data2 <- gsub((txt[i]),'',data2)
}
data2

data2 <- Filter(function(x){nchar(x) >= 2}, data2)
data2
write(unlist(data2), 'data2.txt')
rep <- read.table('data2.txt')
nrow(rep)

wordcount <- table(rep)
head(sort(wordcount, decreasing = T), 20)

palete <- brewer.pal(9, 'Set1')
wordcloud(names(wordcount), freq = wordcount, scale=c(5,1), rot.per = 0.1, min.freq = 5,
          random.order = F, random.color = T, colors = palete)
legend(0.2, 0.9,'2015년도 1월 응답소의 질문 빈도', cex=0.8, fill=NA, border=NA, bg='white', 
       text.col='red', text.font=1, box.col='red')
