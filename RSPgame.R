R<-1
S<-2
p<-3

rsp_name<-function(n){
  if(n==R) return("Rock")
  else if(n==S) return("Scissor")
  else if(n==P) return("Paper")
  else return("BS")
}

who_won<-function(c,u){
  if(c==R){
    if(u==P){
      return ("User:)")
    }else if(u==R){
      return ("Draw")
    }else return("Computer T.T")
  }else if(c==S){
    if(u==R){
      return ("User:)")
    }else if(u==S){
      return ("Draw")
    }else return("Computer T.T")
  }else if(c==P){
    if(u==S){
      return ("User:)")
    }else if(u==P){
      return ("Draw")
    }else return("Computer T.T")
  }
}

input=0
while(input!='q'){
  #User RSP
  input<-readline(prompt="Enter your choice(r/s/p/q(uit)):")
  if(input=='r'){
    user<-R
  }else if(input=='s'){
    user<-S
  }else if(input=='p'){
    user<-P
  }else{
    user<-0
  }
  
  if(input=='q'){
    print('Bye~')
    break
  }else if(user==0){
    cat("User:",rsp_name(user),"|")
    print("RSP again!")
    next #continue
  }
  
  #Computer RSP
  com<-floor(runif(1,1,4))
  cat("Com",rsp_name(com),"|")
  
  cat("User:",rsp_name(com),"|")
  cat("=>The winner:",who_won(com,user))
}

