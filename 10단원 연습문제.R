#4.
##4-1.
Hdma=read.csv('Hdma.csv')
barplot(table(Hdma$self))
##4-2.
pie(table(Hdma$single))
##4-3.
boxplot(Hdma$uria)
boxplot.stats(Hdma$uria) #2.0~4.3
length((boxplot.stats(Hdma$uria))$out) #457°³
##4-4.
levels(factor(Hdma$deny))
idx<-which(Hdma$deny=="no")
mean(Hdma$hir[idx])
idx<-which(Hdma$deny=="yes")
mean(Hdma$hir[idx])
