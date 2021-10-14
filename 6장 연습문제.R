#1.다음과 같이 팝업창을 띄어 값을 입력받기 위한 명령문을 완성하시오.
library(svDialogs)
input.value<-dlgInput('Input a value')$res

#2.print()함수의 경우 자동으로 줄바꿈을 하지만 cat()함수는 줄바꿈을 하지 않는다. cat()함수에서 줄바꿈을 위해 어떤 문자열을 추가해야 하는지 적으시오.
cat('\n')

#3.
getwd()

#4.다음과 같이 콤마로 각각의 값을 구분하는 파일의 형식은 무엇인지 적으시오.
#csv파일

#5.엑셀 파일을 불러오고 저장하기 위한 명령문을 완성하시오.
setwd('C:\\Users\\Cho\\Desktop\\단국\\2학년 2학기\\데이터사이언스\\수업자료, 복습')
library(xlsx)
ds<-read.xlsx('airquality.xlsx',header=T,sheetIndex=1) #파일읽기
write.xlsx(ds,'airquality_new.xlsx',row.names=F) #파일쓰기, index를 주지 않음

#6.cat함수의 실행결과를 'result.txt'에 출력하기 위한 명령문을 작성하시오.
sink('result.txt',append=T)
cat('a','b','c')
sink()

#7.삼각형의 밑변과 높이를 팝업창에서 입력받아 넓이를 출력하는 프로그램을 작성하시오.
##넓이를 계산하는 함수
area<-function(base,height){
  return (base*height/2)
}
##밑변과 높이를 입력
base<-as.numeric(dlgInput('length of base')$res)
height<-as.numeric(dlgInput('length of height')$res)
cat('삼각형의 넓이는',area(base,height),'입니다.')

#8.다음은 ds_tab.txt 파일에 저장된 데이터의 일부이다. 각 열은 탭으로 구분되어 있고 헤더는 포함되어 있지 않다고 했을 때 이 파일을 불러오기 위한 명령문을 작성하시오.
df=read.table('ds_tab.txt',header=F,sep="\t")
df

#9.다음과 같이 ds.txt를 ds.csv로 변경하여 저장하기 위한 명령문을 작성하시오.
df_input=read.table('ds_tab.txt',sep="\t",header=F)
write.csv(df_input,'ds_tab.csv',row.names = F)
df_output=read.csv('ds_tab.csv')
df_output

#10.엑셀을 이용해 R에 내장되어 있는 iris데이터셋을 분석하려고 한다.
write.xlsx(iris,'iris.xlsx',row.names = F)
iris_df=read.xlsx('iris.xlsx',header=T,sheetIndex = 1)

#11.
library(svDialogs)
sink('log.txt')
cat('------x*y------\n')
sink()
x<-as.numeric(dlgInput('Input X')$res)
y<-as.numeric(dlgInput('Input Y')$res)
sink('log.txt',append=T)
cat('x=',x,'y=',y,'result=',x*y,'\n')
sink()