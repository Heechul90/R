setwd('D:/Heechul/R/R_Lecture/part2/stage3/ch3-1')
install.packages('KoNLP')
install.packages('wordcloud')
install.packages('stringr')
install.packages('reshape2')
library(KoNLP)
library(wordcloud)
library(stringr)
library(ggplot2)
library(dplyr)
library(plyr)
library(reshape2)
useSejongDic()

# OPS = 출류율 + 장타율
# OPS/연봉*100

# 연봉대비출루율
count <- read.csv('주요선수별성적-2013년.csv',stringsAsFactor=F)
count
count_1 <- count %>%
  mutate(OPS= 출루율 + 장타율) %>%
  mutate(연봉대비OPS = (OPS/연봉)*100) %>%
  mutate(평균출루율 = sum(출루율)/25) %>%
  arrange(선수명)
count_1 

# 여러개 같이 그래프 그릴때
count_2 <- melt(count_1, id=c('선수명'), variable.name='성적', value.name='결과')
count_2

# 연봉대비출루율
ggplot(count_1, aes(x=선수명, y=연봉대비출루율, fill=선수명)) +
  geom_bar(stat = 'identity',  colour='black') +
  ggtitle(paste('야구 선수별 연봉 대비 출루율 분석','\n','(밥값여부계산 ^^;;)')) +
  theme(plot.title = element_text(family = "serif", 
                                  face = "bold", hjust = 0.5, size = 15, color = "black")) +
  geom_text(aes(y=연봉대비출루율+0.6, label=paste(연봉대비출루율,'%')),
            color='black', cex=2) +
  theme_classic() +
  theme(axis.text.x = element_text(angle=90, hjust = 1, vjust = 1, size=8, color='black')) +
  theme(axis.title.y = element_text(size=8, color='red'))
  



gg + geom_line(y=평균출루율)


# 옆에 이름나오게 하는거 옵션
theme(legend.background = element_rect(fill="grey85", colour="red", size=1))




Basic_Plot + ggtitle("Jitter Plot for Cars93 Dataset") +   # title 명칭을 입력합니다.
  # 글씨체, 글씨 모양, 가운데 정렬, 크기, 색상을 설정합니다.
theme(plot.title = element_text(family = "serif", face = "bold",
                                hjust = 0.5, size = 15, color = "darkblue"))
ggsave("title_edit.jpg", dpi = 300)   # ggplot를 저장합니다.



# OPS
ggplot(count_1, aes(x=선수명, y=OPS, fill=선수명)) +
  geom_bar(stat = 'identity') +
  ggtitle(paste('야구 선수별 OPS 분석','\n','(밥값여부계산 ^^;;)')) +
  theme(axis.text.x = element_text(angle=90, hjust = 1, vjust = 1, size=7)) +
  geom_text(aes(y=연봉대비출루율+0.5, label=연봉대비출루율), color='black', size=3)

# 연봉대비OPS
ggplot(count_1, aes(x=선수명, y=연봉대비OPS, fill=선수명)) +
  geom_bar(stat = 'identity') +
  ggtitle(paste('야구 선수별 연봉 대비 OPS 분석','\n','(밥값여부계산 ^^;;)')) +
  theme(axis.text.x = element_text(angle=90, hjust = 1, vjust = 1, size=7)) +
  geom_text(aes(y=연봉대비출루율+0.5, label=연봉대비출루율), color='black', size=3)
