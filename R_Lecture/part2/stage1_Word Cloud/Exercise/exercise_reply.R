# 연습문제 

setwd('D:/Heechul/R/R_Lecture/part2/stage1_Word Cloud/Exercise')
install.packages('KoNLP')
install.packages('wordcloud')
library(KoNLP)
library(wordcloud)
useSejongDic()
library(RColorBrewer)
library(stringr)

reply_1 <- readLines('응답소_2015_01.txt')
reply_11 <- sapply(reply_1, extractNoun, USE.NAMES = F)
reply_11
head(unlist(reply_11), 30)
reply_111 <- unlist(reply_11)
reply_111
reply_11 <- str_replace_all(reply_111, '[^[:alpha:]]', '')
reply_11 <- gsub(' ','', reply_11)
reply_11
write(unlist(reply_11), 'reply_201501.txt')
rep01 <- read.table('reply_201501.txt')
rep01

reply_2 <- readLines('응답소_2015_02.txt')
reply_22 <- sapply(reply_2, extractNoun, USE.NAMES = F)
head(unlist(reply_22), 30)
reply_222 <- unlist(reply_22)
reply_22<- str_replace_all(reply_222, '[^[:alpha:]]', '')
reply_22 <- gsub(' ','', reply_22)
reply_22
write(unlist(reply_22), 'reply_201502.txt')
rep02 <- read.table('reply_201502.txt')
rep02

reply_3 <- readLines('응답소_2015_03.txt')
reply_33 <- sapply(reply_3, extractNoun, USE.NAMES = F)
head(unlist(reply_33), 30)
reply_333 <- unlist(reply_33)
reply_33<- str_replace_all(reply_333, '[^[:alpha:]]', '')
reply_33 <- gsub(' ','', reply_33)
write(unlist(reply_33), 'reply_201503.txt')
rep03 <- read.table('reply_201503.txt')
rep03

reply_4 <- readLines('응답소_2015_04.txt')
reply_44 <- sapply(reply_4, extractNoun, USE.NAMES = F)
head(unlist(reply_44), 30)
reply_444 <- unlist(reply_44)
reply_44<- str_replace_all(reply_444, '[^[:alpha:]]', '')
reply_44 <- gsub(' ','', reply_44)
write(unlist(reply_44), 'reply_201504.txt')
rep04 <- read.table('reply_201504.txt')
rep04

reply_5 <- readLines('응답소_2015_05.txt')
reply_55 <- sapply(reply_5, extractNoun, USE.NAMES = F)
head(unlist(reply_55), 30)
reply_555 <- unlist(reply_55)
reply_55<- str_replace_all(reply_555, '[^[:alpha:]]', '')
reply_55 <- gsub(' ','', reply_55)
write(unlist(reply_55), 'reply_201505.txt')
rep05 <- read.table('reply_201505.txt')
rep05

reply_6 <- readLines('응답소_2015_06.txt')
reply_66 <- sapply(reply_6, extractNoun, USE.NAMES = F)
head(unlist(reply_66), 30)
reply_666 <- unlist(reply_66)
reply_66<- str_replace_all(reply_666, '[^[:alpha:]]', '')
reply_66 <- gsub(' ','', reply_66)
write(unlist(reply_66), 'reply_201506.txt')
rep06 <- read.table('reply_201506.txt')
rep06


rep001 <- union(rep01, rep02)
rep002 <- union(rep001, rep03)
rep003 <- union(rep002, rep04)
rep004 <- union(rep003, rep05)
rep <- union(rep004, rep06)

rep <- sapply(rep000, extractNoun, USE.NAMES = F)
head(unlist(rep), 30)
rep111 <- unlist(rep)
rep<- str_replace_all(rep111, '[^[:alpha:]]', '')
rep <- gsub(' ','', rep)
rep
write(unlist(rep), 'rep2015.txt')
totalrep <- read.table('rep2015.txt')
totalrep
totalrep <- gsub('\\d+','', totalrep)
totalrep <- gsub('한','', totalrep)
totalrep <- gsub('것','', totalrep)
totalrep <- gsub('수','', totalrep)
totalrep <- gsub('들','', totalrep)
totalrep <- gsub('님','', totalrep)
totalrep <- gsub('Q','', totalrep)
totalrep <- gsub('저','', totalrep)
totalrep <- gsub('일','', totalrep)
totalrep <- gsub('년','', totalrep)



wordcount <- table(totalrep)
totalrep
head(sort(wordcount, decreasing = T), 50)


txt <- readLines('응답했니gsub.txt')
txt
cnt_txt <- length(txt)
cnt_txt
i <- 1
for(i in 1:cnt_txt) {
  totalrep <- gsub((txt[i]),'',totalrep)
}
totalrep

reply2 <- Filter(function(x){nchar(x) >= 2 & nchar(x) <=7}, reply2)
reply2
write(unlist(reply2), 'reply_2.txt')
rev <- read.table('reply_2.txt')
nrow(rev)



wordcount <- table(rev)
head(sort(wordcount, decreasing = T), 100)

palete <- brewer.pal(9, 'RdBu')
wordcloud(names(wordcount), freq = wordcount, scale=c(3,1), rot.per = 0.1, min.freq = 100,
          random.order = F, random.color = T, colors = palete)
legend(0.2, 0.9,'2015년도 응답소의 질문 빈도', cex=0.8, fill=NA, border=NA, bg='white', 
       text.col='red', text.font=1, box.col='red')

