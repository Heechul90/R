# 1차 평가 (19-06=14)
library(dplyr)
library(ggplot2)

# 1
vec1 <- 1:6; vec1
vec2 <- 10:5; vec2
vec3 <- rep(1:3, each=2); vec3
vec4 <- rep(1:3, 2); vec4
vec5 <- seq(1, 11, 2); vec5

# 2
name <- c('강경학', '김태균', '이성열', '정은원')
mid <- c(90, 78, 94, 70)
final <- c(50, 60, 90, 92)
df_score <- data.frame(이름=name, 중간=mid, 기말=final)
df_score

df_score <- df_score %>%
  mutate(평균 = (중간 + 기말)/2)
df_score

# 3
df_score <- df_score %>%
  mutate(학점 = ifelse(평균 >= 90, 'A',
                       ifelse(평균 >= 80, 'B',
                                ifelse(평균 >= 70, 'C',
                                         ifelse(평균 >= 60, 'D', 'F')))))
df_score

# 4
oddSum <- function(pos) {
  sum <- 0
  for (i in seq(1, pos, 2)) {
    sum <- sum + i
  }
  return(sum)
}
oddSum(100)

# 5
iris_s <- iris %>%
  filter(Species == 'setosa') %>%
  select(Sepal.Width)
iris_s
ggplot(iris_s, aes(y=Sepal.Width)) +
  geom_boxplot()
# boxplot(iris_s$Sepal.Width)
summary(iris_s)

iris_s$after <- ifelse(2.5 < iris_s$Sepal.Width & iris_s$Sepal.Width < 4.25, 
                       iris_s$Sepal.Width, NA)
iris_s
mean(iris_s$Sepal.Width); sd(iris_s$Sepal.Width)               # 이상치 제거전
mean(iris_s$after, na.rm = T); sd(iris_s$after, na.rm = T)     # 이상치 제거후

# 6
mpg %>%
  filter(manufacturer == 'toyota') %>%
  group_by(model) %>%
  summarise(avg = mean((cty + hwy)/2)) %>%
  arrange(desc(avg)) %>%
  head(3)

# 7
mpg_suv <- mpg %>%
  filter(class == 'suv') %>%
  group_by(manufacturer) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty)) %>%
  head(7)
mpg_suv

ggplot(mpg_suv, aes(x=reorder(manufacturer, -mean_cty), 
                    y=mean_cty, fill=manufacturer)) +
  geom_col()                    # geom_bar(stat='identity')

# 8
head(diamonds)
ggplot(diamonds, aes(x=clarity, fill=clarity)) +
  geom_bar()

df_clarity <- diamonds %>%
  group_by(clarity) %>%
  summarise(mean_price = mean(price))
ggplot(df_clarity, aes(x=clarity, y=mean_price, fill=clarity)) +
  geom_col()

# 9
bb <- read.csv('D:/Workspace/R_Data_Analysis/exam/야구성적.csv')
bb <- bb %>%
  mutate(OPS=출루율+장타율) %>% 
  mutate(연봉대비OPS=OPS/연봉*100)
# mutate(OPS=출루율+장타율, 연봉대비OPS=OPS/연봉*100)
head(bb)

library(extrafont)
windowsFonts(malgun = "맑은 고딕")
theme_update(text = element_text(family = "malgun"))
library(RColorBrewer)
palete = c(brewer.pal(12, 'Paired'), 
           brewer.pal(12, 'Paired'), '#56B4E9')
ggplot(bb, aes(x=선수명, y=연봉대비출루율)) +
  geom_bar(stat='identity', color=palete, fill=palete) +
  geom_text(aes(y=연봉대비출루율+0.8, label=연봉대비출루율), 
            color="black", size=3) +
  theme(axis.text.x=element_text(angle=45, hjust=1, vjust=1,
                                 colour="black", size=8)) +
  ggtitle('프로야구선수 밥값은 하고 있나?') +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue"))