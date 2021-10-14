#1.데이터의 입력과 출력
#데이터 입력
age<-c(28,17,35,46,23,67,30,50)
age

#정보 추출
young<-min(age)
old<-max(age)

#처리 결과 출력
cat('가장 젊은 사람의 나이는',young,'이고',
    '가장 나이든 사람의 나이는',old,'입니다.\n')


#화면에서 데이터 입력받기
##패키지 설치
install.packages('svDialogs')
library(svDialogs)
user.input<-dlgInput('Input income')$res
user.input
income<-as.numeric(user.input) #문자열을 숫자로
income
tax<-income*0.05 #세금 계산
cat('세금:',tax)

x<-26
y<-'입니다'
z<-c(10,20,30,40)

print(x) #하나의 값 출력
print(y) #하나의 값 출력
print(z) #벡터 출력
print(iris[1:5,]) #데이터프레임 출력
print(x,y) #두 개의 값 출력(에러 발생)

#LAB1.체질량 지수 계산하기
library(svDialogs)
height<-as.numeric(dlgInput('Input height(cm)')$res)
weight<-as.numeric(dlgInput('Input weight(kg)')$res)
height<-height/100
bmi<-weight/(height^2)
cat('입력한 키는',height*100,'cm, 몸무게는',weight,'kg 입니다.\n',sep=" ")
cat('BMI는',bmi,'입니다',sep=" ")

#파일을 이용해 데이터를 읽고 쓰기
getwd() #현재 작업 폴더 알아내기
setwd('C:\\Users\\Cho\\Desktop\\단국\\2학년 2학기\\데이터사이언스\\수업자료, 복습')
getwd()

#.csv파일에서 데이터 읽기
air<-read.csv('auto-mpg.csv',header=T) #csv파일 읽기
head(air)
class(air)

#.csv파일에 데이터 쓰기
my.iris<-subset(iris,Species=='setosa')
write.csv(my.iris,'my_iris2.csv',row.names=T) #인덱스 번호가 매겨짐
write.csv(my.iris,'my_iris.csv',row.names=F)

#엑셀 파일 읽기와 쓰기
install.packages('xlsx')
library(xlsx)
air<-read.xlsx("auto-mpg.xlsx",header=T,sheetIndex=1)
head(air)

##LAB2. 다이아몬드 정보 제공하기
library(ggplot2)
str(diamonds)
diamonds.new<-subset(diamonds, cut=='Premium' & carat>=2)
write.csv(diamonds.new,'shiny_diamonds.csv',row.names=F) #행번호는 제외하라.
diamonds.load<-read.csv('shiny_diamonds.csv',header=T) #첫 번째 행에는 열 이름이 위치
diamonds.new<-subset(diamonds.load,color!='D')
library(xlsx)
write.xlsx(diamonds.new, 'shinky_diamonds.xlsx',row.names=T)

#3.파일 입출력에서 알아야 할 내용을 확인합니다.
print('Begin work')
a<-10; b<-20
sink('result.txt',append=T)
cat('a+b=',a+b,'\n')
sink()
cat('hello world\n')
sink('result.txt',append=T)
cat('a*b=',a*b,'\n')
sink()
print("End work")

a<-1:10
b<-1:100
sink('result.txt',append=T)
cat('1부터 10까지 자연수의 합은',sum(a),'입니다.\n')
cat('1부터 100까지 자연수의 합은',sum(b),'입니다.\n')
sink()

#LAB3. 체질량 지수 계산하기
library(svDialogs)
height<-dlgInput('Input height(cm)')$res
weight<-dlgInput('Input weight(kg)')$res
height<-as.numeric(height)
weight<-as.numeric(weight)
height<-height/100
bmi<-weight/(height^2)

sink('bmi.txt',append=T)
cat(height*100,weight,bmi)
cat('\n')
sink()

result<-read.table('bmi.txt',sep=" ")
result

names(result)<-c('height','weight','bmi')
write.table(result,'bmi_new.txt',row.names=F)
