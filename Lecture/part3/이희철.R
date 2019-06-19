# dplyr 연습문제(ppt)
install.packages('ggplot2')
library('ggplot2')
mpg

# 문제1
mpg %>%
  filter(displ<=4) %>%
  summarise(avarage=mean(hwy,na.rm = T)) # 자동차 배기량이 4 이하인 자동차의 고속도로 연비 평균

# 평균hwy = 25.96319
mpg %>%
  filter(displ>=5) %>%
  summarise(avarage=mean(hwy,na.rm = T)) # 자동차 배기량이 5 이상인 자동차의 고속도로 연비 평균
# 평균hwy = 18.07895
# 문제1 선생님 풀이
mpg4 <- filter(mpg, displ <= 4)
mpg5 <- filter(mpg, displ >= 5)
mean(mpg4$hwy); mean(mpg5$hwy)


# 문제2 ??
mpg
mpg %>%
  group_by(manufacturer %in% c('audi', 'toyota')) %>%
  summarise_each(funs(mean), cty) # 각 제조사의 cty의 평균
 

# audi의 cty 평균연비 = 17.6 ,toyota의 cty 평균연비 = 18.5
# 문제2 선생님풀이이
mpg_a <- filter(mpg, manufacturer=='audi')
mpg_t <- filter(mpg, manufacturer=='toyota')
mean(mpg_a$cty); mean(mpg_t$cty)

mpg %>%
  filter(manufacturer %in% c('audi', 'toyota')) %>%
  group_by(manufacturer) %>%
  summarise(average = mean(cty))

# 문제3
hwy1 <- mpg %>%
  group_by(manufacturer) %>%
  summarise_each(funs(mean), hwy) # 각 제조사의 hwy의 평균
hwy1
hwy2 <- filter(hwy1, manufacturer %in% c('chevrolet','ford', 'honda'))
hwy2 # chevrolet, ford, honda 각각의 hwy의 평균
hwy1 %>%
  summarise_each(funs(mean), hwy) # chevrolet, ford, honda의 hwy의 평균
# 문제3 선생님풀이
mpg %>%
  filter(manufacturer %in% c('chevrolet', 'ford', 'honda')) %>%
  summarise(average = mean(hwy))

# 문제4
mpg
mpg1 <- select(mpg, class, cty)
mpg1 # class, cty로만 구성
# 문제4 선생님 풀이
mpg_4 <- select(mpg, class, cty)
head(mpg_4); tail(mpg_4)

# 문제5
mpg %>%
  filter(class %in% c('suv', 'compact')) %>%
  group_by(class) %>%
  summarise_each(funs(mean),cty ) %>% # class 별로 cty 평균 연비
  arrange(desc(cty))
# compact의 cty = 20.4, suv의 cty = 13.5

# 문제5 선생님 풀이 
mpg_4 %>%
  filter(class %in% c('suv', 'compact')) %>%
  group_by(class) %>%
  summarise(average = mean(cty))

# 문제6
mpg %>%
  filter(manufacturer=='audi') %>%
  select(manufacturer, model, hwy) %>%
  arrange(desc(hwy)) %>%
  head(5)

# 문제6 선생님풀이 
mpg %>%
  filter(manufacturer == 'audi') %>%
  select(manufacturer, model, hwy) %>%
  arrange(desc(hwy)) %>%
  head(5)

# 문제7-1
mpg
mpg %>%
  select(manufacturer, cty, hwy) %>%
  mutate(합산연비변수 = cty+hwy)
# 문제 7-1 선생님 풀이
mpg_new <- mpg %>%
  mutate(cty_hwy = cty + hwy)

#문제7-2
mpg3
mpg3 %>%
  select(manufacturer, cty, hwy, 합산연비변수) %>%
  mutate(평균연비변수 = 합산연비변수/2)
# 문제 7-2 선생님 풀이
mpg_new <- mpg_new %>%
  mutate(ch_avg = cty_hwy /2)

# 문제7-3
mpg4 <- mpg3 %>%
  select(manufacturer, cty, hwy, 합산연비변수) %>%
  mutate(평균연비변수 = 합산연비변수/2) %>%
  arrange(desc(평균연비변수)) %>%
  head(3)
mpg4
# 문제 7-3 선생님 풀이
mpg_new %>%
  arrange(desc(ch_avg)) %>%
  head(3)

 # 문제 7-4mpg\
mpg
mpg %>%
  select(manufacturer, cty, hwy) %>%
  mutate(합산연비변수 = cty+hwy) %>%
  mutate(평균연비변수 = 합산연비변수/2) %>%
  head(3)

# 문제 7-4 선생님 풀이
mpg %>%
  select(-displ:-drv) %>%
  mutate(cty_hwy = cty + hwy, ch_avg = cty_hwy/2) %>%
  arrange(desc(ch_avg)) %>%
  head(3)

# 문제8
mpg
mpg %>%
  group_by(class)
# 문제 8 선생님 풀이
mpg %>%
  group_by(class) %>%
  summarise(average = mean(cty))  


# 문제9


# 문제 9 선생님 풀이
mpg %>%
  group_by(class) %>%
  summarise(average = mean(cty)) %>%
  arrange(desc(average))


# 문제10

# 문제 10 선생님 풀이
mpg %>%
  group_by(manufacturer) %>%
  summarise(average = mean(hwy)) %>%
  arrange(desc(average)) %>%
  head(3)

# 문제11


# 문제11 선생님 풀이
mpg %>%
  filter(class == 'compact') %>%
  group_by(manufacturer) %>%
  summarise(count = n()) %>%
  arrange(desc(count))