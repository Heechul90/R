setwd('D:/Heechul/R/R_Lecture/part2/stage3/Ex3-4')
install.packages('KoNLP')
install.packages('wordcloud')
install.packages('stringr')
library(KoNLP)
library(wordcloud)
library(stringr)
library(ggplot2)
library(dplyr)
library(plyr)
install.packages('reshape')
library(reshape)
useSejongDic()

count <- read.csv('연도별요양기관별보험청구건수_2001_2013_세로.csv', stringsAsFactors=F)
count

colname <- count$년도
v1 <- count[,2]/100000
v2 <- count[,3]/100000
v3 <- count[,4]/100000
v4 <- count[,5]/100000
v5 <- count[,6]/100000
v6 <- count[,7]/100000
v7 <- count[,8]/100000
v8 <- count[,9]/100000
v9 <- count[,10]/100000
v10 <- count[,11]/100000

plot(v1, xlab='', ylab='', ylim=c(0,6000), axes = F, col='violet', type='o', lwd=2, 
     main=paste('연도별 요양 기관별 보험 청구 건수(단위:십만건)','\n','출처:건강보험심사평가원'))
axis(1, at=1:10, label=colname, las=2)
axis(2,las=1)

lines(v2, col='blue', type='o', lwd=2)
lines(v3, col='red', type='o', lwd=2)
lines(v4, col='black', type='o', lwd=2)
lines(v5, col='orange', type='o', lwd=2)
lines(v6, col='green', type='o', lwd=2)
lines(v7, col='cyan', type='o', lwd=2)
lines(v8, col='yellow', type='o', lwd=2)
lines(v9, col='brown', type='o', lwd=2)
lines(v10, col='pink', type='o', lwd=2)

for(i in 2:10) {
  lines(v[i,], col=colors[i], type = 'o', lwd=2)
}


abline(h=seq(0,6000,500), v=seq(1,100,1), lty=3,lwd=0.2)
col <- names(count[1,2:10])
colors <- c('violet', 'blue', 'red', 'black', 'orange', 'green', 'cyan', 'yellow', 'brown', 'pink')
legend(1,6000, col, cex=0.3, col=colors, lty = 1, lwd = 2, bg='white')


# ggplot
count2 <- melt(count, id=c('년도'), 
                variable.name = '종합병원',
                value.name= '건수')
count2
