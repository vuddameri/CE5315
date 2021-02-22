# Script for Box plot
# Venki Uddameri, Ph.D., P.E.

# Set working Directory
dir <- '/home/vuddameri/CE5315-New/Rcode/EDA/Univariate'
setwd(dir)
# Read the data file
a <- read.csv('sheardata.csv')  # this is a data.frame
shear <- a$shear.tsf

# Plot the box plot
par(mgp=c(2.5,1,0))
boxplot(shear,ylab='Shear Stress (tsf)')

# Boxplot with no outliers plotted
boxplot(shear,ylab='Shear Stress (tsf)',outline=F)
