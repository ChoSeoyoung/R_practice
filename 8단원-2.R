#2.히스토그램
head(cars)
dist<-car[,2]
dist
hist(dist, #data
     main='Histogram for 제동거리', #제목
     xlab='제동거리',ylab='빈도수',
     border='blue', #막대 테두리색
     col='green', #막대 색
     las=2, #x축 글씨 방향(0~3)
     breaks=5 #막대 개수 조절
     )
     
#3.그래프 심화
par(mfrow=c(2,2),mar=c(3,3,4,2)) #화면 분할(2*2)

hist(iris$Sepal.Length, #그래프1
     main='Sepal.Length',
     col='orange')

barplot(table(mtcars$cyl), #그래프2
        main='mtcars',
        col=c('red','green','blue'))

barplot(table(mtcars$gear), #그래프3
        main='mtcars',
        col=rainbow(3),
        horiz=TRUE)

pie(table(mtcars$cyl),
        main='mtcars',
        col=topo.colors(3), #topo 팔레트 사용
        radius=2)

par(mfrow=c(1,1),mar=c(5,4,4,2)+.1) #화면 분할 취소
