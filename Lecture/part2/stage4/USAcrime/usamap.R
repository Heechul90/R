## 지도 시각화
# 20190614
setwd('D:/Heechul/R/R_Lecture/part2/stage4/USAcrime')
install.packages('ggiraphExtra')
install.packages('maps')
install.packages('mapproj')
library(ggiraphExtra)
library(KoNLP)
library(wordcloud)
library(stringr)
library(ggplot2)
library(dplyr)
library(tibble) # rows에 변수를만들고 이름을 만들어 줄 때 사용함
library(mapproj)
windowsFonts(malgun = '맑은 고딕')
theme_update(text=element_text(family = 'malgun'))

str(USArrests)
head(USArrests)
tail(USArrests)
summary(USArrests)

crime <- rownames_to_column(USArrests, var ='state')
head(crime)
crime$state <- tolower(crime$state)     # 지도 데이터와 동일하게 맞춰주기 위해 첫글자를 대문자로
crime

states_map <- map_data('state')
str(states_map)

# Murder
m <- ggChoropleth(data = crime,     # 지도에 표현할 데이터
             aes(fill=Murder,     # 색깔로 표현할 변수
                 map_id=state),     # 지역 기준 변수
             map=states_map) +     # 지도 데이터
  ggtitle('Muder') +
  xlab('경도') +
  ylab('위도') +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue"))

# Rape
r <- ggChoropleth(data = crime,     # 지도에 표현할 데이터
             aes(fill=Rape,     # 색깔로 표현할 변수
                 map_id=state),     # 지역 기준 변수
             map=states_map)  +    # 지도 데이터
  ggtitle('Rape') +
  xlab('경도') +
  ylab('위도') +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                size = 15, color = "darkblue"))

# Assault
a <- ggChoropleth(data = crime,     # 지도에 표현할 데이터
             aes(fill=Assault,     # 색깔로 표현할 변수
                 map_id=state),     # 지역 기준 변수
             map=states_map)  +    # 지도 데이터
  ggtitle('Assault') +
  xlab('경도') +
  ylab('위도') +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue"))

# UrbanPop
u <- ggChoropleth(data = crime,     # 지도에 표현할 데이터
             aes(fill=UrbanPop,     # 색깔로 표현할 변수
                 map_id=state),     # 지역 기준 변수
             map=states_map)  +    # 지도 데이터
  ggtitle('UrbanPop') +
  xlab('경도') +
  ylab('위도') +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue"))


windows()
grid.arrange(m,r,a,u, ucol=2,
             top = '미쿡쿡쿡')


ggtitle('지도야지도')
xlab('경도잖')
ylab('위도잖아')
theme(plot.title=element_text())