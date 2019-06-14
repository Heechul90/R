install.packages('stringi')
install.packages('devtools')
devtools::install_github('cardiomoon/kormaps2014')
library(kormaps2014)
library(dplyr)
library(ggiraphExtra)
library(KoNLP)
library(wordcloud)
library(stringr)
library(ggplot2)
library(dplyr)
library(tibble) # rows에 변수를만들고 이름을 만들어 줄 때 사용함
library(mapproj)


str(changeCode(korpop1))

korpop1 <- rename(korpop1,
                  pop= 총인구_명,
                  name= 행정구역별_읍면동)
korpop1

str(changeCode(korpop1))
head(changeCode(korpop1))


# 단계 구분도 만들기
ggChoropleth(data = korpop1,                 # 지도에 표현할 데이터
                  aes(fill=pop,         # 색깔로 표현할 변수
                      map_id=code,       # 지역 기준 변수
             tooltrip=name),
                  map=kormap1,        # 지도 데이터
             interactive = T)


  ggtitle('Pop') +
  xlab('경도') +
  ylab('위도') +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue"))
