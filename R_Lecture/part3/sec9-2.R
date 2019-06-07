# 반복문
# while 보통 사용함 제한적이지 않음
# for 횟수를 정해놓고 사용(제한적)

# while, 조건식에 영향이 가는 놈을 꼭 써줘라, 그래야 무한 반복 안한다.
no <- 0     # 여기까지 실해하면 n == 0
while (no < 10) {
  print(no)
  no <- no+1;
}     # 여기실행을 하면 n==10 이 된다.

no <- 0     # 여기까지 실해하면 n == 0
while (no < 10) {
  print(no)
  if(no==4) {
    break
  }
  no <- no+1;
}     # break가 걸려서 no == 4 이다.

no <- -1
while (no <=10) {
  no <- no + 1
  if(no %% 2 == 1)
    next
  print(no)
}

number <- 0


