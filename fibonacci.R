##fibonacci(n)
#0,1,1,2,3,5,8,...

fibonacci<-function(n){
  if(n<1)return(NA)
  else if(n==1)return(0)
  else if(n==2)return(1)
  
  f<-seq(0,1)
  for(i in 3:n){
    f<-c(f,f[i-2]+f[i-1])
  }
  return(f)
}