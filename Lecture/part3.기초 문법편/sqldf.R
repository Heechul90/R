install.packages("sqldf")
library(sqldf)
library(googleVis)
Fruits
sqldf('SELECT * FROM Fruits')
sqldf("SELECT * FROM Fruits WHERE Fruit='Apples'")
sqldf('SELECT * FROM Fruits limit 3')
sqldf('SELECT * FROM Fruits ORDER BY Year')
sqldf('SELECT * FROM Fruits ORDER BY Year Desc')  
sqldf('SELECT SUM(Sales) FROM Fruits')
sqldf('SELECT max(Sales) FROM Fruits')
sqldf('SELECT Fruit, SUM(Sales) FROM Fruits GROUP BY Fruit')
sqldf('SELECT Fruit , AVG(Sales) FROM Fruits GROUP BY Fruit')
sqldf('SELECT * FROM Fruits WHERE Sales > (SELECT Sales FROM Fruits WHERE expenses=78)')
sqldf('SELECT * FROM Fruits WHERE Sales IN (SELECT Sales FROM Fruits WHERE Sales > 95)')
var1 <- matrix(c("가","라","사"))
ca <- c("가","나","다","라","마","바","사")
lv <- c(3,7,11,31,49,78,43)
id <- c(3233,3789,4939,2336,4555,7888,9999)
data <- data.frame(CA=ca,LV=lv,ID=id)
data
var2 <- as.data.frame(var1)
sqldf('SELECT * FROM var2')
sqldf('SELECT ID FROM data WHERE CA IN (SELECT  * FROM var2)')
name <- c('Sandra Bullock','Jodie Foster','Meg Ryan','Demi Moore')
studno <- c(100,200,300,400)
profno <- c(1000,2000,3000,5000)
student <- data.frame(STUDNO=studno,NAME=name,PROFNO=profno)
student
name <- c('Winona Ryder','Michelle Pfeiffer','Julia Roberts','James Seo')
profno <- c(1000,2000,3000,4000)
professor <- data.frame(PROFNO=profno,NAME=name)
professor
sqldf('SELECT s.name Student_Name, p.name Prof_Name FROM student s , professor p
      WHERE s.profno=p.profno')
sqldf('SELECT s.name Student_Name, p.name Prof_Name FROM student s JOIN professor p
      ON s.profno=p.profno')
sqldf('SELECT s.name Student_Name, p.name Prof_Name
      FROM student s LEFT JOIN professor p USING (profno)')
sqldf('SELECT s.name Student_Name, p.name Prof_Name
      FROM student s RIGHT JOIN professor p USING (profno)')
empno <- c(10,20,30,40,50)
ename <- c("JAMES","MILLER","FORD","STEVE","ALLEN")
pempno <- c(NA,10,20,20,30)
emp <- data.frame(empno=empno , ename=ename , pempno=pempno)
emp
sqldf("SELECT a.ename as '사원이름', b.ename as '상사이름'
      FROM emp a JOIN emp b ON a.pempno = b.empno")

song <- read.csv("d:/workspace/r_data_analysis/part3/data/song.csv", 
                 header = F, fileEncoding = 'utf-8')
names(song) <- c('_id', 'title', 'lyrics', 'girl_group_id')
song
girl <- read.csv("d:/workspace/r_data_analysis/part3/data/girl_group.csv", 
                 header = F, fileEncoding = 'utf-8')
names(girl) <- c('_id', 'name', 'debut')
girl
sqldf('SELECT gg._id, gg.name, s.title FROM girl AS gg INNER JOIN song AS s 
      ON s.girl_group_id = gg._id')
sqldf('SELECT gg._id, gg.name, s.title FROM girl gg RIGHT JOIN song s 
      ON s.girl_group_id = gg._id')

sqldf(c('UPDATE Fruits SET Profit=50 WHERE Fruit=\'Apples\' AND Year=2008',
        'SELECT * FROM Fruits'))
sqldf(c('DELETE FROM Fruits WHERE Fruit="Apples" AND Year=2008',
        'SELECT * FROM Fruits'))
© 2019 GitHub, Inc.