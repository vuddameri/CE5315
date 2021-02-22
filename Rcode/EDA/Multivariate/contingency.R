# Visualization of Contingency tables
# Venki Uddameri
# Jan 30, 2021

# Install vcd package if necessary
#install.packages("vcd")
# Step 1: Load library
library(vcd)

#Step 2: Set Working directory
setwd('/home/vuddameri/CE5315-New/RBootcamp/EDA')

# Step 3: Read in contingency table
a <- read.csv('transcts.csv')
head(a)

# Step 4: Convert data to matrix and label
a.mat <- as.matrix(a[,2:6])
names(dimnames(a.mat)) = c("H08", "H09")
rownames(a.mat) <- c("A","B","C","D","E")
colnames(a.mat) <- c("A","B","C","D","E")

#Step 5 Visualize using Contingency Table
mosaic(a.mat,legend=T,color = T)
