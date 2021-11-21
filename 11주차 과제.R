#1.
#library(Ecdat)
#data(Hdma)
#https://r-data.pmagunia.com/dataset/r-dataset-package-ecdat-hdma
Hdma=read.csv("C:\\Users\\Cho\\Desktop\\단국\\2학년 2학기\\데이터사이언스\\Ecdat_Hdma.csv")
tbl<-table(Hdma$self)
barplot(tbl, main="자영업 비율",xlab="자영업 여부",ylab="수")
#2.
tbl<-table(Hdma$single)
par(mar=c(1,1,4,1))
pie(tbl, main="미혼/기혼 비율")
par(mar=c(5.1,4.1,4.1,2.1))
#3.
##3-1.
boxplot(Hdma$uria,main="실업률")
##3-2.
summary(Hdma$uria)
##3-3.
idx=which(Hdma$uria<3.1)
idx2=which(Hdma$uria>3.9)
length(Hdma$uria)-length(idx)-length(idx2)
#4.
Hdma$deny
yes<-subset(Hdma,deny=="yes")
no<-subset(Hdma,deny=="no")
mean(yes$hir)
mean(no$hir)
