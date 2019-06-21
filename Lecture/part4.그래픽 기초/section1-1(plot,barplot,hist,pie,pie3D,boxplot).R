# 2019-06-07 (그래프)
setwd('D:/Heechul/R/R_Lecture/part4')

# plot
var1 <- c(1,2,3,4,5)
plot(var1)

var1 <- 5:1
plot(var1)
var2 <- c(2,2,2)
plot(var2)

x <- 1:3
y <- 4:2
plot(x, y)

# xlim, ylim x,y 축 길이를 지정해 주는 옵션.
plot(x, y, xlim = c(1,10), ylim = c(1,5))

# xlab= 'X축 이름', ylab= 'Y축 이름', main= '메인제목')
plot(x, y, xlim = c(1,10), ylim = c(1,5), 
     xlab= 'X축 값', ylab= 'Y축 값', main= 'Plot Test')

# 여러개 옵션 넣어 그래프 그리기기
v1 <- c(100, 130,120,160,150)
plot(v1, type='o', col='red', ylim = c(0,200), axes = F, ann = F)
axis(1, at=1:5, lab=c('MON', 'TUE', 'WED', 'THU', 'FRI'))
axis(2, ylim=c(0,200))
title(main= 'FRUIT', col.main= 'red', font.main=4)
title(xlab= 'DAY', col.lab= 'black')
title(ylab= 'PRICE', col.lab='blue')

# 그래프의 배치 조정하기기   par(mfrow= c(nr,nc)) nr=행의 갯수, nc= 열의 갯수
v1
par(mfrow=c(1,3))
plot(v1, type='o')
plot(v1, type='s')
plot(v1, type='l')

# 여러 다양한 그래프도 넣을 수 있음.
v1
par(mfrow=c(1,3))
pie(v1)     # 동그라미 형식
plot(v1, type='o')
barplot(v1)     # 막대그래프

# 그래프 그릴 때 여백 조정하기기
par(mfrow=c(1,1))
a <- seq(1:3)
plot(a, xlab='aaa')

par(mgp=c(0,1,0))     # mgp=c(제목위치, 지표값위치, 지표선위치)
plot(a, xlab='aaa')

par(oma=c(0,2,0,0))     # oma=c(아래, 왼, 위, 오)
plot(a, xlab='aaa')

# 여러개의 그래프를 중첩으로 그리기기
par(mfrow=c(1,1))
v1<- c(1,2,3,4,5)
v2<- c(5,4,3,2,1)
v3<- c(3,4,5,6,7)
plot(v1, type='s', col='red', ylim=c(1,7))
par(new=T)     # 이 메세지가 중복을 허용하는 메세지
plot(v2, type='o', col='blue', ylim = c(1,7))     # lim 설정 맞춰서 하자!
par(new=T)
plot(v3, type='l', col= 'green')


v1<- c(1,2,3,4,5)
v2<- c(5,4,3,2,1)
v3<- c(3,4,5,6,7)
plot(v1, type='s', col='red', ylim=c(1,10))
lines(v2, type='o', col='blue', ylim=c(1,5))
lines(v3, type='l', col='green', ylim=c(1,15))

# legend(x 축 위치, y축 위치 내용, cex=글자크기, col=색상, pch=크기, lty=선모양)
legend(4,9,c('v1','v2','v3'), cex=0.9, col=c('red', 'blue', 'green'), lty=1)


# barplot 막대그래프프
x <- 1:5
x
barplot(x)     # 기본 그래프 그리기
barplot(x, horiz = T)     # 그래프를 가로로 출력

x <- matrix(c(5,4,3,2),2,2) # = matrix(c(5,4,3,2), nrow=2) 
# 그룹으로 묶어서 출력
barplot(x, beside=T, names=c(5,3), col=c('green', 'yellow'))

#하나의 막대 그래프로 출력
barplot(x, names=c(5,3), col=c('green', 'yellow'), ylim=c(0,12))

#그룹으로 묶어서 가로로 출력
par(oma=c(2, 0.5, 1, 0.5))
barplot(x,names=c(5,3), beside=T, col = c('green', 'yellow'), horiz = T)

# 하나의 막대 그래프에 두개 합쳐서 눕혀서 출력
barplot(x, horiz = T, names=c(5,3), col = c('green', 'yellow'), xlim = c(0,12))

# 여러 막대 그래프를 그룹으로 묶어서 한꺼번에 출력
v1 <- c(100,120,140,160,180)
v2 <- c(120,130,150,140,170)
v3 <- c(140,170,120,110,160)

qty <- data.frame(BANANA = v1, CHERRY=v2, ORANGE=v3)
qty
barplot(as.matrix(qty), main='Fruit\'s Sales QTY', 
        beside=T, col=rainbow(nrow(qty)), ylim=c(0,400))
legend(14, 400, c('MON', 'TUE', 'WED', 'THU', 'FRI'), cex=0.8, fill=rainbow(nrow(qty)))

# 하나의 막대 그래프에 여러가지 내용을 한거번에 출력       
barplot(t(qty), main='Fruits, Salse QTY', ylim=c(0,900), col= rainbow(length(qty)),
        space = 0.1, cex.axis=0.8, las=1, names.arg = c('MON', 'TUE', 'WED', 'THU', 'FRI'), cex=0.8)
legend(0.2, 800, names(qty), cex=0.7, fill=rainbow(length(qty)))

# t(transpose 행과 열을 바꿔주는 함수)
qty
t(qty)

# 조건을 주고 그래프 그리기
peach <- c(180,200,250,198,170)
colors <- c()
for(i in 1:length(peach)) {
  if(peach[i] >= 200) {
    colors <- c(colors,'red')
  } else if(peach[i] >=180) {
    colors <- c(colors, 'yellow') 
  } else {
    colors <- c(colors, 'green')
  }
}
barplot(peach, main='Peach Sales QTY', names.arg=c('MON', 'TUE', 'WED', 'THU', 'FRI'), col=colors)

# 히스토그램 그래프 그리기 hist()
height <- c(182,175,167,172,163,178,181,166,159,155)
hist(height, main = 'histogram of height')

par(mfrow=c(1,2), oma=c(2, 2, 0.1, 0.1))
hist <- c(1,1,2,3,3,3)
hist(hist)
plot(hist, main='Plot')



# 파이(pie) 모양의 차트 그리기 pie()
par(mfrow=c(1,1), oma=c(0.5, 0.5, 0.1, 0.1))
p1 <- c(10,20,30,40)

# 기본적인 pie 그래프 그리기기
pie(p1, radius=1)

#시작 각도를 90도로 지정하기
pie(p1, radius=1, init.angle=90)

# 색과 label명을 지정하기기
pie(p1, radius=1, init.angle=90, col= rainbow(length(p1)), label=c('Week1', 'Week2', 'Week3', 'Week4'))

# 수치값을 함께 출력
pct <- round(p1/sum(p1)*100, 1)
lab <- paste(pct, '%')
pie(p1, radius = 1, init.angle = 90, col = rainbow(length(p1)), label=lab)
legend(1, 1.1, c('Week1', 'Week2', 'Week3', 'Week4'), cex = 0.5, fill=rainbow(length(p1)))

# 범례를 생략하고 그래프에 바로 출력
pct <- round(p1/sum(p1)*100, 1)
lab1 <- c('Week1', 'Week2', 'Week3', 'Week4')
lab2 <- paste(lab1, '\n', pct, '%')
pie(p1, radius = 1, init.angle = 90, col = rainbow(length(p1)), label=lab2)

#pie3D() 함수
install.packages('plotrix')
library(plotrix)

p1<- c(10,20,30,40,50)
f_day <-round(p1/sum(p1)*100, 1)
f_label <- paste(f_day, '%')
pie3D(p1, main='3D Pie Chart', col=rainbow(length(p1)), cex=0.5, labels = f_label, explode=0.05)            
legend(0.5, 1.1, c('MON', 'TUE', 'WED', 'THU', 'FRI'), cex = 0.6, fill=rainbow(length(p1)))

# 상자 차트 boxplot()       통ㄱ\ㅖ학에서 아주 중요함.
v1 <- c(10,12,15,11,20)
v2 <- c(5,7,15,8,9)
v3 <- c(11,20,15,18,13)

boxplot(v1,v2,v3)    # v2 의 15가 이상치.

boxplot(v1,v2,v3, col=c('blue', 'yellow', 'pink'), names=c('Blue', 'Yellow', 'Pink'), horizontal=T)
