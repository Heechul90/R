iris
View(iris)

library(dplyr)
dev.off()
# 1번 산점도 그리기기
iris

setosa1 <- iris %>%
  filter(Species== 'setosa') %>%
  select(Sepal.Length, Sepal.Width)
setosa1

setosa2 <- iris %>%
  filter(Species== 'setosa') %>%
  select(Petal.Length, Petal.Width)
setosa2

versicolor1 <- iris %>%
  filter(Species== 'versicolor') %>%
  select(Sepal.Length, Sepal.Width)
versicolor1

versicolor2 <- iris %>%
  filter(Species== 'versicolor') %>%
  select(Petal.Length, Petal.Width)
versicolor2

virginica1 <- iris %>%
  filter(Species== 'virginica') %>%
  select(Sepal.Length, Sepal.Width)
virginica1

virginica2 <- iris %>%
  filter(Species== 'virginica') %>%
  select(Petal.Length, Petal.Width)
virginica2


par(mfrow=c(3,2))
plot(setosa1, main='setosa', col=c('blue','red'), xlim=c(0,8), ylim=c(0,8))
legend(0.2, 7, c('Sepal.Length', 'Sepal.Width'), cex = 0.7, col =c('blue','red'),pch=1)

plot(setosa2, main='setosa', col=c('blue','red'), xlim=c(0,8), ylim=c(0,8))
legend(0.2, 7, c('Petal.Length', 'Petal.Width'), cex = 0.7, col =c('blue','red') , pch=1)

plot(versicolor1, main='versicolor', col=c('blue','red'), xlim=c(0,8), ylim=c(0,8))
legend(0.2, 7, c('Sepal.Length', 'Sepal.Width'), cex = 0.7, col =c('blue','red') , pch=1)

plot(versicolor2, main='versicolor', col=c('blue','red'), xlim=c(0,8), ylim=c(0,8))
legend(0.2, 7, c('Petal.Length', 'Petal.Width'), cex = 0.7, col =c('blue','red') , pch=1)

plot(virginica1, main='virginica', col=c('blue','red'), xlim=c(0,8), ylim=c(0,8))
legend(0.2, 7, c('Sepal.Length', 'Sepal.Width'), cex = 0.7, col =c('blue','red') , pch=1)

plot(virginica2, main='virginica', col=c('blue','red'), xlim=c(0,8), ylim=c(0,8))
legend(0.2, 7, c('Petal.Length', 'Petal.Width'), cex = 0.7, col =c('blue','red') , pch=1)

dev.off()


# 2번품종별 평균치 비교하기
iris

a <- iris %>%
  group_by(Species) %>%
  summarise_each(funs(mean), Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
a
a1 <- a[,2:5]
a1 <- t(a1)
a1

par(mfrow=c(1,1))
barplot(as.matrix(a1), main= "품종별 평균", beside=T, col=rainbow(nrow(a1)), ylim=c(0,10),
        names.arg=c('setosa', 'versicolor', 'virginica'))
legend(1.5,10, c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width'), cex=0.8, fill=rainbow(nrow(a1)))

dev.off()

# 3번 Boxplot 12개 그리기.
iris
setosa <- filter(iris, Species=='setosa')
setosa <- select(setosa,-Species)
setosa

versicolor <- iris %>%
  filter(Species=='versicolor') %>%
  select(-Species)
versicolor

virginica <- iris %>%
  filter(Species=='virginica') %>%
  select(-Species)
virginica

par(mfrow=c(1,3))
boxplot(setosa, main='setosa', col=c('red', 'yellow', 'green', 'blue'),  
        names=c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width'),
        xlim=c(0,5), ylim=c(0,8))
legend(2.3,8, c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width'), 
       cex=0.8, fill =c('red', 'yellow', 'green', 'blue'))


boxplot(versicolor, main='versicolor', col=c('red', 'yellow', 'green', 'blue'), 
        names=c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width'),
        xlim=c(0,5), ylim=c(0,8))
legend(2.3,8, c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width'), 
       cex=0.8, fill =c('red', 'yellow', 'green', 'blue'))


boxplot(virginica, main='virginica', col=c('red', 'yellow', 'green', 'blue'), 
        names=c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width'),
        xlim=c(0,5), ylim=c(0,8))
legend(2.3,8, c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width'), 
       cex=0.8, fill =c('red', 'yellow', 'green', 'blue'))

dev.off()

