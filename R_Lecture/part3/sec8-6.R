# sqldf() 패키지 활용
install.packages('sqldf')
library('sqldf')
library('googleVis')
Fruits
sqldf('SELECT * FROM Fruits')
sqldf("select * from Fruits where fruit='Apples'")
sqldf('select * from Fruits where fruit=\'Apples\'')     # 싱글다운표로 표시하면 인식이 제대로 안되기 때문에 백슬래시를 꼭 붙여준다.
sqldf('select * from Fruits limit 3')    # 테이블명이아 컬럼명은 대소문자 구별하니 정확히 입력할것. limit0, 3 이랑 같음.
sqldf('select * from Fruits limit 3, 5')     # 3번째 다음부터 보여줘. 4번부터 5개.
sqldf('select * from Fruits order by Year')
sqldf('select * from Fruits order by Year desc')
sqldf('select Fruit, sum(Sales) from Fruits group by Fruit')
sqldf('select Fruit, sum(Sales), sum(Expenses), sum(Profit)
      from Fruits group by Fruit')     # 과일별 합계
sqldf('select Year, avg(Sales), avg(Expenses), avg(Profit)
      from Fruits group by Year')     # 연도별 평균
sqldf('select Year, avg(Sales), avg(Expenses), avg(Profit)
      from Fruits group by Year order by avg(Profit) desc')     # 연도별 평균과 Profit의 내림차순

sqldf('select min(Sales), max(Sales) from Fruits')     # Sales 최소값, 최대값
sqldf('select * from Fruits where Sales=
      (select min(Sales) from Fruits)')     # 
sqldf ('select * from Fruits where Expenses=
       (select max(Expenses) from Fruits)')
sqldf('select * from Fruits where Sales in
      (select min(Sales) max(Sales) from Fruits)')     #  안되네 나중에 확인허자잉

setwd('D:/Heechul/R/R_Lecture/data')
song <- read.csv('song.csv', header = F, fileEncoding = 'utf8')
names(song) <- c('_id', 'title', 'lyricd', 'girl_group_id')
song
girl_group <- read.csv('girl_group.csv', header = F, fileEncoding = 'utf8')
girl_group
names(girl_group) <- c('_id', 'name', 'debut')
girl_group

sqldf('select gg._id, gg.name as \'걸그룹이름\', s.titles as \'제목\'' )
sqldf("select gg._id, gg.name as '걸그룹이름', gg. debut as '데뷰' s.titles as '제목'
      from girl_group as gg
      inner join song as s
      on gg._id = s.girl_group_id")   # 해결못했다 해결해라.

sqldf(c("update Fruits set Profit=50 where Fruit='Apple' and Year=2008",
        "select * from Fruits")    # 화면에 보이는 것만 업데이트 된다. 실제 데이터는 변경이 되지 않는다.
Fruits
      
