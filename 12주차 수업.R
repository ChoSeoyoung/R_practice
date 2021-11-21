install.packages('carData')
library(carData)

#(1)데이터 준비
room.class<-TitanicSurvival$passengerClass
room.class

#(2)도수분포 계산
tbl<-table(room.class)
tbl
sum(tbl)

#(3)막대그래프 작성
barplot(tbl,main='선실별 탑승객',
        xlab='선실등급',
        ylab='탑승객수',
        col=c('blue','green','yellow'))
#(3)원그래프 작성
tbl/sum(tbl)
par(mar(1,1,4,1))
pie(tbl,main='선실별 탑승객',
    col=c('blue','green','yellow'))
par(mar(5.1,4.1,4.1,2.1))
##############################################
#(1)데이터 준비
grad<-state.x77[,'HS Grad'] #주별 졸업률
#(2)사분위수
summary(grad)
var(grad) #분산
sd(grad) #표준편차
#(3)히스토그램
hist(grad,main='주별 졸업률',
     xlab='졸업률',
     ylab='주의 개수',
     col='orange')
#(4)상자그림
boxplot(grad,main='주별 졸업률',
        col='orange')
#(5)졸업률이 가장 낮은 주
idx<-which(grad==min(grad))
grad[idx]

#(6)졸업률이 가장 높은 주
idx<-which(grad==max(grad))
grad[idx]

#(7)졸업률이 평균 이하인 주
idx<-which(grad<mean(grad))
grad[idx]
##############################################

##############################################
##############################################
#(1)데이터 확인
head(pressure)

#(2)산점도 작성
plot(pressure$temperature,
     pressure$pressure,
     main='온도와 기압',
     xlab='온도(화씨)',
     ylab='기압')

#(3)상관계수
cor(pressure$temperature,pressure$pressure)

##############################################
head(cars)

#Scatter Plot
plot(cars$speed, #X data
     cars$dist, #Y data
     main='Speed vs. Stop Dist.',
     xlab='Speed',
     ylab='Stop Distance')

#(3) Correlation Coefficient
cor(cars$speed, cars$dist)
##############################################
#확인문제.DAAG 패키지에 포함된 carprice 데이터셋에서 자동차 가격(Price)과 시내 주행 연비(MPG,city)간의 상관관걔를 산점도와 산관계수를 통해서 알아보시오.
library(DAAG)

#(1)데이터 확인
head(carprice)
#(2)산점도 작성
plot(carprice$MPG.city,#시내주행연비
     carprice$Price,#가격
     main='MPG.city vs. Prcie',
     xlab='연비',
     ylab='가격')
#(3)상관계수
cor(carprice$MPG.city,carprice$Price)
##############################################
#(1)데이터 확인
st<-data.frame(state.x77)
#(2)다중 산점도 작성
plot(st)
#(3)다중 상관계수
cor(st)
##############################################
#확인문제.DAAG 패키지에 포함된 carprice 데이터셋에서 자동차 가격(Price), 100마일 주행에 필요한 연료량(gpm100), 시내 주행 연비(MPG.city), 고속도로 주행 연비(MPG.highway) 간의 상관관계를 다중 산점도와 다중 산관계수를 통해서 알아보고, 가장 상관도가 높은 두 변수를 찾으시오.
#(1)데이터 확인
tmp<-carprice[,c('Price','gpm100','MPG.city','MPG.highway')]
head(tmp)
#(2)다중 산점도
plot(tmp)
#(3)다중 상관계수
cor(tmp)
