# Script to plot pdf figures shown in Lecture 2 PPT

# Get a set of values
x <- seq(-5,5,0.001)

# Compute the PDF and CDF using standard normal distribution
Density <- dnorm(x,0,1)
Probability <- pnorm(x,0,1)

# Plot PDF
plot(x,Density)
grid()
title('Probability Density Function')

# Plot CDF
plot(x,Probability)
grid()
title('Cumulative Distribution Function')

# Add vertical lines corresponding to +/-1.96
abline(v=1.96,col='red',lty=2,lwd=2)
abline(v=-1.96,col='red',lty=2,lwd=2)

# Integrate using built in integrate function
P02 <- integrate(dnorm,-1.96,1.96,0,1)

# Plot for PMF

rd <- c(0,1,2,3,4,5,6,7) # No of possible rainy days
pr <- c(0.5,0.28,0.12,0.05,0.025,0.013,0.009,0.003) # probabilities

# Make a barplot (will be the same as histogram)
xx <- barplot(pr,names.arg=rd,xlab='Days of Rainfall in a Week',
ylab='Probability',ylim=c(0,0.6))
box()
grid()
text(x =xx, y = pr, label = pr, pos = 3, cex = 0.8, col = "red")
title('Probability of Number of Rainy Days in a Week')