# Cleaning up AQ data for Aldine Houston Site CAMS 8
# Venki Uddameri 01/30/2021

# Load Libraries
library(zoo)
library(imputeTS)

# Set working Directory
setwd('/home/vuddameri/CE5315-New/Datasets/HoustonAQ')

# Read CSV file and remove externeous variables
a <- read.csv("newAldineAQb.csv",skip=10,header=T)
nrow(a)
b <- read.csv("NewParms.csv")
a <- a[,-c(1:5,7:11,17:18)]

# Create a 
datex <- paste(a$Year,a$Month,a$Day,sep="-")
datex <- as.Date(datex)
timex <- paste(a$Time,sep="")
timex <- paste(timex,"00",sep=":")
datez <- paste(datex,timex,sep= " ")
a.all <- data.frame(a,datez)

# Merge AQI names with the data
b1 <- b[,1:2]
a.all <- merge(a.all,b1,by.x="Parameter.Cd",by.y="AQCOde")

# Create a timeseries
bgn <- "2017-01-01 00:00:00"
bgn <- as.POSIXlt(bgn)
end <- "2019-12-31 23:00:00"
end <- as.POSIXlt(end)
tottime <- seq.POSIXt(bgn,end,by="hours")
dum.ts <- zoo(,tottime) # Dummy TS

# Loop through each variable and create a ts for entire records
# NAs will be added when there is no data
# Does not check for data
naml <- c()
for(i in seq(1,nrow(b),1))
{
  parm <- b$Parameter[i]
  nam <- as.character(parm)
  namx <- paste(nam,"ts",sep=".")
  naml[i] <- namx
  var <- subset(a.all,Parameter == nam,
                select=c("datez","Value"))
  datezx <- as.POSIXct(var$datez)
  var <- data.frame(var,datezx)
  var = var[!duplicated(var$datezx),]
  dumts <- zoo(var$Value,var$datezx)
  dumtsa <- merge(dum.ts,dumts)
  assign(namx,dumtsa)
}

# Write data into a data.frame
zz <- data.frame(tottime,NOX.ts,OZONE.ts,PM25.ts,BARO.ts,
                 RELH.ts,DEWPT.ts, 
                  TEMP.ts,SRAD.ts,WSPEED.ts,WDIR.ts)
# Write the raw data 
write.csv(zz,'HoustonAQI.csv',row.names=F)
summary(zz)

# Replace negative values with NA
zz[zz < 0] <- NA
summary(zz)

# Remove PM25 Data due to too few values
# Time is also removed for imputation

zza <- zz[,-c(1,4)]
# Impute using na.approx
zza.imp <- apply(zza,2,na.approx)

# Add time and write to a new file
zza.imp <- data.frame(tottime,zza.imp)
write.csv(zza.imp,'HoustonAQIinp.csv',row.names=F)







