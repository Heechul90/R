# 관계도
install.packages('igraph')
library(igraph)

# 관계도 그리기 igraph()
g1 <- graph(c(1,2 ,2,3 ,2,4 ,1,4 ,5,5 ,3,6))
plot(g1)     # 그래프의 그림은 그때마다 다르게 나온다.
str(g1)

name <- c('서진수 대표이사', '일지매 부장', '김유신 과장',
          '손흥민 대리' ,'노정호 대리', '이순신 부장', '유관순 과장',
          '신사임당 대리', '강감찬 부장', '광개토 과장', '정몽주 대리')
pemp <- c('서진수 대표이사', '서진수 대표이사', '일지매 부장',
          '김유신 과장', '김유신 과장', '서진수 대표이사', '이순신 부장',
          '유관순 과장', '서진수 대표이사', '강감찬 부장', '광개토 과장')
emp <- data.frame(이름=name, 상사이름=pemp)
emp

g <- graph.data.frame(emp,directed=T)
plot(g, layout=layout.fruchterman.reingold, vertex.size=8, edge.arrow.size=0.5)

str(g)
png('graph/network_2.png', width=600, height=600)
dev.off()

g3 <- graph.data.frame(emp,directed=F)
plot(g3, layout=layout.fruchterman.reingold, vertex.size=8, edge.arrow.size=0.5, vertex.label=NA)
png('graph/network_3.png', width=600, height=600)
dev.off()



install.packages('devtools')
install.packages('d3Network')
library(d3Network)

name <- c('Angela Bassett', 'Jessica Lamge', 'Winona Ryder', 'Michelle Pfeiffer',
          'Whoopi Goldberg', 'Emma Thompson', 'Julia Roberts', 'Sharon Stone', 
          'Meryl Streep', 'Susan Sarandon', 'Nicole Kidman')
pemp <- c('Angela bassett', 'Angela Bassett', 'Jessica Lange', 'Wionoa Ryder',
          'Winona Ryader', 'Angela Bassett', 'Emma Thompson', 'Julia Roberts',
          'Angela Bassett', 'Meryl Streep', 'Susan Sarandon')
emp <- data.frame(이름=name, 상사이름=pemp)
emp
d3SimpleNetwork(emp,width=600, height=600, file='graph/d3.html')

getwd()
g <- read.csv('data/군집분석.csv', head=T)
graph <- data.frame(학생=g$학생, 교수=g$교수)
graph
g <- graph.data.frame(graph, directed = T)
g
plot(g, layout=layout.fruchterman.reingold, vertex.size=2, edge.arrow.size=0.5, vertex.color='green', vertex.label=NA)

# 모양 바꾸어서 출력
plot(g, layout=layout.kamada.kawai, vertex.size=2, edge.arrow.size=0.5, vertex.label=NA)

# 학생과 교수의 색상과 크기를 구분해서 출력력
library(stringr)
V(g)$name
gubun1 <- V(g)$name
gubun1
gubun <- str_sub(gubun1, start=1, end=1)
gubun

# 학생일 경우 컬러를 red, 교수님일 경우 컬러를 green
colors <- c()
for(i in 1:length(gubun)) {
  if(gubun[i] =='S') {
    colors <- c(colors, 'red')
  } else {
    colors <- c(colors, 'green')
  }
}

# 학생일 경우 점의 크기를 2, 교수님일 경우 점의 크기를 6
sizes <- c()
for(i in 1:length(gubun)) {
  if(gubun[i] =='S') {
    sizes <- c(sizes, 2)
  } else {
    sizes <- c(sizes, 6)
  }
}

plot(g, layout=layout.fruchterman.reingold, vertex.size=sizes, edge.arrow.size=0.5, vertex.color=colors)

# 위 그래프에서 이름 없애기
plot(g, layout=layout.fruchterman.reingold, vertex.size=sizes, edge.arrow.size=0.5, vertex.color=colors, vertex.label=NA)

# 화살표 표시 없애기
plot(g, layout=layout.fruchterman.reingold, vertex.size=sizes, edge.arrow.size=0, vertex.color=colors, vertex.label=NA)

# 학생과 교수의 도형 모양 다르게 하고 화살표 없애고, 색도 다르게 하기
plot(g, layout=layout.kamada.kawai, vertex.size=sizes, edge.arrow.size=0, vertex.color=colors, vertex.label=NA)

# 교수님일 경우 모양을 square로 하고 교수님일 경우 점의 모양을 circle 로하는 코드
shapes <- c()
for(i in 1:length(gubun)) {
  if(gubun[i] =='S') {
    shapes <- c(shapes, 'circle')
  } else {
    shapes <- c(shapes, 'square')
  }
}

plot(g, layout=layout.kamada.kawai, vertex.size=sizes, edge.arrow.size=0, vertex.color=colors, vertex.label=NA, vertex.shape=shapes)

# 저 수준 작도 함수 그리기
plot(1:15)
abline(h=8)
rect(1,6,3,8)
arrows(1,1,5,5)
text(8,9,'TEXT')
title('THIS IS TEST', 'SUB')
