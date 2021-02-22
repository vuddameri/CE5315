#Script to compute Probabilities
# Venki Uddameri
# Step 1: Load Working Directory
setwd('/home/vuddameri/CE5315-New/Rcode')
# Step 2: Read Data
a <- read.csv('stormevent.csv')
#Step 3: Extract Peak Values
Qp <- a$Peak

#Step 4: Discretize data
maxp <- max(Qp) + 2500 #create a max value
breaks <- c(0,20,400,2500,maxp)
labels <- c('Very Safe','Safe','Alert','High Alert')
Qp.levels <- cut(Qp,breaks=breaks,labels=labels,
                 right = FALSE)

# Step 5: Tabulate and Obtain Probabilities
counts <- table(Qp.levels)
probs <- counts/length(Qp.levels)
print(counts)
print(probs)
# Step 6: Plot the probabilities
par(mgp=c(2.5,1,0))
barplot(probs,names.arg=labels,las=2,ylab='Probability')
box()
title('Probability of Different Flood Categories')