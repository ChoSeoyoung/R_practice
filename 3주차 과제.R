scores<-rnorm(n=100000000, mean=80, sd=15)

my_sum <- function(a){
  result<-0
  for(i in a)
    result<-result+i
  return (result)
}

my_avg <- function(a){
  result<-0
  count<-0
  for(i in a){
    count<-count+1
    result<-result+i
  }
  return (result/count)
}

my_sd <- function(a,avg_value){
  result<-0
  count<-0
  for(i in a){
    count<-count+1
    result<-result+((i-avg_value)*(i-avg_value))
  }
  return (sqrt(result/count))
}

my_sum(scores)
sum(scores)

my_avg(scores)
mean(scores)
my_sd(scores,my_avg(scores))
sd(scores)

result<-my_sum(scores)
mode(result)