#엘리베이터
weight<-c(56,23,89,46,76,14,97,72,68,62,35) #단위kg
names(weight)<-c('a','b','c','d','e','f','g','h','i','j','k')
for(i in names(sort(weight))){
  if(sum(weight)-weight[i]<=600){
    print(i)
    break
  }
}

overWeight<-function(w){
  return (w[w>50])
}
overWeight(weight)

library(svDialogs)
height<-as.numeric(dlgInput('height')$res)
weight<-as.numeric(dlgInput('weight')$res)
bmi<-function(h,w){
  h<-h/100
  return (w/(h^2))
}
bmi(height,weight)

#CSV input/output
setwd('C:\\Users\\Cho\\Desktop\\단국\\2학년 2학기\\데이터사이언스\\수업자료, 복습')
air=read.csv('airquality.csv',header=T)
air

#xlsx input/output
library(xlsx)
my.iris<-subset(iris,Species=='setosa')
my.iris
write.xlsx(my.iris,"my.iris.xlsx",row.names = F)
my.iris_output=read.xlsx('my.iris.xlsx',header=T,sheetIndex=1)
my.iris_output

##LAB2
library(ggplot2)
str(diamonds)
diamonds.new<-subset(diamonds, cut=='Premium' & carat>=2)
diamonds.new
write.csv(diamonds.new, 'shiny_diamonds.csv',row.names=F)

diamonds.load<-read.csv('shiny_diamonds.csv',header=T)
diamonds.new<-subset(diamonds.load,color!='D')
write.xlsx(diamonds.new,'diamonds_new.xlsx',row.names = F)
diamonds.new

#실전분석
library(svDialogs)
library(xlsx)

carprice.new<-read.csv('carprice.csv',header=T)
str(carprice.new)

##조건에 맞게 입력받기
input.type<-dlgInput('Input type')$res
input.city<-dlgInput('Input MPG.city')$res
input.city<-as.numeric(input.city)
##조건에 맞는 파일 추출하기
result<-subset(carprice.new,Type==input.type & MPG.city>=input.city)

#search.txt파일에 조건에 맞는 파일 작성
sink('search.txt',append=T)
print(result)
sink()

#엑셀파일로도
write.xlsx(result,'search.xlsx',row.names=F)

#추가조건을 만족하는 것들을 search.txt파일에 추가
result2=subset(carprice.new,(Type=='Compact' & MPG.city>=20)|(Type=='Small' & MPG.city>=30))
result2

sink('search.txt',append=T)
print(result2)
sink()