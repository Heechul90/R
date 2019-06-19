# reshape2, 왜 이렇게 사용하는지는 다음에 다시 배우자.
install.packages('reshape2')
library('reshape2')
fruits <- read.csv('fruits_10.csv', header = T)
fruits
melt(fruits, id='year')
melt(fruits, id='qty')
melt(fruits, id='name')
melt(fruits, id=c('year', 'name'))
melt(fruits, id=c('year', 'name'), variable.name = 'var_name', value.name = 'val_name')
mtest <- melt(fruits, id=c('year','name'), variable.name = 'var_name', value.name = 'val_name')
dcast(mtest, year+name~var_name)
dcast(mtest, year~var_name)
dcast(mtest,name~var_name,sum)

# stringr , 중요하다. 이것이 내가 할일이다. 10년뒤엔 안해도 된다. 시기면 된다.
install.packages('stringr')
library(stringr)
fruits <- c('apple', 'Apple', 'banana', 'pineapple')
# str_detect
str_detect(fruits, 'A')      # 대문자 'A' 찾기 두번째가 T.
str_detect(fruits, '^a')      # 첫글자가 a로 시작하는 단어 찾기. # ^ = 단어의 처음, $ = 단어의 끝끝
str_detect(fruits, 'e$')      # 끝글자가 'e' 끝나는 단어 찾기
str_detect(fruits, '^[aA]')      # 시작하는 글자가 'a' 또는 'A'로 시작하는 단어
str_detect(fruits, '[aA]')      # 'a','A' 가 포함되는 단어 다 찾기

# ignore.case
str_detect(fruits, regex('a', ignore_case=T))

# str_count
fruits
str_count(fruits,'a')     # 각 단어에 'a'가 들어간 개수

# str_c
str_c('apple', 'banana')     # 두 단어를 합쳐서 출력
str_c('Fruits:', fruits)     
str_c(fruits, 'name is', fruits)
str_c(fruits, collapse=',')
str_c(fruits, collapse="_")          

# str_dup
str_dup(fruits,3)     # 주어진 단어를 주어진 횟수만큼 반복해서 출력

# str_length
str_length('apple')     # 문자열의 길이를 출력
str_length(fruits)

# str_locate
str_locate('apple','a')     # 특정 문자가 처음 나오느누이치와 마지막 위치를 출력
str_locate(fruits, 'a')

# str_replace
str_replace('apple','p','*')     # 문자열에서 변경전 문자를 변경 후 문자로 바꿔서 출력
str_replace('apple','p','**')
str_replace_all('apple','p','*')     # all을 추가하면 p를 다 * 바꿔서 출력

# str_split
fruits <- str_c('apple', '/', 'orange', '/', 'banana')
fruits
str_split(fruits,'/')     # / 기준으로 단어를 분리 시켜 출력

# str_sub
fruits
str_sub(fruits, start=1, end=3)     # 지정된 길이 만큼 문자를 잘라내서 출력
str_sub(fruits, start=6 ,end=9)
str_sub(fruits, start=7)      # 7에서 시작해서 끝까지 출력
str_sub(fruits, start=-5)      # 뒤에서 5번째부터서 시작해서 끝까지 출력

# str_trim
str_trim(' apple banana berry ')     # 문자열의 가장 앞과 가장 뒤에 공백이 있을 경우 제거해서 출력
str_trim('\t apple banana berry ')
str_trim(' apple banana berry \n')

.libpaths()
