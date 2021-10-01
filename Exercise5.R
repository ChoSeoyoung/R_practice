##3
x<-c(2,4,6,8)
y<-c(10,12,14,16)
z<-c(18,20,22,24)
m<-cbind(x,y,z) #x,y,z를 열방향으로 묶음
m

matrix(c(2,10,18,
         4,12,20,
         6,14,22,
         8,16,25),nrow=4,byrow=T)
matrix(c(2,4,6,8,
         10,12,14,16,
         18,20,22,24),ncol=3,byrow=F)

##4
#매트릭스 m만들기
m<-matrix(c(9,7,5,3,
            8,11,2,9), nrow=2, byrow=T)
#행에 이름 붙이기
rownames(m)<-c('x','y')
#열에 이름 붙이기
colnames(m)<-c('a','b','c','d')

##5
m<-t(m)
df<-data.frame(m)
df.new<-data.frame(df,info=c(1,2,3,4),row.names=NULL)
#df.new<-cbind(df,info=c(1,2,3,4),row.names=NULL)
class(df.new)

##6
blood<-c('A','O','AB','B','AB')
rh<-c('+','+','-','+','+')
age<-c(21,30,43,17,26)
df<-cbind(blood,rh,age)
colnames(df)
df.new<-subset(df,df[,'blood']!='B')

##7
str(cars)
dim(cars) #행과 열의 개수
class(cars)#변수의 이름과 자료형=(speed, dist),데이터 프레임

##8
#계산을 위해서는 행과 열의 개수가 같아야함
matrix(1:12, nrow=3)%%3 #T
matrix(1:12, nrow=3)+3 #T
matrix(1:12, nrow=3)+matrix(1:12, nrow=4) #F
matrix(1:12, nrow=3)+matrix(1:12, nrow=3) #T
rbind(matrix(1:9,nrow=3),c('1','2','3'))+3 #F 자료형

##9
제목<-c('그대랑','다툼','빨래','두통','보조개','매듭','이상해')
좋아요<-c(16075,8218,12119,738,3200,16144,5110)
love<-data.frame(제목,좋아요)
rownames(love)<-c(1,2,3,4,5,6,7)
love

best<-subset(love,love['좋아요']==max(love['좋아요']))
best['제목']

##10
mid<-data.frame(국어=c(97,88,100),
                역사=c(100,82,96),
                수학=c(83,90,76),
                과학=c(95,91,89),
                영어=c(92,87,95))
rownames(mid)<-c('스티브','엔더맨','크리퍼')

final<-data.frame(국어=c(94,92,100),
                  역사=c(95,95,100),
                  수학=c(90,87,85),
                  과학=c(92,95,84),
                  영어=c(89,94,96))
rownames(final)<-c('스티브','엔더맨','크리퍼')

(mid+final)/2

##11
class(cars)
dim(cars)
head(cars)
str(cars)
rowMeans(cars)
max(cars['dist'])
subset(cars[c('speed','dist')],cars['dist']==max(cars['dist']))

##12
is.matrix(InsectSprays)
str(InsectSprays)
tail(InsectSprays)
levels(InsectSprays[,'spray'])
table(InsectSprays['spray'])
InsectSprays.e=subset(InsectSprays,InsectSprays['spray']=='E')
colMeans(InsectSprays.e['count'])
