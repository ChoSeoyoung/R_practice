#2.
survey<-c(T,F,T,T,F,T,F,F,F,F)
colors()
tbl<-table(survey)
barplot(tbl,main='Result of Survey',
        names=c('No','Yes'),col='steelblue2')

#3.
tbl<-table(mtcars$cyl)
barplot(tbl,horiz = TRUE,
        col=c('slategray','seashell3','skyblue4'),
        main='실린더 종류별 분포',
        ylab='실린더의 수')

#4.
ds<-sleep$extra
tbl<-table(ds)
hist(ds,breaks=4,
     main='Histogram of sleep',
     xlab='Increase in hours of sleep')

#5.
ds<-table(mtcars$cyl,mtcars$gear)
color<-c('tomato','salmon','peachpuff')
barplot(ds,main='Distribution of carburetors',
        beside=TRUE,col=color,
        legend.text=c('cyl4','cyl6','cyl8'))
#참고
dep.A<-c(66,72,74,80)
dep.B<-c(44,28,21,15)
dep.C<-c(26,32,35,36)
ds<-rbind(dep.A,dep.B,dep.C)
barplot(ds,main='분기별 영업이익',
        names=c('1Q','2Q','3Q','4Q'),
        beside=TRUE,col=c('tomato','orange','yellow'))

#6.
ds<-trees$Height
color.6<-rep("#f1faee",6)
color.6[3:5]<-'#e63946'
hist(ds,col=color.6,
     main='Histogram of Black Cherry Trees',
     xlab='Height(ft)',ylab='Frequency')

#7.
par(mfrow=c(3,2),mar=c(5,4,4,3))
par(mfrow=c(1,1),mar=c(5,4,4,2)+.1)

#8.
male<-c(6.9,30.4,80.4)
female<-c(4.9,38.2,82.7)
ds<-rbind(male,female)
colnames(ds)<-c('samsung','apple','huawei')
par(mfrow=c(1,1),mar=c(5,5,5,5))
barplot(ds,horiz=TRUE,
        main='성별에 따른 브랜드 선호도',
        legend.text=c('여자','남자'),
        beside=TRUE, las=1,
        col=c('#ffe66d','#00afb9'),
        args.legend=list(x='right',bty='n',inset=c(-0.22,0)))
par(mfrow=c(1,1),mar=c(5,4,4,2)+.1)

#9.
holyday<-c(14,15,15,16,14,11,12)
holyday.actual<-c(15,35,38,36,34,32,32)
ds<-rbind(holyday,holyday.actual)
colnameS(ds)<-c('한국','일본','독일','러시아','미국','프랑스','호주')
barplot(ds,beside=T,
        main='주요 국가별 공휴일 현황',
        names=c('한국','일본','독일','러시아','미국','프랑스','호주'),
        xlab='국가',col=c('gray','skyblue'),
        legend.text=c('공휴일 수','실제 쉬는 날'),
        args.legend=list(x='topleft',bty='n',inset=c(-0.2,-0.25)))
