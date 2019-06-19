setwd('D:/Heechul/R/R_Lecture/part2/stage3/Ex3-3')
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
library(googleVis)
useSejongDic()

data <- read.csv('2013년_서울_구별_주요과목별병원현황_구글용.csv', header=T)
data

# 구글차트로 바로 만들기
hos <- gvisColumnChart(data,option=list(title='지역별 병원형황', height=400, weight=500))
header <- hos$html$header
header <- gsub('utf-8','', header)
hos$html$header <- header
plot(hos)
