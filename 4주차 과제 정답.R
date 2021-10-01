#Generate 9 random numbers(200~500)
salary<-runif(9,200,500)

#Add 10000 as the 10th number
salary[length(salary)+1]=10000

#Get mean and median using my_mean() and my_median()
my_mean<-function(arr){
  n=length(arr)
  if(n<1)return(NA)
  return(sum(arr)/n)
}
my_median<-function(arr){
  n=length(arr)
  if(n<1)return(NA)
  arr<-sort(arr)
  if(n%%2==0) return((arr[n/2]+arr[n/2+1])/2)
  else return(arr[ceiling(n/2)])
}
hist(salary)

#T-test
grp1<-rnorm(20,130,20)
print(grp1)

grp2<-rnorm(30,140,20)
print(grp2)

p1<-hist(grp1)
p2<-hist(grp2)

plot(p1,col=rgb(0,0,1,1/4),main='',xlim=c(50,200),ylim=c(0,20))
plot(p2,col=rgb(1,0,0,1/4),main='',xlim=c(50,200),ylim=c(0,20),add=T)

t.test(grp1,grp2,alternative = "less")

#T-test in Excel
tData=cbind(grp1,grp2)
dimnames(tData)[[2]]<-c('grp1','grp2')
class(tData)
View(tData)
write.csv(tData,"tData.csv")
