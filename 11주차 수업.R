#Titanic
#install.packages('titanic')
library(titanic)
library(dplyr)
library(caret)
library(e1071)

###Data Preprocessing###
titanic_train2<-titanic_train
#A.Feature Selection(All): Pclass, Age, Sex, SibSp, Parch, Embarked
titanic_train2<-select(titanic_train2,PassengerId,Survived,Pclass, Age, Sex, SibSp, Parch, Embarked)
head(titanic_train2)
#B. NAs=>mean
age.mean.male<-mean(titanic_train[which(titanic_train$Sex=='male'),'Age'],na.rm=T)
age.mean.male
age.mean.female<-mean(titanic_train[which(titanic_train$Sex=='female'),'Age'],na.rm=T)
age.mean.female

for(i in 1:nrow(titanic_train2)){
  if(titanic_train2[i,'Sex']=='male'&&is.na(titanic_train2[i,'Age'])){
    titanic_train2[i,'Age']=age.mean.male
  }else if(titanic_train2[i,'Sex']=='female'&&is.na(titanic_train2[i,'Age'])){
    titanic_train2[i,'Age']=age.mean.female
  }
}
summary(titanic_train2)

#c.Factorization / Numeric Conversion
titanic_train2$Survived<-as.factor(titanic_train2$Survived)
titanic_train2$Pclass<-as.factor(titanic_train2$Pclass)
  titanic_train2$Pclass<-as.numeric(titanic_train2$Pclass)
titanic_train2$Sex<-as.factor(titanic_train2$Sex)
  titanic_train2$Sex<-as.numeric(titanic_train2$Sex)
titanic_train2$Embarked<-as.factor(titanic_train2$Embarked)
  titanic_train2$Embarked<-as.numeric(titanic_train2$Embarked)
titanic_train2$SibSp<-as.factor(titanic_train2$SibSp)
titanic_train2$Parch<-as.factor(titanic_train2$Parch)  
###End of Data Preprocessing###

###Exploratory Data Analysis (EDA) on titanic2###
grp0<-titanic_train2[which(titanic_train2$Survived==0),]
grp1<-titanic_train2[which(titanic_train2$Survived==1),]

#Pclass graph:
p0<-hist(grp0$Pclass)
p1<-hist(grp1$Pclass)
plot(p0,col=rgb(1,0,0,1/4),xlim=c(1,3),ylim=c(0,600))
plot(p1,col=rgb(0,0,1,1/4),xlim=c(1,3),ylim=c(0,600),add=T)
#Pclass t-test:
t.test(grp0$Pclass,grp1$Pclass)

#Sex graph:
p0<-hist(grp0$Sex)
p1<-hist(grp1$Sex)
plot(p0,col=rgb(1,0,0,1/4),xlim=c(1,2),ylim=c(0,600))
plot(p1,col=rgb(0,0,1,1/4),xlim=c(1,2),ylim=c(0,600),add=T)
#Sex t-test:
t.test(grp0$Sex,grp1$Sex)

#Age graph:
p0<-hist(grp0$Age)
p1<-hist(grp1$Age)
plot(p0,col=rgb(1,0,0,1/4),xlim=c(1,80),ylim=c(0,150))
plot(p1,col=rgb(0,0,1,1/4),xlim=c(1,80),ylim=c(0,150),add=T)
#Age t-test:
t.test(grp0$Age,grp1$Age)

###Use FSelector for best feature selection###
#install.packages('FSelector')
#Sys.setenv(JAVA_HOME="C:/Program Files/Java/jre1.8.0_40")
library(FSelector)
weights<-FSelector::symmetrical.uncertainty(Survived~.,titanic_train2[,-1]) #feature중요도 구하기
print(weights)

###SVM###

#Classification
ds.train<-as.matrix(titanic_train2[,-2])
cl.train<-titanic_train2$Survived
model.svmC<-svm(ds.train,cl.train,type="C-classification")
pred.train<-predict(model.svmC,ds.train)
caret::confusionMatrix(cl.train,pred.train)
#Regression
ds.train<-as.matrix(titanic_train2[,-2])
cl.train<-titanic_train2$Survived
model.svmR<-svm(ds.train,cl.train,type="nu-regression")
pred.train<-predict(model.svmC,ds.train)
caret::confusionMatrix(cl.train,pred.train)
##Knn
#install.packages("class")
library(class)
pred<-knn(ds.train,ds.train,cl.train,k=3,prob=T)
pred
acc<-mean(pred==cl.train)
acc
m<-caret::confusionMatrix(cl.train,pred)
m


##iris
tr.idx<-c(1:25,51:75,101:125)
ds.tr<-iris[tr.idx,1:4]
ds.ts<-iris[-tr.idx,1:4]
cl.tr<-iris[tr.idx,5]
cl.ts<-iris[-tr.idx,5]

pred<-knn(ds.tr,ds.ts,cl.tr,k=3,prob=T)
pred
acc<-mean(pred==cl.ts)
acc
table(pred,cl.ts)
#####################################
#1.데이터셋을 불러와서 내용을 확인하기
library(DAAG)
str(carprice)
carprice$Price #자동차 가격

#2.자동차 가격의 범위와 평균을 구합니다.
range(carprice$Price)
mean(carprice$Price)

#3.가격에 대한 히스토그램을 작서아여 데이터의 분포를 확인합니다.
hist(carprice$Price, main='자동차 가격',
     xlab='가격대',
     ylab='빈도',
     col='green')

#4.자동차 타입(Type)별로 데이터의 빈도수를 계산하여 막대그래프로 확인합니다.
tbl<-table(carprice$Type)

barplot(tbl, main='자동차 타입별 빈도수',
        xlab='타입',
        ylab='빈도수',
        col=rainbow(length(tbl)))

#가격이 가장 비싼 자동차는 어떤 타입인지 알아봅니다.
idx<-which(carprice$Price==max(carprice$Price))
carprice[idx,c('Type','Price')]

