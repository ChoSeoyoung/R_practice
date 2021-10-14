burger<-matrix(c(514,917,11,
       533,853,13,
       566,888,10),
       nrow = 3, byrow=T)
rownames(burger)<-c('M','L','B')
colnames(burger)<-c('열량','나트륨','포화지방')
burger
burger['M','나트륨'] #M사의 나트륨 함량량
burger['M',] #M사의 모든 영양 정보
burger[,'열량'] #모든 브랜드의 칼로리 정보

m1<-matrix(1:4,2,2)
m1
m2<-matrix(1:2,2,1)
m2
m1%*%m2

class(state.x77)
state.x77
is.matrix(state.x77)
is.data.frame(state.x77)
class(state.x77)

class(trees)
stre(trees)

girth.mean<-mean(trees$Girth)
girth.mean
candidate<-subset(trees,Girth>girth.mean & Height>80 & Volume>50)
candidate
