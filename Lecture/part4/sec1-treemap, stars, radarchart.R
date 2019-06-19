# treemap 나무맵 활용하기
install.packages('treemap')
library(treemap)

# treemap
total <- read.csv('data/학생시험결과_전체점수.csv', header=T, sep=',')
total

# 점수를 가진 이름들을 기준으로 treemapd을 출력
treemap(total, vSize = '점수', index=c('점수', '이름'))

# 같은 조끼리 그룹핑해서 이름으로 출력
treemap(total, vSize = '점수', index=c('조', '이름'))

# 점수끼리 모으고 조끼리 모으고 이름으로 출력
treemap(total, vSize = '점수', index=c('점수', '조', '이름'))



# stars() 함수로 비교 분석하기
total <- read.table('data/학생별전체성적_new.txt', header=T, sep=',')
total

# 각 행번호로 되어 있는 것을 이름으로 변경해 주는 역할
# 학생별로 각 과목 성적을 불러올 때 이름이 필요해서 이 작업을 수행
row.names(total) <- total$이름
total

total <- total[,2:7]
total

# 이 차트는 구체적인 지표는 나오지 않지만 전체적인 윤곽이나 흐름을 파악할 때 사용
stars(total, flip.label=F, draw.segment=F, frame.plot=T, main='학생별 과목별 성적분석-STAR Chart')
savePlot('star_1.png', type = 'png')

lab <- names(total)
value <- table(lab)
value

pie(value, labels=lab, radius=0.1, cex=0.6, col=NA)
savePlot('star_2.png', type = 'png')

# 나이팅게일 차트
# 그래프에 색이 입혀서 출력, 하지만 색이 무엇을 의미하는지 몰라서 분석력이 떨어짐.
stars(total, filp.labels=F, draw.segments = T, frame.plot = T, full = T, main= '학생별 과목별 성적분석-나이팅게일 차트')

# pie 그래프를 하나 더 만들어서 위 그래프와 합침
label <- names(total)
value <- table(label)
color <- c('black', 'red', 'green', 'blue', 'cyan', 'violet')
pie(value, labels=label, col=color, radius=0.1, cex=0.6)
savePlot('star_4.png', type = 'png')

stars(total, flip.label=F, draw.segment=T, frame.plot=T, full = F, main='학생별 과목별 분석 다이어그램-반원차트')



# radarchart() 함수로 멋진 레이더차트로 출력하기
install.packages('fmsb')
library(fmsb)

layout <- data.frame(
  분석력=c(5,1),
  창의력=c(15,3),
  판단력=c(3,0),
  리더십=c(5,1),
  사교성=c(5,1)
  )

set.seed(123)
data1<- data.frame(
  분석력=runif(3,5,1),    # runif(3,5,1) 0부터 1사이의 균일 분포)
  창의력=rnorm(3,10,2),     # rnorm 가우시안 죠준 정규 분포     rnorm(10개 꺼내라, 평균, 표준편차)
  판단력=c(0.5,NA,3),
  리더십=runif(3,1,5),
  사교성=c(5,2.5,4)
)

data2 <- rbind(layout, data1)
op <- par(mar=c(1, 0.5, 3, 1), mfrow=c(2,2))
radarchart(data2, axistype=1, seg=5, plty = 1, title='첫번째 타입"')
radarchart(data2, axistype=2, pcol=topo.colors(3), plty = 1, title='두번째 타입"')
radarchart(data2, axistype=3, pty=32, plty = 1, axislabcol = 'grey',
           na.itp = F, title='세번째 타입입"')
radarchart(data2, axistype=0, plwd=1:5, pcol=1,title='네번째 타입"')

savePlot('spider.png', type='png')