# Script to construct KDE for Soil Moisture
# Use KDE to obtain a Probability value
# Venki Uddameri, Ph.D., P.E.

# load library needed for integration
library(caTools)
# Set working directory and read data
setwd('D:\\Dropbox\\CE5331-Probabilistic Methods- Fall2019')
a <- read.csv('soilmoisturedata.csv')
JSM <- a$Junction..mm
summary(JSM)

# Normalize the soil moisture in mm to a dimensionless value
JSM <- JSM/1600  # 1600 mm is the height of the soil column
summary(JSM)

# Fit the Kernel Density Estimate using 1024 equally spaced pts between 0 & 0.35
JSM.gau <- density(JSM,from=0.00,to=0.35,n=1024)
plot(JSM.gau,main='PDF for Soil Moisture @ Junction, TX')
grid()
# Extract the x and f(x) density data
JSM.dat <- cbind(JSM.gau$x,JSM.gau$y)

# Subset the x values over the required range
JSM.rng <- subset(JSM.dat,JSM.dat[,1]>=0&JSM.dat[,1]<=0.136)

# Perform the integration
trapz(JSM.rng[,1],JSM.rng[,2])