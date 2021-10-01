##4
a<-25:100
condi<-a[a%%3==0 & a<100]
length(condi)

##5
a<-c('good','great','bad','okay','good','bad','good')
f<-factor(a) #벡터a를 팩터f로 만듦
levels(f) #f에 저장된 값의 종류를 구함

##6
price<-c(76000,52000,36000)
promotion<-c(0.05,0.1,0.05)
total<-price*(1-promotion)
total

##7
smartphone<-list(model="iphone_se",
                 capacity=c(64,128,256),
                 display='Retina',
                 color=c('black','red','white'))
smartphone$color

##8
weight<-c(56,23,89,46,76,14,97,72,68,62,35) #단위 kg
names(weight)<-c('a','b','c','d','e','f','g','h','i','j','k')

total=sum(weight)
for(i in names(sort(weight))){
  if(total-weight[i]<=600){
    print(i)
    break
  }
}

##9
favorite<-factor(c('여름','봄','여름','겨울','봄','겨울','여름','여름','봄','가을'))
levels(favorite)

##10
country<-factor(c('호주','독일','영국','일본',
                  '미국','중국','호주','영국',
                  '중국','일본','터키','미국',
                  '중국','중국','호주','터키',
                  '독일','일본','중국','독일'))
levels(country)
as.integer(country) #실수/문자형 벡터를 정수형으로 변환

##11
post<-list(user_id='mr_steve',
           post_id='p11010',
           view=37,
           image=FALSE,
           like=c('creeper','alex','skeleton','enderman'))
post

##12
account<-list(name='하늘',
              number='123-468-120566',
              balance=4128750,
              history=c(-50000,20000,-32500,-79000,42000))
입금횟수=length(account$history[account$history>0])
출금횟수=length(account$history[account$history<0])
print(입금횟수)
print(출금횟수)