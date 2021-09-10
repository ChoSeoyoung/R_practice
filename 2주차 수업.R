s="Hello World"
print(s)
#Basic Operations
1+2
4+2*3
11/3
2**8 #2^8
2**10
2**20
2**40 #automatic type casting
round(11/3.1)
floor(11/3)
ceiling(11/3)

19%%5

# Swapping a,b
a <- 1
b <- 2

tmp <- a
a <- b
b < -a

# Package
install.packages('ggplot2')
librar?(ggplot2)
ggplot(data=iris,aes(x=Petal.Length,y=Petal.Width))+geom_point()

# a fun package
install.packages('cowsay')
library(cowsay)
say("Helllo World",by="cow")

#if-else
job.type<-'A'
if(job.type=='B'){
  bonus<-200 #적군이 B일 때, 실행
}
else{
  bonus?-100 #적군이 B가 아닌 나머지 경우 실행
}
print(bonus)


s="Hellow World"
print(s)

#Basic Operations
1+2
4+2*3
11/3
2**8 #2^8
2**10
2**20
2**40 # automatic type casting

round(11/3,1) # arguments:input
floor(11/3)
ceiling(11/3)

19%%5

# Swapping a,b
a <- ?
b <- 2

tmp <- a
a <- b
b <- tmp

#Package
install.packages('ggplot2')
library(ggplot2)
ggplot(data=iris,aes(x=Petal.Length,y=Petal.Width))+geom_point()
summary(iris)

# a fun package
install.packages('cowsay')
library(cowsay)
cowsay::say("Hello World", "?hark")

# Game1: Odd/Even Verifier
num<-floor(runif(1,1,100))
cat("num:",num)

if(num%%2==0) {
  print("Even")
}else {
  print("odd")
}



#Using for loop, do it 10 times

for(i in c(1:10)){ # for(int i=1;i<=10;i++) 
  num<-floor(runif(1,1,100))
  cat("num?",num)
  
  if(num%%2==0) {
    print("Even")
  }else {
    print("odd")
  }
}



#Convert it into "While" Loop

i=1
while(i<=10) {
  num<-floor(runif(1,1,100))
  cat("num:",num)
  
  if(num%%2==0) {
    print("Even")
  }else {
    print("odd")
  }
  
  i=?+1 # i++
}



#game 2 odd/even verifier 2
num <- floor(runif(1,1,100))
choice=readline(prompt="choose:odd/even:")
cat("num:",num," choice:",choice)

mod_num <- floor(num%%2)
if(mod_num==1 && choice=='odd') {
  print("Yeah :)")
} else if(mod_num==0 && choic?=='even'){
  print("Yeah :)")
} else print("Sorry :(")


# Self-Game project #1: RSP



# precision in R
.Machine$integer.max
log(.Machine$integer.max,2)
.Machine$integer.max+1L # What's the result? 

n1=3*1000*1000*1000
is.integer(n1)
is.double(n1)