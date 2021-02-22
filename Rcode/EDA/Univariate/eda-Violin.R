# Script for Violin plot
# Venki Uddameri, Ph.D., P.E.

# Load library
library(vioplot)

# Set working Directory
# Set working Directory
dir <- '/home/vuddameri/CE5315-New/Rcode/EDA/Univariate'
setwd(dir)

# Read the data file
a <- read.csv('sheardata.csv')  # this is a data.frame
shear <- a$shear.tsf
boxplot(shear,xlab='Soil Shear',ylab='Shear Stress (tsf)')
boxplot(shear,xlab='Soil Shear',ylab='Shear Stress (tsf)',
        outline=F,notch=T)

vioplot(shear,names='Shear Stress',ylab='Shear Stress (tsf)')
grid()
title('Violin Plot of Shear Stress (tsf)',cex.main=0.7)
