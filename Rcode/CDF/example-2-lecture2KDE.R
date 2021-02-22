# Script to plot KDE using various Kernels
# Assumes default bandwidth

# Set working directory
setwd('D:\\Dropbox\\CE5331-Probabilistic Methods- Fall2019')

# Read the data
a <- read.csv('soilmoisturedata.csv')

# Extract soil moisture for Junction station
JSM <- a$Junction..mm
summary(JSM)
# Normalize it to dimensionless soil moisture
JSM <- JSM/1600
summary(JSM)

# KDE with different density estimators
plot(density(JSM),main="KDE estimates for Soil Moisture at Junction, TX",col=1)
lines(density(JSM,kernel = "epanechnikov"),col=2)
lines(density(JSM,kernel='biweight'),col=3)
lines(density(JSM,kernel='rectangular'),col=4)
lines(density(JSM,kernel='triangular'),col=5)
legend('topright',legend=c('Gaussian','Epanechnikov','Biweight','Rectangular','Triangular'),
col=c(1,2,3,4,5),lty=c(1,1,1,1,1))
grid()