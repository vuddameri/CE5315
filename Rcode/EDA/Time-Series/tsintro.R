setwd('/home/vuddameri/CE5315-New/Rcode/EDA/Time-Series')
library(lubridate)
# Using lubridate to convert string to timeseries
datex <- "02/2021"
datex <- my(datex)

datex <- "02-11-2021"
typeof(datex)
datex <- mdy(datex)
typeof(datey)

datex <- 197006301833
datex <- ymd_hm(datex)
datex
typeof(datex)

datex <- "02-05-2020 23:12:59"
datex <- mdy_hms(datex)

# Creating date sequences
begin <- ymd_h('2020010100')
end <- ymd_h('2020123123')
timex <- seq(begin,end,by='hour')
head(timex)

# Standard date format YYYY-mm-dd
# Just adds 01 for day in case of month
bgn <- as.Date("2020-01-01")
bgn
end <- as.Date("12/31/2020",format="%m/%d/%Y")
end
timed <- seq.Date(bgn,end,'day')
head(timed)
timem <- seq.Date(bgn,end,'month')
timem
# Make plots
par(mfrow=c(3,1))  # line up plots
# create time-series objects
val <- runif(366,1,20) #create some random data
begin <- ymd(20200101) # create posicx object
end <- ymd(20201231)
dates <- seq(begin,end,'day')
#ts object in base R
val.ts <- ts(val,start=begin,end=end)
#zoo time series object
library(zoo)
val.zoo <- zoo(val,dates)
plot(val.zoo)
library(xts)
val.xts <- xts(val,order.by=dates)

png('tsplots.png',res=450,width=6, height=9,
    units='in')
par(mfrow=c(3,1))
plot(val.ts)
title('TS object',cex.main=0.65)
plot(val.zoo)
title('ZOO Object',cex.main=0.65)
plot.xts(val.xts,ylab='val.xts',
         ylim=c(-5,25),lty=2,
         candles=T)
title('XTS Object',cex.main=0.65)
dev.off()






