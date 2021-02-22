# Script to calculate KDE AUC area using various Kernels
# Assumes default bandwidth
# Venki Uddameri, Ph.D., P.E.

# load library (needs to be installed before using it)
library(caTools)

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

# KDE with different density estimators
JSM.gau <- density(JSM)
JSM.epa <- density(JSM,kernel = "epanechnikov")
JSM.biw <- density(JSM,kernel='biweight')
JSM.rec <- density(JSM,kernel='rectangular')
JSM.tri <- density(JSM,kernel='triangular')

# compute the area under the curve
auc.gau <- trapz(JSM.gau$x,JSM.gau$y)
auc.epa <- trapz(JSM.epa$x,JSM.epa$y)
auc.biw <- trapz(JSM.biw$x,JSM.biw$y)
auc.rec <- trapz(JSM.rec$x,JSM.rec$y)
auc.tri <- trapz(JSM.tri$x,JSM.tri$y)
cat(auc.gau,auc.epa,auc.biw,auc.rec,auc.tri,'\n')

