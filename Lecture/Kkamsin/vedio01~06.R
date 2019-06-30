### 03. 깜신 통계

setwd('D:/Heechul/R_Data_Analysis/Lecture/Kkamsin')

# 필요 패키지
library(pwr)

ky <- read.csv('data/KY.csv', header = T, sep = ',')
ky



### 05.
# Power analysis (적정 n수 산출)
# effective size(d) = cohen's d
# 실험군과 대조군의 n 수가 동일할때의 공식
# pooled SD =abs(mean.1-mean.2) / sqrt(s.1^2 + s.2^2 / 2) : n수가 같을때
# pooled SD =sqrt((s.1^2)*(n1-1) + (s.2^2)*(n2-1) / (n.1-1) + (n2-1) # n수가 다를때

# 각 그룹의 평균
mean.1 <- mean(ky$score[ky$group == 1])
mean.1
mean.2 <- mean(ky$score[ky$group == 2])
mean.2

# 각 그룹의 표준편차
sd.1 <- sd(ky$score[ky$group == 1])
sd.1
sd.2 <- sd(ky$score[ky$group == 2])
sd.2

# 전체 데이터를 살펴보자
summary(ky)

# effect size 를 구하는 코드
effectSize <- abs(mean.1-mean.2)/(sqrt((sd.1^2+sd.2^2)/2))
effectSize
effectSize <- abs(mean.1-mean.2)/(sqrt((sd.1^2*(nrow(group.1)-1)+sd.2^2*(nrow(group.2)-1))/((nrow(group.1)-1)+(nrow(group.2)-1))))


pwr.t.test(d= effectSize, power=.8, sig.level=.05, 
           type="two.sample", alternative="two.sided")


### 06. 두 그룹의 평균 비교
