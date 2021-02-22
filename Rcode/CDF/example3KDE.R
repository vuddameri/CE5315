# Script to plot KDE using various Kernels
# Assumes default bandwidth

# Set working directory
dir <- '/home/vuddameri/CE5315-New/Rcode/CDF'
setwd(dir)

# Read the data
a <- read.csv('soilmoisturedata.csv')

# Extract soil moisture for Junction station
JSM <- a$Junction..mm
summary(JSM)
# Normalize it to dimensionless soil moisture
JSM <- JSM/1600
summary(JSM)

# KDE with different bandwidths
plot(density(JSM),main="KDE estimates for Soil Moisture at Junction, TX",col=1)
lines(density(JSM,bw='ucv'),col=2)
lines(density(JSM,bw='bcv'),col=3)
lines(density(JSM,bw='SJ-ste'),col=4)
lines(density(JSM,bw='SJ-dpi'),col=5)
legend('topright',legend=c('nrd0','ucv','bcv','SJ-ste','SJ-dpi'),
col=c(1,2,3,4,5),lty=c(1,1,1,1,1))
grid()

# Calculate the bandwidths
nrd0 <- bw.nrd0(JSM)
ucv <- bw.ucv(JSM)
bcv <- bw.bcv(JSM)
SJ.ste <- bw.SJ(JSM,method='ste')
SJ.dpi <- bw.SJ(JSM,method='dpi')
cat(nrd0,ucv,bcv,SJ.ste,SJ.dpi,'\n')

