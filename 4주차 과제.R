#1
n<-12
res<-ifelse(n<0, -n, n)
print(res)

n<--12
res<-ifelse(n<0, -n, n)
print(res)

#2
fibonacci <- function(n){
  a<-0
  b<-1
  if(n<2){
    return(1)
  }else{
    for(i in 0:(n-2)){
      temp<-a+b
      a<-b
      b<-temp
    }
    return(b) 
  }
}
print(fibonacci(1))
print(fibonacci(2))
print(fibonacci(3))
print(fibonacci(4))
print(fibonacci(5))

#3
llist<-sample(x=200:500,size=9)
llist[10]=10000

my_mean <- function(a){
  result<-0
  count<-0
  for(i in a){
    count<-count+1
    result<-result+i
  }
  return (result/count)
}

my_median <- function(a){
  count<-length(a)/2
  return (a[count])
}

my_mean(llist)
my_median(llist)

#4
data<-read.csv('C:\\Users\\Cho\\Desktop\\단국\\2학년 2학기\\데이터사이언스\\수업자료, 복습\\age.csv')
data
t.test(data[['X2018']],data[['X2019']])
