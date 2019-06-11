# ggplot / R Markdown 연습문제제
dev.off()
mpg
View(mpg)
library(dplyr)
library(ggplot2)
str(mpg)
rm(list=ls())

# 문제 1
mpg01 <- mpg %>%
  select(cty, hwy)
mpg01

plot(mpg01, main='cty와 hwy의 산점도', col=c('blue', 'red'), xlim=c(5,38), ylim=c(10,45))
legend(5, 45, c('cty', 'hwy'), cex = 0.7, col =c('blue','red'),pch=1)


# 문제 2
midwest
View(midwest)
str(midwest)

midwest2 <- midwest %>%
  select(poptotal, popasian) %>%
  filter(poptotal<=500000, popasian<=10000)
midwest2

plot(midwest2, main='poptotal와 popasian의 산점도', col=c('blue', 'red'), xlim=c(0,500000), ylim=c(0,10000))
legend(100, 9500, c('poptotal', 'popasian'), cex = 0.5, col =c('blue','red'),pch=1)

# 문제 3 
mpg

mpg3 <- mpg %>%
  group_by(manufacturer) %>%
  filter(class=='suv') %>%
  select(manufacturer, class, cty) %>%
  summarise_each(funs(mean), cty) %>%
  arrange(desc(cty)) %>%
  head(5)
mpg3

ggplot(mpg3, aes(x=reorder(manufacturer, -cty), y=cty)) +
  geom_col()
dev.off()


# 문제 4  -pass
mpg

mpg4 <- mpg %>% 
  group_by(class) %>% 
  tally()
mpg4
mpg44 <- select(mpg4, n)
mpg44 <- t(mpg44)
mpg44

barplot(mpg44, main='Class', col='green',
        names=c('2seater', 'compact', 'minsize', 'minivan', 'pickup', 'subcompact', 'suv'))
dev.off()
  
  
# 문제 5
economics
View(economics)
economics <- economics %>%
  select(date, psavert)
economics

ggplot(economics, aes(x=date, y=psavert)) +
         geom_line()

dev.off()

# 문제 6
mpg


mpg6 <- mpg %>%
  filter(class %in% c("compact", "subcompact", "suv"))
ggplot(mpg6, aes(x=class, y=cty,)) +
  geom_boxplot()

# 문제 7
# 7-1
diamonds
diamonds
ggplot(diamonds, aes(x=cut)) +
  geom_bar()
        
# 7-2

diamonds7_2 <- diamonds %>%
  group_by(cut) %>%
  summarise_each(funs(mean), price)
diamonds7_2
  
ggplot(diamonds7_2, aes(x=cut, y=price,)) +
  geom_col()

  
# 7-3
diamonds7_3 <- diamonds %>%
  group_by(color) %>%
  summarise_each(funs(mean), price)
diamonds7_3

diamonds7_4 <- diamonds %>%
  group_by(cut) %>%
  summarise_each(funs(mean), price)
diamonds7_4

par(mfrow=c(1,2))
ggplot(diamonds7_3, aes(x=color, y=price)) +
  geom_col()

ggplot(diamonds7_4, aes(x=cut, y=price)) +
  geom_col()
