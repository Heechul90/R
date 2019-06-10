# ggplot / R Markdown 연습문제제
dev.off()
mpg
View(mpg)
# 문제 1
mpg1 <- mpg %>%
  select(cty, hwy)
mpg1

plot(mpg1, main='cty와 hwy의 산점도', col=c('blue', 'red'), xlim=c(5,38), ylim=c(10,45))
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
  head(5)
mpg3

ggplot(mpg3, aes(x=manufacturer, y=cty)) +
  geom_bar()
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

compact_cty <- mpg %>%
  filter(class== 'compact') %>%
  select(cty)
compact_cty

subcompact_cty <- mpg %>%
  filter(class== 'subcompact') %>%
  select(cty)
subcompact_cty

suv_cty <- mpg %>%
  filter(class== 'suv') %>%
  select(cty)
suv_cty

boxplot(compact_cty, main='compact_cty', col='red', names=c('cty'))
boxplot(subcompact_cty, main='subcompact_cty', col='yellow', names=c('cty'))
boxplot(suv_cty, main='suv_cty', col='green', names=c('cty'))


# 문제 7
diamond
# 집에서 하자하자
        
