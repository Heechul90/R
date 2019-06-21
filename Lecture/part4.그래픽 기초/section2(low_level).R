# 저수준 작도 함수
var1 <- 1:5
plot(var1)
segments(2,2,3,3)
arrows(5,5,4,4)
text(2,4,'labels')
text(3,2,"테스트",srt=45) 

plot(1:15)
abline(h=8)  # 선 긋기
rect(1,6,3,8)  # 사각형 그리기
arrows(1,1,5,5) # 화살표 그리기
text(8,9,"TEXT")  # 글자 쓰기
title("THIS IS TEST","SUB") # 제목 표시하기