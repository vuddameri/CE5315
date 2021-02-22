# Script for univariate plots
# Venki Uddameri, Ph.D., P.E.

# Load library
library(Hmisc)

# Set working Directory
dir <- '/home/vuddameri/CE5315-New/Rcode/EDA/Univariate'
setwd(dir)

# Read the data file
a <- read.csv('Lecture1-sheardata.csv')  # this is a data.frame
shear <- a$shear.tsf

#Step 1: Calculate the break values (6 breaks)
breaks <- seq(min(shear),max(shear),length.out=6)
# Step 2: Arrange the data in bins
shear.bin <- cut(shear,breaks=breaks)
# Step 3: Compute Frequencies
shear.freq <- table(shear.bin)

# Step 4: Calculate Cumulative Frequency
shear.cum <- c(0,cumsum(shear.freq))

# Step 5: Plot cumulative frequency
par(mgp=c(2.5,1,0))
plot(breaks,shear.cum,col='red',xlab='Shear Stress (tsf)',
     ylab='Cumulative Frequency') # plot the cumulative frequency curve
lines(breaks,shear.cum,col='red') # join the points with a line
minor.tick(nx=5,ny=5)
grid()
title('Cumulative Frequency of Shear Stress',cex.main=0.7)

# Step 6: Add a Histogram if necesary
mycol <- rgb(0, 0, 255, max = 255, alpha = 125, 
             names = "blue50") #50% trans
hist(shear,breaks=6,add=T,col=mycol)
# Step 7: Add a data rug
rug(shear,col='blue')
