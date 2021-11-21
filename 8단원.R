#1.막대그래프 작성의 기초
##1-1.도수분포표 작성하기
favorite<-c('WINTER','SUMMER','SPRING','SUMMER','SUMMER','FALL','FALL','SUMMER','SPRING','SPRING') #데이터 입력
favorite
table(favorite) #도수분포 계산

#도수분포표 저장
ds<-table(favorite)
ds
barplot(ds,main='favorite season')

##1-2.막대그래프의 색 지정하기
barplot(ds,main='favorite season',col='blue')

##1-3.막대별로 색을 다르게 지정하기
barplot(ds, main='favorite season',col=c('blue','red','green','yellow'))

##1-4.팔레트에서 색을 선택하여 사용하기
barplot(ds, main='favorite season',col=rainbow(4))

##1-5.x축, y축에 설명 붙이기
barplot(ds, main='favorite season',col='green',xlab='계절',ylab='빈도수')

##1-6.그래프 막대를 수평 방향으로 출력하기
barplot(ds, main='favorite season',col='yellow',horiz=TRUE)

##1-7.x축의 그룹 이름 바꾸기
barplot(ds, main='favorite season',col='yellow',names=c('FA','SP','SU','WI'))

##1-8.x축의 그룹 이름을 수직 방향으로 출력하기
barplot(ds, main='favorite season',col='green',las=2) #그룹 이름을 수평방향으로 

###확인문제1##########################################################
#10명의 혈액형 정보가 저장된 blood 변수를 사용하여 다음과 같은       #
#막대 그래프를 그리는 코드를 작성하시오(막대그래프 색은 purple)      #
######################################################################
blood<-c('A형','B형','B형','AB형','O형','A형','O형','A형','B형','A형')
ds<-table(blood)
barplot(ds,main='blood distribution', #제목 붙이기
        xlab='frequency',ylab='type', #x축,y축에 이름 붙이기
        col='purple', #막대의 색 지정
        horiz=TRUE, #수평으로 출력
        names=c('AB','A','B','O'))

#2.중첩 그룹의 막대그래프
#데이터 입력
age.A<-c(13709,10974,7979,5000,4250)
age.B<-c(17540,29701,36209,33947,24487)
age.C<-c(991,2195,5366,12980,19007)

ds<-rbind(age.A,age.B,age.C)
colnames(ds)<-c('1970','1990','2010','2030','2050')
ds

#그래프 작성
barplot(ds, main='인구추정')

##2-1.연령대별로 색을 다르게 지정하기
barplot(ds,main='인구추정',col=c('green','blue','yellow'))

##2-2.연령대를 각각의 막대로 표현하기
barplot(ds,main='인구 추정',col=c('green','blue','yellow'))

##2-3.막대그래프에 범례 추가
barplot(ds, main='인구 추정',col=c('green','blue','yellow'),beside=TRUE,legend.text=T)

##2-4.범례를 그래프 밖에 표시하기
#par():그래프를 표시할 창에 대해 설정하는 역할
#mfrow:그래프를 출력할 창을 어떻게 분할할지를 지정하는데, 여기서 c(1,1)은 창을 분할하지 않음을 의미한다.
#mar:그래프를 출력할 창과 그래프 출력 영역 밖의 여유 공간을 지정한다.
par(mfrow=c(1,1),mar=c(5,5,5,7))
barplot(ds,main='인구추정',col=c('green','blue','yellow'),
        beside=TRUE, #각각의 막대로 표시
        legend.text=T, #범례 표시
        args.legend=list(x='topright',bty='n',inset=c(-0.25,0)))

##2-5.범례의 내용 바꾸기
par(mfrow=c(1,1),mar=c(5,5,5,7))
barplot(ds,main='인구추정',col=c('green','blue','yellow'),
        beside=TRUE, #각각의 막대로 표시
        args.legend=list(x='topright',bty='n',inset=c(-0.25,0)),
        legend.text=c('0~14세','15~64세','65세 이상'))
par(mfrow=c(1,1),mar=c(5,4,4,2)+0.1) #그래프창 설정 해제

###확인문제2##########################################################
#다음 그래프는 한 과일 가게의 최근 5일간 판매량을 기록한 정보이다. 다#
#음과 같은 막대그래프를 그리는 코드를 작성하시오(green,purple,yellow)#
######################################################################
m1<-c(62,68,60,65,71) #수박 판매량
m2<-c(41,32,44,48,45) #포도 판매량
m3<-c(28,30,36,24,21) #참외 판매량

ds<-rbind(m1,m2,m3)
colnames(ds)<-c('월','화','수','목','금')

par(mfrow=c(1,1),mar=c(5,5,5,7))
barplot(ds,main='최근 5일간 과일 판매량',col=c('green','purple','yellow'),
        beside=TRUE,legend.text=c('수박','포도','참외'),
        args.legend=list(x='topright',bty='o',inset=c(-0.25,0)))
par(mfrow=c(1,1),mar=c(5,4,4,2)+0.1) #그래프창 설정 해제