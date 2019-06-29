### 29. 회귀분석

setwd('D:/Heechul/R_Data_Analysis/Lecture/Kkamsin')

## 빅데이터, 인공지능(머신러닝, 딥러닝)
# 단순회귀분석은 일차원
# 다중회귀분석
# 적정모형선택 : 어떤 변수를 선택해야 적절하게 회귀모형을 가장 잘  설명할까?
# 선택하는 방법
# 1. backword regresiion
# 모든 변수를 넣어서 하나씩 빼가면서 검사하는것(pvalue값 낮을걸 빼면서).(AIC)
# pvalue 값이 증가했을때 그 바로 이전 모형은 선택
# 2. forward regression
# pvalue가 가장 낮은걸 추가해 가면서 검사하는것
# AIC 값이 감소하다가 증가하는 시점 까지 진행


### 30. 단순선형회귀

women

plot(weight ~ height, data = women)
fit <- lm(weight ~ height, data = women)
abline(fit, col = 'red')



summary(fit)
cor.test(women$weight, women$height)

par(mfrow = c(2,2))
plot(fit)


# 선형선을 만족하지 않는다.
# 이럴때 다항회귀분석을 한다(곡선 그래프)

fit2 <- lm(weight ~ height + I(height^2), data = women)
summary(fit2)
par(mfrow = c(1,1))
plot(weight ~ height, data = women)
lines(women$height, fitted(fit2), col='green')


par(mfrow= c(2,2))
plot(fit2)

# 3차곡선도 시도해본다.
# 정규성에서 fit2보다 떨어지기 때문에 fit2를 선택한다.
fit3 <- lm(weight ~ height + I(height^2) + I(height^3), data = women)
summary(fit3)
plot(fit3)


### 31. 다중회귀분석
state.x77

states <- as.data.frame(state.x77[,c('Murder', 'Population', 'Illiteracy', 'Income', 'Frost')])
head(states)

fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data = states)
summary(fit)
plot(fit)

## 검증을 먼저 한다.
## 1. 다중공선성(multicolinearity) : 각각의 상관관계가 있는지 알아보는 것.
install.packages('car', dependencies = T)
library(car)

# VIF 검정을 먼저해서 sqrt(vif) > 2면 제외 시킨다.
vif(fit)
sqrt(vif(fit))
# 4개변수 가 다중공선성에서 자유롭다.(통과)

## 2. 이상 관측치
# 1)이상치(outlier)
# 표준 잔차에 2배 이상 크거나 -2배이상 작은값
# 정규분포를 따를때 p_value가 0.05보다 작을때

# 2) 큰지례점(high levarage paints)
# 평균hat 통계량 : p(인수들의 숫자+ y절편) / n(총 수) <- 이것에 2~3배라면 확인해볼것.

# 3)영향관측치(influential observation)
#

### 32. 이상관측치 검정
par(mfrow = c(1,1))
influencePlot(fit, id.method = 'identity')
#  -2 <= 표준편차 <= 2
#  평균 hat 통계량 5 / 50 : 0.1

### 33. 회귀모형의 교정
states

# 1) 정규성을 만족하지 않았을 때
powerTransform(states$Murder) # murder 결과 값에 0.605542 배를 하는게 어떨까?(제안)
summary(powerTransform(states$Murder)) # 0.6배를 해도 p_value가 0.05보다 커서 별 차이 없다.

# 2) 선형성을 만족하지 않았을 때 
boxTidwell(Murder ~ Population + Illiteracy, data = states) # P_value가 0.05보다 커서 괜찮음

# 3) 등분산성을 만족하지 않았을 때
ncvTest((fit)) # P_value가 0.05보다 커서 괜찮음
spreadLevelPlot(fit) # 등분산성을 하지 않았다면 1.2096배 하면 된다.(제안)



### 34. 예측 변수 선택
fit1 <- lm(Murder ~., data=states)
summary(fit1)

# Income, Frost의 p_value가 낮으니 한번 빼보자
fit2 <- lm(Murder ~ Population + Illiteracy, data=states)
summary(fit2)   # Population, Illiteracy 의 p_value가 높아졌다. 설명력도 높아졌다.

# 이런 경우의 수는 많아서 가장 좋은 회귀모델을 만들기 위해 AIC를 이용
AIC(fit1, fit2) # fit2가 더 적합한 모델이다(적은 수치가 더 나은 모델)

# stepwise regression (Backward stepwise regression, Forward stepwise regression)
# Backward stepwise regression
# 모든 변수들을 모두 포함시키는 풀 모델을 만들고
# p_value가 적은 값을 빼면서 AIC값이 감소하는지 증가하는지 검사를 함.
full.model <- lm(Murder~., data=states)
reduced.model <- step(full.model, direction = 'backward')
summary(reduced.model)

# forward stepwise regression
# P_value가 가장 높은 변수를 추가하면서 AIC값이 감소하는지 증가하는지 검사를 함.
min.model = lm(Murder~1, data = states)
fwd.model <- step(min.model, 
                  direction = 'forward',
                  scope = (Murder ~Population + Illiteracy + Income + Frost),
                  trace = 0)
summary(fwd.model)

## 이 두가지 경우는 그 뒤에 나오는 경우를 생각지 않아서 단점이 된다
## 그래서 보안해서 나온게 all subset regression

# all subset regression
install.packages('leaps')
library(leaps)

leaps <- regsubsets(Murder ~ Population + Illiteracy + Income + Frost,
                    data = states,
                    nbest = 4)

plot(leaps, scale = 'adjr2')
