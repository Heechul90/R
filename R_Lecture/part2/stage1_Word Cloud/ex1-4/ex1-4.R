### 예제 1-4. 연설문 분석 후 Word Cloud 생성하기
setwd('D:/Heechul/R/R_Lecture/part2/stage1_Word Cloud/ex1-4')
install.packages('KoNLP')     # 한국어 관련 작업을 할때 필요한 패키지
install.packages('wordcloud')     
install.packages('stringr')

library(KoNLP)
library(wordcloud)
library(stringr)
useSejongDic()

txt <- readLines('')
txt