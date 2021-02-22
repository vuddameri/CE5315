# Script to plot histogram and obtain densities
# Written by Venki Uddameri, Ph.D., P.E.


# Set Working Directory
setwd('D:\\Dropbox\\CE5331-Probabilistic Methods- Fall2019')

# Read data
a <- read.csv('soilmoisturedata.csv')

# Extract Junction data from the dataset
JSM <- a$Junction..mm
summary(JSM)
JSM <- JSM/1600  # Divide by 1600 cm (soil column length)

# Plot the histogra with freq-False to get density
sm.hist <- hist(JSM,freq=FALSE,xlab='Soil Moisture (dim)',main='Soil Moisture @ Junction, TX')
box()
grid()

# Extract bin width and densities
sm.bin <- sm.hist$breaks  # Breakpoints
sm.den <- sm.hist$density # Density
sm.mids <- sm.hist$mids   # Midpoints
sm.lag <- diff(sm.bin,1)  # Compute the bin width
sm.prob <- sm.lag*sm.den  # Compute probabilities
sum(sm.prob) # check to see if the sum of probabilities = 1
barplot(sm.prob,ylab='Probability',names.arg=sm.mids,xlab='Soil Moisture (dim)')
box()
grid()
title('Probability Values for Soil Moisture @ Junction Texas')