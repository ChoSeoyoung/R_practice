#Generate 100,000,000 test scores with ¥ì(80,15) and save into ¡°scores¡± (vector)
n=100*1000*1000
scores<-rnorm(n,80,15) #Normal Distribution

hist(scores)
mean(scores)
sd(scores)
max(scores)
min(scores)

uscores<-floor(runif(n,0,100)) #uniform Distribution
hist(uscores)
mean(uscores)
sd(uscores)
max(uscores)
min(uscores)

#Use my_sum() to print the sum. Is it working? What is the data type of the sum?
my_sum<-function(arr){
  result=0
  for(a in arr){
    result=result+a
  }
  return(result)
}
my_sum(scores)
sum(scores)

#Make my_avg() and my_sd() and see if it is close to ¥ì(80,15)
my_avg<-function(arr){
  n=length(arr)
  if(n<1)return(NA)
  return (sum(arr)/n)
}
my_avg(scores)
mean(scores)
my_sd<-function(arr){
  avg<-mean(arr)
  arr2<-(arr-avg)*(arr-avg)
  return(sqrt(mean(arr2)))
}
my_sd(scores)
sd(scores)

#What do you call this type of distribution? Normal Distribution
#Include the Histogram.
hist(scores)