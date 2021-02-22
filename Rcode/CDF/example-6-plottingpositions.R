# Script to construct KDE for Soil Moisture
# Use KDE to obtain a Probability value
# Venki Uddameri, Ph.D., P.E.

# A Generic Plotting Position Function
plotpos <- function(alpha,x)
{
x.sort <- sort(x)
x.rank <- rank(x.sort)
N <- length(x.sort)
Fx <- (x.rank - alpha)/(N+1-2*alpha)
return(Fx)
}

# Set working directory and read data
setwd('D:\\Dropbox\\CE5331-Probabilistic Methods- Fall2019')
a <- read.csv('soilmoisturedata.csv')
JSM <- a$Junction..mm
summary(JSM)

# Normalize the soil moisture in mm to a dimensionless value
JSM <- JSM/1600  # 1600 mm is the height of the soil column
summary(JSM)

# Set up alphas for different Plotting positions
alpha <- c(0.5,0.0,0.44,0.4,0.31)
alpha.dat <- matrix(alpha,5,1)  # Put it in the matrix form
ppx <- apply(alpha.dat,1,plotpos,JSM) # Use apply to loop over different alphas
colnames(ppx) <- c('Hazen','Weibull','Gringorten','Cunnane','Beard') # add column names
JSM.sort <- sort(JSM)  # Create sorted soil moisture series

# Make the plot
plot(JSM.sort,ppx[,1],ylim=c(0,1),col=1,xlab='Soil Moisture (dim)',ylab='Probability',pch=1)
points(JSM.sort,ppx[,2],col=2,pch=2)
points(JSM.sort,ppx[,3],col=3,pch=3)
points(JSM.sort,ppx[,4],col=4,pch=4)
points(JSM.sort,ppx[,5],col=5,pch=5)
title('Empirical CDF using various Plotting Positions')
legend('bottomright',legend=c('Hazen','Weibull','Gringorten','Cunnane','Beard'),
col=c(1,2,3,4,5),pch=c(1,2,3,4,5))
grid()

# Compute the risk of soil dryness
cutoff <- 0.136
Hazen.dry <- approx(ppx[,1],JSM.sort,cutoff)$y
Weibull.dry <- approx(ppx[,2],JSM.sort,cutoff)$y
Gringorten.dry <- approx(ppx[,3],JSM.sort,cutoff)$y
Cunnane.dry <- approx(ppx[,4],JSM.sort,cutoff)$y
Beard.dry <- approx(ppx[,5],JSM.sort,cutoff)$y
