### 예제 2-2. 고객 불만 게시판 분석 후 결과를 그래프로 표시하기
setwd('D:/Heechul/R/R_Lecture/part2/stage2/ex2-2')
install.packages('KoNLP')     # 한국어 관련 작업을 할때 필요한 패키지
install.packages('wordcloud')     
install.packages('stringr')
install.packages('ggplot2')
install.packages('dplyr')
install.packages('coord')
library(KoNLP)
library(wordcloud)
library(stringr)
library(ggplot2)
library(dplyr)
library(RColorBrewer)
useSejongDic()

myray <- readLines('data/new_myray.txt')
myray
myray <- sapply(myray, extractNoun, USE.NAMES = F)
myray
myray <- unlist(myray)
myray
myray <- Filter(function(x) {nchar(x) >=2}, myray)
myray
myray <- gsub(' ','-', myray)
myray <- gsub('교체','', myray)
myray <- gsub('작동','', myray)
myray <- gsub('교환','', myray)
myray <- gsub('ㅠㅠ','', myray)
myray <- gsub('\\d+','', myray)
myray <- gsub('\\.','', myray)
myray
write(unlist(myray), 'myray_2.txt')
rev <- read.table('myray_2.txt')
rev
nrow(rev)
wordcount <- table(rev)
wordcount

brewer.pal.info
palete <- brewer.pal(10, 'Spectral')

wordcloud(names(wordcount), freq=wordcount, scale=c(2,0.3), rot.per = 0.25,
          min.freq = 2, random.order = F, random.color = T, colors = palete)

top10 <- head(sort(wordcount, decreasing = T), 10)
top10
length(top10)
df_top10 <- data.frame(top10)
df_top10

colors <- c()
i <-1
for(i in 1:length(top10)) {
  if(top10[i] >=8) {
    colors <- c(colors, 'red')
  } else if(top10[i] >= 6) {
    colors <- c(colors, 'yellow')
  } else {
    colors <- c(colors, 'green')
  }
}

barplot(top10, main="고객 불만 사항 상위 TOP 10", 
        ylab="불만건수", names.arg=names(top10),
        col=colors, las=2, ylim=c(0,13)) 
### 선 넣기 
abline(h=7, col='red', lty=1, lwd=5)
abline(h=6, col='red', lty=2, lwd=4)
abline(h=5, col='red', lty=2, lwd=3)
abline(h=4, col='red', lty=2, lwd=2)
abline(h=3, col='red', lty=2, lwd=1)


ggplot(df_top10, aes(x=rev, y=Freq, fill=colors)) +
  geom_bar(stat = 'identity') +
  ggtitle('고객 분만 상위 TOP 10')

colors <- c()



  theme(plot.title = element_text(face = "bold", hjust = 0.5,
                                  size = 15, color = "black")) +# 그래프 제목 수정
  ylab('') +
  xlab('') +
  theme(axis.text.x=element_text(angle=90, hjust=1, vjust=0, colour="black", size=8)) + # x축 변수 이름 수정
  theme(axis.text.y=element_text(hjust=0, vjust=1, colour="black", size=8)) +  # y축 변수 이름 수정
  # geom_text(aes(y=Freq+0.5, label=ylabel03), color='black') +
  geom_text(aes(y=Freq+1, label=ylabel01), color='black', size=3) +
  geom_text(aes(y=Freq-1, label=ylabel02), color='black', size=3) +
  theme_classic()
  

