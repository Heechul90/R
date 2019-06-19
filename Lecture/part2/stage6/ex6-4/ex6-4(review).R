### 데이터 분석 프로젝트
### 한국인의 삶을 파악하라!
setwd('D:/Heechul/R_Data_Analysis/Lecture/part2/stage6/ex6-4')

### 1. '한국복지패널데이터' 분석 준비하기
## 1)패키지 준비하기
install.packages('foreign')
install.packages('readxl')
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

## 2)데이터 준비하기
# 데이터 불러오기
raw_welfare <- read.spss(file = 'data/Koweps_hpc10_2015_beta1.sav',
                         to.data.frame = T)

# 복사본 만들기
welfare <- raw_welfare

## 3)데이터 검토하기
head(welfare)
tail(welfare)
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)

## 4) 변수명 바꾸기
welfare <- rename(welfare,                      
                  sex = h10_g3,              # 성별
                  birth = h10_g4,            # 태어난 연도
                  marriage = h10_g10,        # 혼인상태
                  religion = h10_g11,        # 종교
                  code_job = h10_eco9,       # 직종
                  income = p1002_8aq1,       # 일한달의 월 평균 임금
                  code_region = h10_reg7)    #7개 권역별 지역구분

## 5) 데이터 분석 절차
# 1 단계. 변수 검토 및 전처리
# 2 단계. 변수 간 관계 분석


### 2. 성별에 따른 월급 차이(성별에 따라 월급이 다를까?)
## 1) 성별 변수 검토 및 전처리
# 변수 검토하기
class(welfare$sex)
table(welfare$sex)     # 최빈값 구할때 같네

# 이상치 확인
table(welfare$sex)

# 이상치 결측 처리 (남자 = 1, 여자 = 2)
welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)

# 결측치 확인하기
table(is.na(welfare$sex))

# 성별 항목에 이름 부여
welfare$sex <- ifelse(welfare$sex == 1, 'male', 'female')
table(welfare$sex)
qplot(welfare$sex)

## 2) 월급 변수 검토 및 전처리
# 변수 검토하기
class(welfare$income)
summary(welfare$income)
qplot(welfare$income)
qplot(welfare$income, xlim= c(0,1000))

# 이상치 확인
summary(welfare$income)

# 이상치 결측 처리
welfare$income <- ifelse(welfare$income %in% c(0, 9999), NA, welfare$income)
table(is.na(welfare$income))
welfare$income

## 3) 성별에 따른 월급 분석하기
# 성별 월급 평균표 만들기
sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>%
  summarise(mean_income = mean(income))
sex_income

# 그래프 그리기
ggplot(sex_income, aes(x= sex, y = mean_income, fill= sex)) +
  geom_bar(stat = 'identity') +
  ggtitle('성별에 따른 평균월급') +
  xlab('성별') +
  ylab('평균월급') +
  theme_classic() +
  theme(plot.title = element_text(size=15, color = 'red',
                                  hjust = 0.5, vjust=0)) +
  theme(axis.title.x = element_text(size = 10, color = 'blue',
                                    hjust = 0.5, vjust = 0)) +
  theme(axis.title.y = element_text(size= 10, color = 'green',
                                    hjust = 0.5, vjust = 0)) +
  theme(axis.text.x = element_text(angle=45, size = 10, color=6)) +
  theme(axis.text.y = element_text(angle=0, size = 10, color=9)) +
  theme(legend.title = element_text(face="italic", colour="darkblue",size=10)) +
  geom_text(aes(y=mean_income - 5, label= paste(round(mean_income,1), '만원')),
            color='black', size=5)


  

### 3. 나이와 월급의 관계
## 1) 나이 변수 검토 및 전처리
# 나이 변수 검토
class(welfare$birth)
summary(welfare$birth)

# 이상치 확인
summary(welfare$birth)

# 결측치 확인
table(is.na(welfare$birth))

# 이상치 결측 처리
welfare$birth <- ifelse(welfare$birth == 9999, NA, welfare$birth)
table(is.na(welfare$birth))
welfare$birth

## 2) 년도를 나이로 파생변수 만들어 주기
welfare$age <- 2015 - welfare$birth + 1
welfare$age
summary(welfare$age)

## 3) 나이와 월급 관계 분석
# 나이와 평균월급표 만들기
age_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age) %>%
  summarise(mean_income = mean(income))
age_income

# 그래프 그리기
ggplot(age_income, aes(x=age, y= mean_income)) +
  geom_line(linetype=1, color= 'darkblue', size=1) +
  scale_color_discrete(name = "평균월급", labels = '평균월급') +
  ggtitle('나이에 따른 평균월급') +
  xlab('나이') +
  ylab('평균월급') +
  theme_bw() +
  theme(plot.title = element_text(size=15, color = 'red', 
                                  hjust = 0.5, vjust = 0)) +
  theme(axis.title.x = element_text(size=10, color = 'blue', 
                                    hjust=0.5, vjust = 0)) +
  theme(axis.title.y = element_text(size=10, color = 'green', 
                                    hjust=0.5, vjust = 0)) +
  theme(axis.text.x = element_text(angle = 0, size = 10, color = 5)) +
  theme(axis.text.y = element_text(size=10, color=6))


### 4. 연령대에 따른 월급 차이(어떤 연령대의 월급이 가장 많을까?)
## 1) 연령대 변수 검토 및 전처리
# 연령대 파생변수 만들기
welfare <- welfare %>%
  mutate(ageg = ifelse(age < 30, "20대 이하",
                  ifelse(age < 40, "30대",
                  ifelse(age < 50, "40대",
                  ifelse(age < 60, "50대", "60대 이상")))))
table(welfare$ageg)
qplot(welfare$ageg)

# 연령대 월급 평균표 만들기
ageg_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg) %>%
  summarise(mean_income = mean(income))
ageg_income

# 그래프 그리기
ggplot(ageg_income, aes(x= ageg, y= mean_income, fill= ageg)) +
  geom_bar(stat = 'identity') +
  ggtitle('연령대별 평균월급') +
  xlab('연령대') +
  ylab('평균월급') +
  theme_light() +
  theme(plot.title = element_text(size=15, color = 'red',
                                  hjust = 0.5, vjust=0)) +
  theme(axis.title.x = element_text(size = 10, color = 'blue',
                                    hjust = 0.5, vjust = 0)) +
  theme(axis.title.y = element_text(size= 10, color = 'green',
                                    hjust = 0.5, vjust = 0)) +
  theme(axis.text.x = element_text(angle=45, size = 10, color=6)) +
  theme(axis.text.y = element_text(angle=0, size = 10, color=9)) +
  theme(legend.title = element_text(face="italic", colour="darkblue",size=10)) +
  theme(legend.text = element_text(face='italic', colour = 'blue', size=8)) +
  geom_text(aes(y=mean_income - 5, label= paste(round(mean_income,1), '만원')),
            color='black', size=3)



### 5. 연령대 및 성별 월급차이(성별 월급 차이는 연령대별로 다를까?)
## 1) 연령대, 성별 및 월급 변수 검토 및 전처리
## 2) 연령대 및 성별 월급 평균표 만들기
sex_ageg_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg, sex) %>%
  summarise(mean_income = mean(income))
sex_ageg_income

## 3) 그래프 그리기
ggplot(sex_ageg_income, aes(x= ageg, y= mean_income, fill= sex)) +
  geom_bar(stat = 'identity', colour = 'black') +
  ggtitle('연령대 및 성별에 따른 평균 월급') +
  xlab('연령대') +
  ylab('평균월급') +
  theme_minimal() +
  theme(plot.title = element_text(size = 15, color = 'red', hjust = 0.5,
                                  face = 'italic')) +
  theme(axis.title.x = element_text(size = 10, color = 'blue', hjust=0.5,
                                    face = 'bold')) +
  theme(axis.title.y = element_text(size = 15, color = 'green', hjust = 0.5,)) +
  theme(axis.text.x = element_text(angle = 45, color = 6)) +
  theme(axis.text.y = element_text(color = 8)) +
  theme(legend.title = element_text(size = 15, color = 'darkblue')) +
  theme(legend.text = element_text(size = 10, color = 11)) +
  theme(legend.position = c(0 ,0.9)) +
  theme(legend.background = element_rect())


        