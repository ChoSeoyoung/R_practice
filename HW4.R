##8-5.
ds<-table(mtcars$cyl,mtcars$gear) #행 cyl,열=gear
color<-c('tomato','salmon','peachpuff')
barplot(ds,#데이터
        main='Distribution of carburetors',#제목
        xlab='Number of gear',
        ylab='frequency',
        legend.text=c('cyl4','cyl6','cyl8'),
        args.legend=list(x='topright',bty='n'),
        col=color)


##9-4.
###1.
install.packages("DAAG")
library(DAAG)
data(greatLakes)
ds<-data.frame(greatLakes)
plot(ds[,"Erie"],
     ds[,"michHuron"],
     pch=19)
###2.
vars<-c('Erie','michHuron','Ontario','StClair')
target<-ds[,vars]
head(target)
plot(target,main='greatLakes')
