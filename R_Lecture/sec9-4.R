# 정규식 
# 구글링 정규표현식 사이트 -> 모음 사이트 -> 1
# regular expression

# 특정한 패턴 골라내기
char <-c('apple', 'Apple', 'APPLE', 'banana', 'grape')
grep('apple', char)

char2 <-  c('apple', 'banana')
grep(char2, char)

grep(paste(char2, collapse = '|'), char, value = T)

grep('pp', char)
grep('pp', char, value = T)     # 찾고자 하는데이터 이름이 나온다.
grep('^A', char, value = T)     # 대문자 A로 시작하는 단어 찾기
grep('e$', char, value = T)     # 소문자 e로 끝나는 단어 찾기

char2 <- c('grape1', 'apple1', 'apple', 'orange', 'Apple')
grep('ap', char2, value = T)     # ap가 포함된 단어 찾기
grep('[1-9]', char2, value = T)     # 숫자가 포함된 단어 찾기
grep('[A-Z]', char2, value = T)     # 대문자가 포함된 단어 찾기

# nchar 입력된 배열이나 문자열의 길이를 알려줌줌
char
nchar(char)     # 단어들의 길이를 알려줌
nchar('James Seo')     # 스페이스바까지 포함 9
nchar('서진수')

# paste  paste('a', 'b', 'c') a,b,c 를 합쳐서 하나의 문자열처럼 출력
paste('Seo', 'Jin', 'Su')
paste('Seo', 'Jin', 'Su', sep='')     # 띄어쓰기 없이 출력함
paste('Seo', 'Jin', 'Su', sep='/')     # 슬래시 넣어서 출력
paste('I', '\'m', 'Hungry')     # 특수문자 넣을때에는 백슬러시를 같이 입력해야함

# substr 특정 부분만 골라내 줘잉잉
substr('abc123',3,3)
substr('abc123',3,4)

# 특정 글자를 기준으로 분리해라잉잉
strsplit('2014/11/22', split='/')

# 특정 패턴들을 쉽게 찾아 줘잉잉
grep('-', '010-8706-4712')     # -grep으로는 위치를 찾을수 없다.
regexpr('-', '010-8706-4712')     # -처음 나오는 '-' 문자위치 찾기
attr(,'match.length')
attr(,'useBytes')
