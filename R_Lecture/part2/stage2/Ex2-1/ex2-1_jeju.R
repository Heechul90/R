setwd('D:/Heechul/R/R_Lecture/part2/stage2/Ex2-1')
install.packages('KoNLP')
install.packages('wordcloud')
install.packages('stringr')
library(KoNLP)
library(wordcloud)
library(stringr)
library(ggplot2)
library(dplyr)
useSejongDic()
mergeUserDic(data.frame(readLines('data/제주도여행지.txt'), 'ncn'))

# 글씨바꾸기
install.packages('extrafont')
library(extrafont)
windowsFonts()
windowsFonts(malgun = '맑은 고딕')
theme_update(text = element_text(family='malgun'))


txt <- readLines('data/jeju.txt')
place <- sapply(txt, extractNoun, USE.NAMES = F)
place
head(unlist(place), 30)
cdata <- unlist(place)
place <- str_replace_all(cdata,'[^[:alpha:]]','')
place <- gsub(' ','', place)
txt <- readLines('data/제주도여행코스gsub.txt')
txt

cnt_txt <- length(txt)
cnt_txt
for(i in 1:cnt_txt) {
  place <- gsub((txt[i]),'', place)
}
place

place <- Filter(function(x) {nchar(x) >=2}, place)
write(unlist(place), 'jeju_2.txt')
rev <- read.table('jeju_2.txt')
nrow(rev)
wordcount <- table(rev)
head(sort(wordcount, decreasing = T), 30)

rev
# 가장 추천 수가 많은 10개 골라서 pie형 그래프로 출력
top10 <- head(sort(wordcount, decreasing = T), 10)
pie(top10, main='제주도 추천 여행 코스 TOP10')

# 색상변경해서 출력
palete <- brewer.pal(10,'Set1')
pie(top10, col=palete, radius = 1, main = '제주도 추천 여행 코스 TOP 10')

# 수치값을 함께 출력
pct <- round(top10/sum(top10)*100, 1)
names(top10)
lab <- paste(names(top10),'\n', pct,'%')
lab <- paste(names(top10),'\n', pct,'%', sep='') # 빈칸 없애기
lab
pie(top10, main='제주도 추천 여행 코스 TOP 10', col=rainbow(10), cex=0.8, labels=lab)

# ggplot으로 pie 그래프 그리기
str(top10)
df_top10 <- as.data.frame(top10)
df_top10
ggplot(df_top10, aes(x='', y=Freq, fill=rev)) +
  geom_bar(width=1, stat='identity') +
  coord_polar('y', start =0)

# 라벨 만드는 과정
options(digits = 2) # 소수점 다음 두자리까지 쓸거야 1.22, 3.44
df_top10 <- df_top10 %>%
  mutate(pct=Freq/ sum(Freq)*100) %>%
  mutate(ylabel=paste(sprintf('%4.1f', pct), '%', sep='')) %>%
  arrange(desc(rev)) %>%  # 순서를 뒤집어야 함.
  mutate(ypos = cumsum(pct) - 0.5*pct)
# mutate(ylabel=paste(pct, '%', sep=''))
# mutate(ylabel=paste(sprintf('%4.1f', pct), '%', sep=''))
df_top10

# 라벨을 만들고 그래프 그리기
ggplot(df_top10, aes(x='', y=Freq, fill=rev)) +
  geom_bar(width=1, stat='identity') +
  geom_text(aes(y=ypos, label=ylabel), color='black')

# 바 그래프 만든후에 pie형 그래프로 변환
ggplot(df_top10, aes(x='', y=Freq, fill=rev)) +
  geom_bar(width=1, stat='identity') +
  geom_text(aes(y=ypos, label=ylabel), color='black') +
  coord_polar('y', start =0) +
  ggtitle('제주도 추천 여행 코스 TOP 10') +
  theme(plot.title = element_text(face = 'bold',hjust = 0.5, size = 15, color = 'red'))

# bar 형태의 그래프로표시하기기
bchart <- head(sort(wordcount, decreasing = T), 10)
bchart

bp <- barplot(bchart, main ='제주도 추천 여행 코스 TOP 10', col=rainbow(10),
              cex.names=0.7, las=2, ylim=c(0,25))
pct <- round(bchart/sum(bchart)*100,1)
pct
text(x=bp, y=bchart*1.05, labels=paste('(',pct,'%',')'), col='black', cex=0.7)
text(x=bp, y=bchart*0.95, labels=paste(bchart,'건'), col='black', cex=0.7)

# 옆으로 누운 바 그래프 그리기
barplot(bchart, main ='제주도 추천 여행 코스 TOP 10', col=rainbow(10),
        xlim=c(0,25), cex.names=0.7, las=1, horiz=T)
text(y= bp, x=bchart*0.9, labels = paste(bchart,'건'), col='black', cex=0.7)
text(y= bp, x=bchart*1.15, labels = paste('(',pct,'%',')'), col='black', cex=0.7)

# 3D pie Chart로 그리기
install.packages('plotrix')
library(plotrix)

th_pct <- round(bchart/ sum(bchart)* 100,1)
th_names <- names(bchart)
th_labels <- paste(th_names, '\n','(',th_pct,')')

pie3D(bchart, main='제주도 추천 여행 코스 TOP10', col=rainbow(10),
      cex=0.3, labels= th_labels, explode=0.05)
