#Test R Program
print('hello world')
sqrt(127*17)

# Game1: Odd/Even Verifier
num<-floor(runif(1,1,100))
car("num:",num)
if(num%%2==0){
  print("Even")
}else {
  print("Odd")
}

#game 2 odd/even verifier 2
num <- floor(runif(1,1,100))
choice<-readline(prom?t="Choose Even/Odd")
cat("num:",num," choice:",choice)

mod_num <- floor(num%%2)
if(mod_num==1 && choice=='odd') {
  print("Yeah :)")
} else if(mod_num==0 && choice=='even'){
  print("Yeah :)")
} else print("Sorry :(")


# Self-Game project #1: RSP
num<-fl?or(runif(1,1,100))
choice<-readline(prompt='Choose R/S/P')
cat('num:',num,'choice=',choice)

if(num%%3==0 && choice='R'){
  print('Yeah~')
} else if(num%%3==1 && choice='S'){
  print('Yeah~')
} else if(num%%3==2 && choice='P'){
  print('Yeah~')
} else
  pr?nt('Sorry')