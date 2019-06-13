### 예제 1-5. 대통령 신년 연설문 분석으로 정책 변화 예측하기
setwd('D:/Heechul/R/R_Lecture/part2/stage1_Word Cloud/ex1-5')
install.packages('KoNLP')     # 한국어 관련 작업을 할때 필요한 패키지
install.packages('wordcloud')     
install.packages('stringr')

library(KoNLP)
library(wordcloud)
library(stringr)
useSejongDic()

txt <- readLines('')
txt