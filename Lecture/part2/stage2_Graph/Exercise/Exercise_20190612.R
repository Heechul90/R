# 연습문제 5_20190612

setwd('D:/Heechul/R/R_Lecture/part2/stage2/Exercise')
install.packages('KoNLP')
install.packages('wordcloud')
install.packages('RColorBrewer')
library(KoNLP)
library(wordcloud)
useSejongDic()
library(RColorBrewer)
library(stringr)
library(dplyr)
library(ggplot2)
getwd()


txt <- readLines('hiphop.txt')
txt
hiphop <- sapply(txt, extractNoun, USE.NAMES = F)
hiphop
cdata <- unlist(hiphop)
hiphop <- str_replace_all(cdata, '[^[:alpha:]]','')
hiphop
hiphop <- gsub(' ','', hiphop)

hiphop <- Filter(function(x) {nchar(x) >=2}, hiphop)
hiphop

txt <- readLines('hiphopgsub.txt')
txt
cnt_txt <- length(txt)
cnt_txt
i <- 1
for(i in 1:cnt_txt) {
  hiphop <- gsub((txt[i]), '', hiphop)
}
hiphop


write(unlist(hiphop),'hiphop_2.txt')
rev <- read.table('hiphop_2.txt')
nrow(rev)
wordcount <- table(rev)
wordcount
head(sort(wordcount, decreasing = T), 100)

# wordcloud
palete <- brewer.pal(9,'Dark2')
wordcloud(names(wordcount), freq = wordcount, scale = c(3,0.2), rot.per = 0.25, min.freq = 2,
          random.order = F, random.color = T, colors = palete)
legend(0.3, 0.9, 'Hiphop Words', cex=0.6, fill=NA, border=NA, bg='white',
       text.col='red', text.font=4, box.col='red', box.lty = 5)


# 2. ggplot으로 pie 그래프 그리기
top10 <- head(sort(wordcount, decreasing = T), 10)
top10
df_top10 <- as.data.frame(top10)
df_top10
ggplot(df_top10, aes(x='', y=Freq, fill=rev)) +
  geom_bar(width=1, stat='identity') +
  coord_polar('y', start =0)

# 2. 라벨 만드는 과정
options(digits = 2) # 소수점 다음 두자리까지 쓸거야 1.22, 3.44
df_top10 <- df_top10 %>%
  mutate(pct=Freq/ sum(Freq)*100) %>%
  mutate(ylabel=paste(sprintf('%4.1f', pct), '%', sep='')) %>%
  arrange(desc(rev)) %>%  # 순서를 뒤집어야 함.
  mutate(ypos = cumsum(pct) - 0.5*pct)
# 2. mutate(ylabel=paste(pct, '%', sep=''))
# 2. mutate(ylabel=paste(sprintf('%4.1f', pct), '%', sep=''))
df_top10

# 2. 라벨을 만들고 그래프 그리기
ggplot(df_top10, aes(x='', y=pct, fill=rev)) +
  geom_bar(width=1, stat='identity') +
  geom_text(aes(y=ypos, label=ylabel), color='black')

# 2. 바 그래프 만든후에 pie형 그래프로 변환
ggplot(df_top10, aes(x='', y=pct, fill=rev)) +
  geom_bar(width=1, stat='identity') +
  geom_text(aes(y=ypos, label=ylabel), color='black', size=4) +
  coord_polar('y', start =0) +
  ggtitle('Hiphop Words TOP 10') +
  theme(plot.title = element_text(face = 'bold',hjust = 0.5, size = 15, color = 'red'))

# 3. bar 그래프 만들기
gg <- ggplot(df_top10, aes(x=rev, y=Freq, fill=rev)) +
  geom_bar(stat = 'identity', fill='green', colour='red') +
  geom_text(aes(y=Freq, label=ylabel), color='black') +
  ggtitle('Hiphop Words TOP 10') +
  theme(plot.title = element_text(face = 'bold',hjust = 0.5, size = 15, color = 'red'))
gg 
gg + theme(axis.text.x = element_text(angle=30, hjust = 1, vjust = 1, color= 'blue', size=8))








