# 데이터 프레임(중요중요중요중요중요중요중요중요중요중요중요중요)

No <- c(1,2,3,4)
Name <- c('Apple', 'Peach', 'Banana', 'Grape')
Price <- c('500', '200', '100', '50')
Qty <- c(5,2,,4,7)

rm(name)
rm(no, price)

Qty <- c(5,2,4,7)
sales <- data.frame(NO=No, NAME=Name, PRICE=Price, QTY=Qty); sales

sales

sales2 <- matrix(c(1, 'Apple',  500, 5,
                   2, 'Peach',  200, 2,
                   3, 'Banana', 100, 4,
                   4, 'Grape',  50, 7), nrow=4, byrow=T)
sales2
df1 <- data.frame(sales2)
df1
names(df1) <- c('NO', 'NAME', 'PRICE', 'QTY')
df1
sales
sales$NAME    # 문자로 읽지않고 팩터로 읽는다.
sales[1,3]
sales[,3]
sales$PRICE
sales[c(1,2),]
sales[,c(1,2)]
sales[,c(1:3)]

subset(sales , QTY<5)
subset(sales, PRICE==500)     # 값을 비교할때 = 을 두개 쓴다. ex)1==1
subset(sales, PRICE!=500)     # != 은 ! = 같이 입력하면 됨.

subset(sales, NAME=='Grape')

no <- c(1,2,3)
name <- c('apple', 'banana', 'peach')
price <- c(100,200,300)
df1 <- data.frame(NO=no, NAME=name, PRICE=price)
df1

no <- c(10,20,30)
name <- c('train', 'car', 'airplane')
price <- c(1000,2000,3000)
df2 <- data.frame(NO=no, NAME=name, PRICE=price)
df2

df3 <- cbind(df1, df2)
df3
df3$NAME
df3[,5]

df5<- rbind(df1, df2)
df5

df5 <- data.frame(name=c('apple', 'banana', 'cherry'), price=c(300,200,100))
df5
df6 <- data.frame(name=c('apple', 'cherry', 'berry'), qty=c(10,20,30))
df6

merge(df5,df6)     # SQL, Inner Join 같은 목록이 있는것만 merge 하는것
merge(df5,df6, all=T)      # 데이더가 없는 것도 모두 나오게 all=T옵션 지정함.

cbind(df5,df6)     # 
rbind(df5,df6)     # 네임이 맞지 않아서 합칠수가 없다. 그래서 cbind만 된다.
cbind(df6,df5)

df1
new <- data.frame(name= 'mango', price=400)     # 추가할 내용을 네임에 맞춰서 생성
df1<- rbind(df1,new)
df1
df1 <- rbind(df1, data.frame(name= 'berry', price= 500))
df1
df1 <- cbind(df1, data.frame(qty=c(10,20,30,40,50)))
df1

no <- c(1,2,3,4,5)
name <- c('서진수', '주시현', '최경우', '이동근', '윤정웅')
address <- c('서울', '대전', '포항', '경주', '경기')
tel <- c(1111, 2222, 3333, 4444, 5555)
hoby <- c('독서', '미술', '놀고먹기', '먹고놀기', '노는애감시하기')
member <- data.frame(NO=no, NAME=name, ADDRESS=address, TEL=tel, HOBY= hoby)
member
member2 <- subset(member, select = c(NO, NAME, TEL))      # 필요한것만 불러냄
member2
member3 <- subset(member, select = -TEL)      # 필요없는거 빼고 나머지 불러냄
member3
colnames(member3) <- c('번호', '이름', '주소', '취미')      # 이름은 바꾼다.
member3

sales
ncol(sales)      # sales의 행의 갯수
nrow(sales)      # sales의 열의 갯수
names(sales)      # sales의 열의 이름을 출력
rownames(sales)      # sales의 행의 이름을 출력
sales[c(2,3,1,4), ]
