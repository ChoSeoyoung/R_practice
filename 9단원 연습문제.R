#1.
##1-1.
library(carData)
tbl<-table(MplsStops$race)
pie(tbl)
##1-2.
tbl<-table(MplsStops$problem)
pie(tbl,col=c('red','blue'))
##1-3.
tbl<-table(MplsStops$personSearch)
pie(tbl)
##1-4.
tbl<-table(MplsStops$gender)
install.packages('plotrix')
library(plotrix)
pie3D(tbl,col=c('green','orange','yellow'))
    
#2.
##2-1.
library(DAAG)
data(greatLakes)
ds<-data.frame(year=1918:2009,greatLakes)
plot(ds$year,ds$Erie,
     type='l',lty=1,lwd=1,
     xlab='year',ylab='수위')
##2-2.
plot(ds$year,ds$michHuron,
     type='b',lty=1,lwd=1,col='red',
     xlab='year',ylab='수위')
##2-3.
plot(ds$year,ds$Erie,col='red',
     type='b',lty=1,lwd=1,
     xlab='year',ylab='수위',ylim=c(173,177.5))
lines(ds$year,ds$michHuron,type='b',col='blue')
lines(ds$year,ds$StClair,type='b',col='green')

#3.
##3-1.
library(DAAG)
data(cfseal)
ds<-data.frame(cfseal)
boxplot(ds$weight)
##3-2.
boxplot.stats(ds$heart)
##3-3.
grp<-rep('old',nrow(ds))
grp[ds$age<mean(ds$age)]<-'low'
boxplot(ds$weight~grp)
rep('old',nrow(ds))
##3-4.
grp<-rep('high',nrow(ds))
grp[(ds$weight>boxplot.stats(ds$weight)$stats[2])
    &(ds$weight<boxplot.stats(ds$weight)$stats[4])]<-'middle'
grp[ds$weight<boxplot.stats(ds$weight)[2]]<-'low'
boxplot(ds$stomach~grp)

#4.
##4-1.
library(DAAG)
data("greatLakes")
ds<-data.frame(greatLakes)
plot(ds$Erie,ds$michHuron)
##4-2.
plot(ds)

#5.
##5-1.
library(DAAG)
data(grog)
ds<-data.frame(grog)
plot(ds$Beer,ds$Wine)
##5-2.
levels(ds$Country)
group<-as.numeric(ds$Country)
colors<-c('red','blue')
vars<-c('Beer','Wine','Spirit')
plot(ds[,vars],pch=c(group),col=colors[group])
