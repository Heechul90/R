iris
head(iris)
str(iris)
View(iris)
# 문제 1. 품종별로 Sepal/Petal의 Length, width 산점도 그리기 (총 6개)
setosa_Sepal <- iris %>%
  filter(Species == 'setosa') %>%
  select(Sepal.Length, Sepal.Width)
setosa_Sepal

setosa_Petal <- iris %>%
  filter(Species == 'setosa') %>%
  select(Petal.Length, Petal.Width)
setosa_Petal

versicolor_Sepal <- iris %>%
  filter(Species == 'versicolor') %>%
  select(Sepal.Length, Sepal.Width)
versicolor_Sepal

versicolor_Petal <- iris %>%
  filter(Species == 'versicolor') %>%
  select(Petal.Length, Petal.Width)
versicolor_Petal

virginica_Sepal <- iris %>%
  filter(Species == 'virginica') %>%
  select(Sepal.Length, Sepal.Width)
virginica_Sepal

virginica_Petal <- iris %>%
  filter(Species == 'virginica') %>%
  select(Petal.Length, Petal.Width)
virginica_Petal

par(mfrow=c(3,2))

ggplot(setosa_Sepal, aes(x=Sepal.Length, y= Sepal.Width)) +
  geom_point(position='jitter', color='red') +
  ggtitle('setosa의 Sepal 산점도')

ggplot(setosa_Petal, aes(x=Petal.Length, y= Petal.Width)) +
  geom_point(position='jitter', color='blue') +
  ggtitle('setosa의 Petal 산점도')

ggplot(versicolor_Sepal, aes(x=Sepal.Length, y= Sepal.Width)) +
  geom_point(position='jitter', color='black') +
  ggtitle('versicolor의 Sepal 산점도')

ggplot(versicolor_Petal, aes(x=Petal.Length, y= Petal.Width)) +
  geom_point(position='jitter', color='red', shape=1) +
  ggtitle('versicolor의 Petal 산점도')  

ggplot(virginica_Sepal, aes(x=Sepal.Length, y= Sepal.Width)) +
  geom_point(position='jitter', color='blue', shape=2) +
  ggtitle('virginica의 Sepal 산점도')

ggplot(virginica_Petal, aes(x=Petal.Length, y= Petal.Width)) +
  geom_point(position='jitter', color='black', shape=3) +
  ggtitle('virginica의 Petal 산점도')  

help(pch)

# 문제 2. 품종별 Sepal/Petal 의 Length/Width 평균을 비교하되,
# 항목을 옆으로 늘어놓은 것(beside=T)과 
# 위로 쌓아올린 것 2개를 그리시오.

str(iris)
iris_mean <- iris %>%
  group_by(Species) %>%
  summarise_each(funs(mean), Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
iris_mean
ggplot(iris_mean, aes(x=Species, y=Sepal.Length)) +
  geom_bar(stat = 'identity')
iris_mean[1,3]

library(reshape2)
melt_iris <- melt(iris_mean, id = c('Species'))
melt_iris

ggplot(melt_iris, aes(x=Species, y= value, fill= variable)) +
  geom_bar(stat = 'identity', position = 'dodge')

ggplot(melt_iris, aes(x=Species, y= value, fill= variable)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  coord_flip()

install.packages('ggplot')
library(ggplot)
gplot(melt_iris, aes(x=Species, y= value, fill= variable)) +
  geom_boxplot()
