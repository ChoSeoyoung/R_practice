#Recursion: Tower of hanoi
hanoi<-function(n,src,dest,tmp){
  if(n==1){
    cat("move dist from ",src,"to ",dest,"\n")
  }else{
    hanoi(n-1,src,tmp,dest)
    cat("move dist from ",src,"to ",dest,"\n")
    hanoi(n-1,tmp,dest,src)
  }
}
hanoi(2,1,3,2)
hanoi(3,1,3,2)
hanoi(10,1,3,2)