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

# 선생님 풀이
iris_setosa <- filter(iris, Species == 'setosa')
iris_versicolor <- filter(iris, Species == 'versicolor')
iris_virginica <- filter(iris, Species == 'virginica')

par(mfrow=c(3,2))
plot(iris_setosa$Sepal.Length, iris_setosa$Sepal.Width,
     xlab='Length', ylab='Width',
     xlim=c(4, 8.1), ylim=c(1.9, 4.5), main='Setosa 품종의 Sepal')
plot(iris_setosa$Petal.Length, iris_setosa$Petal.Width,
     xlab='Length', ylab='Width',
     xlim=c(0.8, 7), ylim=c(0, 2.6), main='Setosa 품종의 Petal')
plot(iris_versicolor$Sepal.Length, iris_versicolor$Sepal.Width,
     xlab='Length', ylab='Width',
     xlim=c(4, 8.1), ylim=c(1.9, 4.5), main='Versicolor 품종의 Sepal')
plot(iris_versicolor$Petal.Length, iris_versicolor$Petal.Width,
     xlab='Length', ylab='Width',
     xlim=c(0.8, 7), ylim=c(0, 2.6), main='Versicolor 품종의 Petal')
plot(iris_virginica$Sepal.Length, iris_virginica$Sepal.Width,
     xlab='Length', ylab='Width',
     xlim=c(4, 8.1), ylim=c(1.9, 4.5), main='Virginica 품종의 Sepal')
plot(iris_virginica$Petal.Length, iris_virginica$Petal.Width,
     xlab='Length', ylab='Width',
     xlim=c(0.8, 7), ylim=c(0, 2.6), main='Virginica 품종의 Petal')

# 2번품종별 평균치 비교하기
iris

a <- iris %>%
  group_by(Species) %>%
  summarise_each(funs(mean), Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
a
a1 <- a[,2:5]
a1
a2 <- t(a1)
a2

par(mfrow=c(1,1))
barplot(as.matrix(a2), main= "품종별 평균", beside=T, col=rainbow(nrow(a1)), ylim=c(0,10),
        names.arg=c('setosa', 'versicolor', 'virginica'))
legend(1.5,10, c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width'), cex=0.8, fill=rainbow(nrow(a1)))

barplot(as.matrix(a1), main= "품종별 평균", beside=T, col=rainbow(nrow(a1)), ylim=c(0,10),
        names.arg=c('setosa', 'versicolor', 'virginica'), space=0.1)
dev.off()

# 막대 그래프 하나더 그려야 함. barplot으로 하나의 막대기에 각각 평균을 나타내는 그래프.

# 선생님 풀이
par(mfrow=c(1,2))
mean_of_iris_setosa <- iris_setosa %>%
  summarise_each(list(mean), Sepal.Length, Sepal.Width,
                 Petal.Length, Petal.Width)
mean_of_iris_versicolor <- iris_versicolor %>%
  summarise_each(list(mean), Sepal.Length, Sepal.Width,
                 Petal.Length, Petal.Width)
mean_of_iris_virginica <- iris_virginica %>%
  summarise_each(list(mean), Sepal.Length, Sepal.Width,
                 Petal.Length, Petal.Width)
# barplot(as.matrix(mean_of_iris_setosa))
mean_of_iris <- t(rbind(mean_of_iris_setosa,
                        mean_of_iris_versicolor,
                        mean_of_iris_virginica))
colnames(mean_of_iris) <- c('Setosa', 'Versicolor', 'Virginica')
barplot(as.matrix(mean_of_iris), beside=T, main='품종별 평균',
        ylim=c(0,10),
        col=c('red','yellow','green','blue'))
legend(1, 10, 
       c("Sepal.length","Sepal.width","Petal.length","Petal.width"), cex=0.8,
       fill=c('red','yellow','green','blue'))

barplot(as.matrix(mean_of_iris), main='품종별 평균',
        ylim=c(0,25),
        col=c('red','yellow','green','blue'))
legend(0.2, 25, 
       c("Sepal.length","Sepal.width","Petal.length","Petal.width"), cex=0.8,
       fill=c('red','yellow','green','blue'))


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

# 선생님 풀이
par(mfrow=c(3,1))
boxplot(iris_setosa$Sepal.Length, iris_setosa$Sepal.Width,
        iris_setosa$Petal.Length, iris_setosa$Petal.Width,
        col=c('red','yellow','green','blue'),
        names=c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width'),
        main='Setosa')
boxplot(iris_versicolor$Sepal.Length, iris_versicolor$Sepal.Width,
        iris_versicolor$Petal.Length, iris_versicolor$Petal.Width,
        col=c('red','yellow','green','blue'),
        names=c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width'),
        main='Versicolor')
boxplot(iris_virginica$Sepal.Length, iris_virginica$Sepal.Width,
        iris_virginica$Petal.Length, iris_virginica$Petal.Width,
        col=c('red','yellow','green','blue'),
        names=c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width'),
        main='Virginica')
par(mfrow=c(1,1))
