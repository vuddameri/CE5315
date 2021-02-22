#Script to compute Probabilities
# Venki Uddameri
# Step 1: Load Working Directory
setwd('/home/vuddameri/CE5315-New/Rcode')

# Read Data
a <- read.csv('stormevent.csv')

# extract data
Qp <- a$Peak
Dur <- a$Duration

#Cut the peaks 
maxp <- max(Qp) + 2500 #create a max value
breaks <- c(0,20,400,2500,maxp)
labels <- c('Very Safe','Safe','Alert','High Alert')
Qp.levels <- cut(Qp,breaks=breaks,labels=labels,
                 right = FALSE)

# Cut the durations
maxd <- max(Dur) + 50
breaks <- c(0,15,25,35,maxd)
labels <- c('Short','Normal','High','Very High')
Dur.levels <- cut(Dur,breaks=breaks,labels=labels,
                  right = FALSE)

# Tabulate Marginals
Qp.tab <- table(Qp.levels)
Dur.tab <- table(Dur.levels)

# Tabulate the Joint
Qpdur.tab <- table(Qp.levels,Dur.levels)

# Obtain marginal and Joint probabilities
N <- nrow(a)  # total experiments
Qp.prb <- Qp.tab/N
Dur.prb <- Dur.tab/N
Qpdur.prb <- Qpdur.tab/N

# compile count and Rel. Frequency data
count.dat <- list(Qp.tab,Dur.tab,Qpdur.tab)
prob.dat <- list(Qp.prb,Dur.prb,Qpdur.prb)

# Write data
sink("count.txt")
print('Count Output')
print(count.dat)
print("Probability Results")
print(prob.dat)
sink()

Qpdur.tab
# Compute conditional Probabilities
PhagvnVH <- Qpdur[4,4]/sum(Qpdur[,4])
PhagvnVH
PhagvnSD <- Qpdur.prb[4,1]/Dur.prb[1]
PhagvnSD

# Compute total probabilities
# Compute Conditional Probs
DurgvnQp <- c() # initialize a vector
Nst <- nrow(Qpdur.prb)
for(i in seq(1,Nst,1))
{
  DurgvnQp[i] <- Qpdur.prb[i,2]/sum(Qpdur.prb[i,])
}

# Compute total Prob
PdurN <- sum(DurgvnQp * Qp.prb)
PdurN



