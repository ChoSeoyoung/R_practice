##매트릭스
##코드 5-2
x<-1:4
y<-5:8
z<-matrix(1:20,nrow=4,ncol=5)

m1<-cbind(x,y) #x와 y를 열 방향으로 결합하여 매트릭스 생성
m1
m2<-rbind(x,y) #x와 y를 행 방향으로 결합하여 매트릭스 생성
m2
m3<-rbind(m2,x) #매트릭스 m2와 벡터 x를 행 방향으로 결합
m3
m4<-cbind(z,x) #매트릭스 z와 벡터 x를 열 방향으로 결합
m4

#연속된 숫자가 아닌 2차원 자료를 저장하려면
score<-matrix(c(100,78,80,80,50,65),nrow=2,byrow=T) #byrow=F가 default값

#확인문제1
v<-seq(from=5, to=60, by=5)
a<-matrix(v,nrow=4, ncol=3, byrow=T)
b<-matrix(v,nrow=4, ncol=3, byrow=F)
a
b

##LAB1
burger<-matrix(c(514,917,11,
                 533,853,13,
                 566,888,10),
               nrow=3,
               byrow=T)

burger #매트릭스의 내용 확인
rownames(burger)<-c('M','L','B')
colnames(burger)<-c('kcal','na','fat')
burger

burger['M','na']
burger['M',]
burger[,'kcal']

##데이터프레임
iris
iris[,c(1:2)]#1~2열의 모든 데이터
iris[,c(1,3,5)]#1,3,5열의 모든 데이터
iris[,c(1,5)]#1,5열의 모든 데이터
iris[,c("Sepal.Length","Species")]#1,5열의 모든 데이터
iris[c(1:5),]#1~5행의 모든 데이터
iris[c(1,3),]#1~5행의 데이터 중 1,3열의 데이터

##LAB1
burger<-data.frame(kcal=c(514,533,566),
                   na=c(917,853,888),
                   fat=c(11,13,10),
                   menu=c('새우','불고기','치킨'))
rownames(burger)<-c('M','L','B')
burger
burger['M','na'] #M사의 나트륨 함량
burger['M',]
burger[,'kcal']
burger[c('M','B'),'menu']

##매트릭스와 데이터프레임 다루기
dim(iris)
nrow(iris)
ncol(iris)
#행과 열의 방향 변환하기
z<-matrix(1:20,nrow=4,ncol=5)
z
t(z)
#확인문제
colSums(mtcars); colMeans(mtcars)
rowSums(mtacrs); rowMeans(mtcars)
subset(mtcars, hp>=100&hp<200)
mtcars[,1:3]*0.9+1
##LAB
class(trees)
str(trees)

girth.mean<-mean(trees$Girth)

candidate<-subset(trees, Girth>=girth.mean&Height>80&Volume>50)
candidate
nrow(candidate)

##실전분석
install.packages('reshape2')
library(reshape2)
tips

#tips의 자료구조가 매트릭스인지 확인하기
is.matrix(tips)
class(tips)

#처음 6개의 관측값을 출력
head(tips)

#str()함수를 사용하여 데이터의 구조 알아보기기
str(tips)

table(tips$day)
dinner<-subset(tips,time=='Dinner')
lunch<-subset(tips,time=='Lunch')
table(dinner$day)
table(lunch$day)

colMeans(dinner[c('total_bill','tip','size')])
colMeans(lunch[c('total_bill','tip','size')])

tip.rate<-tips$tip/tips$total_bill #팁의 비율
mean(tip.rate)
