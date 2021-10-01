##Call by Value vs. Call by Reference
#Call by Value
a<-10
b<-20
swap<-function(a,b){
  tmp<-a
  a<-b
  b<-tmp
}
cat(a,b)
swap(a,b)
cat(a,b)

#Call by Reference
c<-c(10,20)
rswap<-function(vec){
  tmp<-vec[1]
  vec[1]<-vec[2]
  vec[2]<-tmp
  return(vec)
}
cat(c)
c<-rswap(c)
cat(c)
