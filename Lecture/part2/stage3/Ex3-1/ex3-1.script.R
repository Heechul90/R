# 예제 3-1 : 서울시 주요 구의 의원 현황을 분석하기
# 20190614 수업


setwd('D:/Workspace/R_Data_Analysis/Part2/Stage3_StructuredData/Ex01_SeoulClinic')
library(ggplot2)
library(reshape2)
install.packages('plotly')
library(plotly)
library(extrafont)
windowsFonts()
windowsFonts(malgun = "맑은 고딕")
theme_update(text = element_text(family = "malgun"))

data1 <- read.csv("2013년_서울_주요구별_병원현황.csv")
data1
barplot(as.matrix(data1[1:9,2:11]),
        main=paste("서울시 주요 구별 과목별 병원현황-2013년", "\n",
                   "출처[국민건강보험공단]") , ylab="병원수", beside=T ,
        col=rainbow(8), ylim=c(0,350))
abline(h=seq(0,350,10), lty=3, lwd=0.2)
name <- data1$표시과목
name
legend(75, 350, name, cex=0.8, fill=rainbow(8), bg="white")

clinic <- read.csv("2013년_서울_주요구별_병원현황_Long.csv")
head(clinic, 10)

ggplot(clinic, aes(x=지역명, y=의원수, fill=표시과목)) +
  geom_bar(position = 'dodge', stat = 'identity') +
  geom_hline(yintercept=seq(0,330,10), lty='dashed', size=0.1) +
  ggtitle(paste("서울시 주요 구별 과목별 병원현황-2013년", "\n",
                "출처[국민건강보험공단]")) +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue"))

# Wide format을 Long format으로 변환
df_long <- melt(data1, id=c('표시과목'), 
                variable.name='지역명', value.name='의원수')
head(df_long)
p <- ggplot(df_long, aes(x=지역명, y=의원수, fill=표시과목)) +
  geom_bar(position = 'dodge', stat = 'identity') +
  geom_hline(yintercept=seq(0,330,10), lty='dotted', size=0.1) +
  ggtitle(paste("서울시 주요 구별 과목별 병원현황-2013년", "\n",
                "출처[국민건강보험공단]")) +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue"))

# Interactive Graph
ggplotly(p)