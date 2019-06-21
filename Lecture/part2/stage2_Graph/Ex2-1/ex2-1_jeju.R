setwd('D:/Heechul/R/R_Lecture/part2/stage2/Ex2-1')
library(KoNLP)  # 필수 패키지 로딩
library(wordcloud) # 필수 패키지 로딩
useSejongDic( ) 
library(stringr)
library(ggplot2)
library(dplyr)
library(plotrix)
install.packages('extrafont')
library(extrafont)
windowsFonts()
windowsFonts(malgun = "맑은 고딕")
theme_update(text = element_text(family = "malgun"))

mergeUserDic(data.frame(readLines("제주도여행지.txt"), "ncn"))

txt <- readLines("data/jeju.txt") 
txt
place <- sapply(txt, extractNoun, USE.NAMES=F)
place
head(unlist(place), 30)
cdata <- unlist(place) 
place <- str_replace_all(cdata, "[^[:alpha:]]", "")  # 한글, 영어외는 삭제

place

place <- gsub(" ", "", place)
txt <- readLines("data/제주도여행코스gsub.txt")   # 삭제할 데이터
txt
i <-1
for(i in 1:length(txt)) {
  place <-gsub((txt[i]), "", place)     
}
place <- Filter(function(x) {nchar(x) >= 2}, place)   # 2글자 이상

write(unlist(place),"jeju_2.txt") 
rev <- read.table("jeju_2.txt")
nrow(rev)   
wordcount <- table(rev) 
head(sort(wordcount, decreasing=T),30)

# 추천 후보지 10개 그래프 그리기
top10 <- head(sort(wordcount, decreasing=T), 10)
top10
pie(top10, main="제주도 추천 여행 코스 TOP 10")
pie(top10, col=rainbow(10), radius=1,
    main="제주도 추천 여행 코스 TOP 10")
palete <- brewer.pal(10, "RdGy")
pie(top10, col=palete, radius=1,
    main="제주도 추천 여행 코스 TOP 10")

pct <- round(top10/sum(top10) * 100, 1)
pct
names(top10)
lab <- paste(names(top10), "\n", pct, "%")
lab <- paste(names(top10), "\n", pct, "%", sep='')
lab
pie(top10, main="제주도 추천 여행 코스 TOP 10",
    col=palete, cex=0.8, labels = lab)

# ggplot pie chart 그리기
str(top10)
df_top10 <- as.data.frame(top10)
df_top10
ggplot(df_top10, aes(x='', y=Freq, fill=rev)) +
  geom_bar(width=1, stat='identity')

ggplot(df_top10, aes(x='', y=Freq, fill=rev)) +
  geom_bar(width=1, stat='identity') +
  coord_polar("y", start = 0)

options(digits = 2)
df_top10 <- df_top10 %>%
  mutate(pct = Freq / sum(Freq) * 100) %>%
  #mutate(ylabel = paste(pct, '%', sep=''))
  #mutate(ylabel = paste(sprintf("%4.1f", pct), '%', sep='')) %>%
  mutate(ylabel = paste(sprintf("%s\n%4.1f", rev, pct), '%', sep='')) %>%
  arrange(desc(rev)) %>%
  mutate(ypos = cumsum(pct) - 0.5*pct)
df_top10

ggplot(df_top10, aes(x='', y=Freq, fill=rev)) +
  geom_bar(width=1, stat='identity') +
  geom_text(aes(y=ypos, label=ylabel), color='black')

ggplot(df_top10, aes(x='', y=Freq, fill=rev)) +
  geom_bar(width=1, stat='identity') +
  coord_polar("y", start = 0) +
  ggtitle("제주도 추천 여행 코스 TOP 10") +
  geom_text(aes(y=ypos, label=ylabel), color='black')

# 제목 장식하기
ggplot(df_top10, aes(x='', y=Freq, fill=rev)) +
  geom_bar(width=1, stat='identity') +
  coord_polar("y", start = 0) +
  ggtitle("제주도 추천 여행 코스 TOP 10") +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue")) +
  geom_text(aes(y=ypos, label=ylabel), color='black')

# bar 형태의 그래프로 표시하기
bchart <- head(sort(wordcount, decreasing=T),10)
bchart
bp <- barplot(bchart,  main = "제주도 추천 여행 코스 TOP 10", col = rainbow(10), 
              cex.names=0.7, las = 2, ylim=c(0,25))
pct <- round(bchart/sum(bchart) * 100, 1)
pct
text(x = bp, y = bchart*1.05, labels = paste("(",pct,"%",")"), col = "black", cex = 0.7)
text(x = bp, y = bchart*0.95, labels = paste(bchart,"건"), col = "black", cex = 0.7)

# 옆으로 누운 바 그래프 그리기
barplot(bchart, main="제주도 추천 여행 코스 Top 10", col=rainbow(10),
        xlim=c(0,25), cex.name=0.7, las=1, horiz=T)
text(y = bp, x = bchart*0.9, labels = paste(bchart,"건"), col = "black", cex = 0.7)
text(y = bp, x = bchart*1.15, labels = paste("(",pct,"%",")"), col = "black", cex = 0.7)

# 3D Pie Chart 그래프 그리기
th_pct <- round(bchart/sum(bchart) * 100, 1)
th_names <- names(bchart)
th_labels <- paste(th_names,"\n","(",th_pct,")")
pie3D(bchart,main="제주도 추천 여행 코스 Top 10",col=rainbow(10),
      cex=0.3, labels=th_labels, explode=0.05)
