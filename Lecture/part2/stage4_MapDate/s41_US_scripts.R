# 지도 시각화

install.packages("ggiraphExtra")
install.packages('maps')
install.packages('mapproj')
library(mapproj)
library(ggiraphExtra)
library(tibble)
library(ggplot2)
library(dplyr)
library(reshape2)
library(gridExtra)
library(extrafont)
windowsFonts(malgun = "맑은 고딕")
theme_update(text = element_text(family = "malgun"))

str(USArrests)
head(USArrests)
tail(USArrests)
summary(USArrests)

crime <- rownames_to_column(USArrests, var = "state")
head(crime)
crime$state <- tolower(crime$state)

# 미국 주 지도 데이터 준비하기
states_map <- map_data("state")
str(states_map)

# 단계 구분도 만들기
ggChoropleth(data = crime,         # 지도에 표현할 데이터
             aes(fill = Murder,    # 색깔로 표현할 변수
                 map_id = state),  # 지역 기준 변수
             map = states_map)     # 지도 데이터

# 인터랙티브 단계 구분도 만들기
ggChoropleth(data = crime,         # 지도에 표현할 데이터
             aes(fill = Rape,      # 색깔로 표현할 변수
                 map_id = state),  # 지역 기준 변수
             map = states_map,     # 지도 데이터
             interactive = T)      # 인터랙티브

# 4개의 그래프를 한 화면에 보여주기
m <-ggChoropleth(data = crime,
                 aes(fill = Murder, map_id = state),
                 map = states_map) +
  ggtitle("미국 주별 살인범죄 분포","(단위: 인구 10만명당 건수)") +
  xlab("경도") +
  ylab("위도") +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue"),
        plot.subtitle = element_text(hjust = 1.0))
r <- ggChoropleth(data = crime,
                  aes(fill = Rape, map_id = state),
                  map = states_map) +
  ggtitle("미국 주별 강간범죄 분포","(단위: 인구 10만명당 건수)") +
  xlab("경도") +
  ylab("위도") +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue"),
        plot.subtitle = element_text(hjust = 1.0))
a <- ggChoropleth(data = crime,
                  aes(fill = Assault, map_id = state),
                  map = states_map) +
  ggtitle("미국 주별 강도범죄 분포","(단위: 인구 10만명당 건수)") +
  xlab("경도") +
  ylab("위도") +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue"),
        plot.subtitle = element_text(hjust = 1.0))

u <- ggChoropleth(data = crime,
                  aes(fill = UrbanPop, map_id = state),
                  map = states_map) +
  ggtitle("미국 주별 도시비율 분포") +
  xlab("경도") +
  ylab("위도") +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue"))
windows()
grid.arrange(m, r, a, u, ncol=2,
             top = '미국 주별 강력범죄 분포')