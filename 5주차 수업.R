v<-c(1,4,3,7,8)
2*v
v-5
3*v+4

v1<-c(1,2,3)
v2<-c(10,20,30)
v3<-v2-v1
v1*v2
v2/v1
v4<-c(v1,v2)
v4

######LAB 1 R cafe revenue analysis....
espresso<-c(4,5,3,6,5,4,7)
americano<-c(63,68,64,68,72,89,94)
latte<-c(61,70,59,71,71,92,88)

sale.espresso<-2*espresso
sale.americano<-2.5*americano
sale.latte<-3.0*latte

sale.day<-sale.espresso+sale.americano+sale.latte
names(sale.day)<-c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')

sum(sale.day)
sale.mean<-mean(sale.day)
names(sale.day[sale.day>=sale.mean])

#Factor
#문자형 데이터가 저장되는 벡터의 일종
bt<-c('A','B','B','0','AB','A')
bt.new<-factor(bt)
bt
bt.new
bt[5]
levels(bt.new)
bt[0]
bt[1]
levels(bt.new) #팩터에 저장된 값의 종류를 출력
as.integer(bt.new)
bt.new[7]<-'B'
bt.new[8]<-'C'
bt.new

#List
h.list<-c('coding','guitar','bike') #hobby vector
person<-list(name='Sam',age=20,student=TRUE,hobby=h.list) #list generation
person
person[[1]]
person$name
person[[4]]

###LAB 2 R cafe revenue analysis2###
cafe<-list(espresso=c(4,5,3,6,5,4,7),
           americano=c(63,68,64,68,72,89,94),
           latte=c(61,70,59,71,71,92,88),
           price=c(2.0,2.5,3.0),
           menu=c('espresso','americano','latte'))

cafe$menu<-factor(cafe$menu)
names(cafe$price)<-cafe$menu
sale.espresso<-cafe$price['espresso']*cafe$espresso
sale.americano<-cafe$price['americano']*cafe$americano
sale.latte<-cafe$price['latte']*cafe$latte