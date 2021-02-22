weibullpp <- function(x)
{
x.sort <- sort(x)
x.rank <- rank(x.sort)
N <- length(x)
Fx <- (x.rank)/(N+1)
zz <- cbind(x.sort,Fx)
return(zz)
}

library(MASS)

setwd('D:\\Dropbox\\CE5331-Probabilistic Methods- Fall2019')
a <- read.csv('soilmoisturedata.csv')
JSM <- a$Junction..mm
summary(JSM)
JSM <- JSM/1600
summary(JSM)
JSM.cut <- cut(JSM,breaks=c(0,0.14,0.20,0.35),labels=c('low','medium','high'))
summary(JSM.cut)
hist(JSM,freq=FALSE,xlab='Soil Moisture (dim)',main='Soil Moisture @ Junction, TX')

zz <- weibullpp(JSM)
plot(zz[,1],zz[,2],xlab='Soil Moisture Content (dim)',ylab='Cumulative Probability')
hist(JSM,freq=F)
truehist(JSM)

JSM.ts <- ts(JSM,start=c(1948,01),frequency=12)
plot(JSM.ts,ylab='Soil Moisture (dim)',xlab='Year')
abline(h=0.14,col='red',lty=2,lwd=2)
abline(h=0.20,col='blue',lty=2,lwd=2)
title('Estimated Monthly Soil Moisture at Junction, TX')
text(1980,0.075,'Dry')
text(1980,0.275,'Wet')
grid()

hist(JSM,freq=F,xlab='Soil Moisture (dim)',ylab='Density',main='Est. Soil Moisture @ Junction, TX')
box()
rug(JSM)
grid()