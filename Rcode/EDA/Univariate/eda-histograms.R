# Set working Directory
dir <- '/home/vuddameri/CE5315-New/Rcode/EDA/Univariate'
setwd(dir)

# Read the data file
a <- read.csv('sheardata.csv')  # this is a data.frame

# See the first few values in the data frame to make sure
# Everything came in correctly
head(a)
# Plot various histograms
# Set up a 2 x 2 canvas
par(mgp=c(2.25,1,0))
par(mfrow= c(2,2))

# Histogram with equal intervals
hist(shear,breaks=3,ylim=c(0,10),xlim=c(0,2),xlab='Shear(tsf)',col='grey',border='red',lty=1,main="")
box()
title('3 Equal Intervals',cex.main=0.7)

# Histogram with sturges rule intervals
hist(shear,breaks='sturges',ylim=c(0,10),xlim=c(0,2),xlab='Shear(tsf)',col='grey',border='red',lty=1,main="")
box()
title('Sturges Rule',cex.main=0.7)

# Histogram with Rice rule
k <- ceiling(2*(length(shear))^(1/3))
hist(shear,breaks=k,ylim=c(0,10),
     xlim=c(0,2),xlab='Shear(tsf)',
     col='grey',border='red',lty=1,main="")
box()
title('Rice Rule',cex.main=0.7)

# Histogram Freedman-Diaconis
k <- nclass.FD(shear)
hist(shear,breaks=k,ylim=c(0,10),xlim=c(0,2),
     xlab='Shear(tsf)',col='grey',border='red',
     lty=1,main="")
box()
title('Freedman-Diaconis Rule',cex.main=0.7)

