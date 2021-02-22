# Script to compute summary statistics
# Venki Uddameri, Ph.D., P.E.

# load necessary libraries
library(e1071)
library(skimr)
# Set working Directory
dir <- '/home/vuddameri/CE5315-New/Rcode/EDA/Univariate'
setwd(dir)

# Read the data file
a <- read.csv('sheardata.csv')  # this is a data.frame

# See the first few values in the data frame to make sure
# Everything came in correctly
head(a)

# store the shear data in a separate variable
shear <- a$shear.tsf
head(shear)  # this is a vector

# Compute parametric summary
shear.mean <- mean(shear)
shear.sd <- sd(shear)
shear.cv <- shear.sd/shear.mean
shear.sk <- skewness(shear)  # needs library e1071 loaded

#Bind the data and write to the computer console
shear.par <- c(shear.mean,shear.sd,shear.cv,shear.sk)
names(shear.par) <- c('Mean','Std. Dev','Coeff Var','Skewness')
round(shear.par,3)

# Compute nonparametric summary
shear.med <- median(shear)
shear.iqr <- IQR(shear)
shear.Q1 <- quantile(shear,0.25) # 25th percentile is 1st quartile
shear.Q2 <- quantile(shear,0.5)  # 50th percentile is 2nd quartile
shear.Q3 <- quantile(shear,0.75) # 75th percentile is 3rd quartile

# Write the output to the console
shear.npar <- c(shear.med,shear.iqr,shear.Q1,shear.Q2, shear.Q3)
names(shear.npar) <- c('Median','IQR','Q1','Q2','Q3')
round(shear.npar,3)
round(shear.npar,3)

# R can also be used compute mean and 5 point summary in one command
shear.sum <- summary(shear) # Provides a 5 point summary
shear.sum # will write this to the console
shear.fp <- fivenum(shear) # min-max, 3 quantiles
shear.fp

# Use skim function from skimr
shear.skm <- skim(shear)
shear.skm

# Sink the output into a file
sink('shearskim.txt')
skim(shear) 
sink()

