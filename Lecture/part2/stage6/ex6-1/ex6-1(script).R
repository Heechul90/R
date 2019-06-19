# 예제 6-1. 사원들의 상반기 실적 분석하기 - boxplot 사용
setwd('D:/Workspace/R_Data_Analysis/Part2/Stage6_Real/Ex61_Employee')

library(ggplot2)
score <- read.csv("상반기사원별월별실적현황_new.csv ")
score

ggplot(score, aes(factor(이름), 실적금액)) +
  geom_boxplot()

ggplot(score, aes(factor(이름), 실적금액)) +
  geom_boxplot() + 
  geom_jitter()

ggplot(score, aes(factor(이름), 실적금액)) +
  geom_boxplot(aes(fill=(이름)))