#1
##1-1
accident<-c(31,26,42,47,50,54,70,66,43,32,32,22)
names(accident)<-c('M1','M2','M3','M4','M5','M6',
                   'M7','M8','M9','M10','M11','M12')
accident
##1-2
sum(accident)
##1-3
max(accident)
min(accident)
##1-4
accident*0.9
##1-5
accident[accident>=50]
##1-6
month.50<-accident[accident>=50]
names(month.50)
names(accident[accident>=50])
##1-7
length(accident[accident<50])
##1-8
M6.acc<-accident[6]
accident[accident>M6.acc]
accident[accident>accident[6]]

#2
a<-25:150
condi<-a[a%%3==0&a<100]
length(condi)

#3
weight<-c(56,23,89,46,76,14,97,72,68,62,35)
names(weight)<-c('a','b','c','d','e','f','g','h','i','j','k')

total=sum(weight)
for(i in names(sort(weight))){
  if(total-weight[i]<=600){
    print(i)
    break
  }
}
