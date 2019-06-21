### dplyr 연습문제(복습)

setwd('D:/Heechul/R_Data_Analysis/R_Lecture/part3/review')
library(dplyr)
library(ggplot2)

# 문제 1
head(mpg)

mpg1 <- mpg %>%
  filter(displ<=4) %>%
  summarise(hwy_mean = mean(hwy))
mpg1
mpg1_1 <- mpg %>%
  filter(displ>=5) %>%
  summarise(hwy_mean = mean(hwy))
mpg1_1
mpg1;mpg1_1
class(mpg1)

# 문제 2
head(mpg)

mpg2 <- mpg %>%
  filter(manufacturer %in% c('audi', 'toyota')) %>%
  group_by(manufacturer) %>%
  summarise(cty_mean = mean(cty))
mpg2

# 문제 3
mpg3 <- mpg %>%
  filter(manufacturer %in% c('chevrolet', 'ford', 'honda')) %>%
  summarise(hwy_mean = mean(hwy))
mpg3

# 문제 4
mpg4 <- mpg %>%
  select(class, cty)
head(mpg4)

# 문제 5
head(mpg)

mpg5 <- mpg4 %>%
  filter(class %in% c('suv', 'compact')) %>%
  group_by(class) %>%
  summarise(cty_mean = mean(cty))
mpg5

# 문제 6
head(mpg)

mpg6 <- mpg %>%
  filter(manufacturer== 'audi') %>%
  select(manufacturer, hwy) %>%
  arrange(desc(hwy)) %>%
  head(5)
mpg6

# 문제 7-1
head(mpg)

mpg7 <- mpg %>%
  mutate(합산연비변수 = cty +hwy)
head(mpg7_1)

# 문제 7-2
mpg7 <- mpg7 %>%
  mutate(평균연비변수 = 합산연비변수/2)
head(mpg7)

# 문제 7-3
mpg7 <- mpg7 %>%
  arrange(desc(평균연비변수)) %>%
  head(3)
mpg7

# 문제 7-4
mpg77 <- mpg %>%
  mutate(합산연비변수 = cty+hwy, 평균연비변수 = 합산연비변수/2) %>%
  arrange(desc(평균연비변수)) %>%
  head(3)
mpg77

# 문제 8
head(mpg)

mpg8 <- mpg %>%
  group_by(class) %>%
  select(class, cty) %>%
  summarise(cty_mean = mean(cty))
mpg8

# 문제 9
mpg9 <- mpg8 %>%
  arrange(desc(cty_mean))
mpg9

# 문제 10
mpg10 <- mpg %>%
  group_by(manufacturer) %>%
  select(manufacturer, hwy) %>%
  summarise(hwy_mean = mean(hwy)) %>%
  arrange(desc(hwy_mean)) %>%
  head(3)
mpg10

# 문제 11
mpg11 <- mpg %>%
  group_by(manufacturer) %>%
  filter(class == 'compact') %>%
  summarise(n_compact = n()) %>%
  arrange(desc(n_compact))
mpg11
