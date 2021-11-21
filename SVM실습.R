#Titanic
trainData=read.csv("C:\\Users\\Cho\\Desktop\\단국\\2학년 2학기\\데이터사이언스\\데이터사이언스_과제5자료\\train.csv")
testData=read.csv("C:\\Users\\Cho\\Desktop\\단국\\2학년 2학기\\데이터사이언스\\데이터사이언스_과제5자료\\test.csv")
testLabel=read.csv("C:\\Users\\Cho\\Desktop\\단국\\2학년 2학기\\데이터사이언스\\데이터사이언스_과제5자료\\gender_submission.csv")

View(trainData)
View(testData)
#Data Preprecessing####################################################
library(dplyr)
titanic_full <- dplyr::bind_rows(trainData, testData)
#A.Age-선실별 나이 평균값으로 결측값 처리
age.p1<-mean(subset(titanic_full,Pclass=="1")$Age,na.rm=T)
age.p2<-mean(subset(titanic_full,Pclass=="2")$Age,na.rm=T)
age.p3<-mean(subset(titanic_full,Pclass=="3")$Age,na.rm=T)
age.mean<-mean(titanic_full$Age,na.rm=T)
titanic_full$Age<-ifelse((is.na(titanic_full$Age) & titanic_full$Pclass == '1'), age.p1, titanic_full$Age)
titanic_full$Age<-ifelse((is.na(titanic_full$Age) & titanic_full$Pclass == '2'), age.p2, titanic_full$Age)
titanic_full$Age<-ifelse((is.na(titanic_full$Age) & titanic_full$Pclass == '3'), age.p3, titanic_full$Age)
colSums(is.na(titanic_full))
#B.Fare-요금의 평균으로 결측값 처리
fare.mean<-mean(titanic_full$Fare,na.rm=T)
titanic_full$Fare<-ifelse((is.na(titanic_full$Fare)), age.mean, titanic_full$Fare)
colSums(is.na(titanic_full))
View(titanic_full)
#c.Factorization / Numeric Conversion
titanic_full$Survived<-as.factor(titanic_full$Survived)
titanic_full$Pclass<-as.factor(titanic_full$Pclass)
titanic_full$Pclass<-as.numeric(titanic_full$Pclass)
titanic_full$Sex<-as.factor(titanic_full$Sex)
titanic_full$Sex<-as.numeric(titanic_full$Sex)
titanic_full$Embarked<-as.factor(titanic_full$Embarked)
titanic_full$Embarked<-as.numeric(titanic_full$Embarked)
titanic_full$SibSp<-as.factor(titanic_full$SibSp)
titanic_full$Parch<-as.factor(titanic_full$Parch)  
########################################################
#model
titanic_full<-subset(titanic_full, select=-Cabin)
titanic_full<-subset(titanic_full, select=-Name)
titanic_full<-subset(titanic_full, select=-Ticket)
titanic_full<-subset(titanic_full, select=-PassengerId)
titanic_full<-subset(titanic_full, select=-Fare)
titanic_full<-subset(titanic_full, select=-Embarked)
titanic_full<-subset(titanic_full, select=-SibSp)
titanic_full<-subset(titanic_full, select=-Parch)
#titanic_full<-subset(titanic_full, select=-Age)
library(e1071)
trainIdx<-c(0:891)
svm.model<-svm(formula=as.factor(Survived) ~.,subset=trainIdx, data = titanic_full,type="C-classification")
test<-titanic_full[-trainIdx,]
test<-subset(test,select=-Survived)
Survived<-predict(svm.model,test)
PassengerId=testData$PassengerId
result<-cbind(data.frame(PassengerId),data.frame(Survived))
setwd("C:\\Users\\Cho\\Desktop\\단국\\2학년 2학기\\데이터사이언스\\수업자료, 복습")
write.csv(result,'submission.csv',row.names = F)

################
train<-titanic_full[trainIdx,]
train<-subset(train,select=-Survived)
predicted<-predict(svm.model,train)
actual<-titanic_full[trainIdx,]$Survived
m<-caret::confusionMatrix(as.factor(predicted),as.factor(actual))
m

#knn
ds.train<-as.matrix(titanic_full[trainIdx,][,-1])
cl.train<-titanic_full[trainIdx,]$Survived
pred<-knn(ds.train,ds.train,cl.train,k=3,prob=T)
pred
acc<-mean(pred==cl.train)
acc
table(pred,cl.train)
