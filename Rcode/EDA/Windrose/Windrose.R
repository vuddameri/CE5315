library(openair)
library(psych)
library(hexbin)
library(skimr)
library(zoo)
library(RColorBrewer)
setwd('/home/vuddameri/CE5315-New/Rcode/EDA/Multivariate')
a <- read.csv('HoustonAQIinp.csv')
ws <- a$WSPEED.ts * 0.51444444444444
wd <- a$WDIR.ts
c <- data.frame(ws,wd)
windRose(c,ws="ws",wd="wd",
         breaks=c(0,5,7,10,15),dig.lab=2,
         annotate = F,border=T)
title("Wind Rose")


# Pairs plot
apar <- a[,c(2,3,5,7,8,9)]
pairs(apar,lower.panel = NULL) #psych library
pairs.panels(apar)

sink('multsummary.txt')
skim(apar)
sink()

bin<-hexbin(a$OZONE.ts, a$SRAD.ts, xbins=6)
my_colors=colorRampPalette(rev(brewer.pal(11,'Spectral')))
plot(bin, 
     xlab = "Ozone (ppb)", 
     ylab = 'Solar Radiation',
     main="" , colramp=my_colors)

# Make Correlation Plot
apar.cor <- cor(apar,method='spearman')
cor.plot(apar.cor, main='Correlation of Ozone',upper=F)

# Make ACF and CCF plot
O3.ts <- zoo(a$OZONE.ts,a$tottime)
acf(O3.ts,lag.max=24, main="")
title('ACF of Ozone')
srad.ts <- zoo(a$SRAD.ts,a$tottime)
ccf(srad.ts,O3.ts,ylab='ccf',lag.max=24, main="")
title('Solar Radiation-Ozone Correlation')
