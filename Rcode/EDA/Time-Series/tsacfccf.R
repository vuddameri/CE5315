library(lubridate)
setwd('/home/vuddameri/CE5315-New/Rcode/EDA/Time-Series')
a <- read.csv('HoustonAQIinp.csv')

par(mgp=c(2,1,0))
# Create timestamps and timeseries
bgn <-mdy_hm(a$tottime[1])
end <- mdy_hm(a$tottime[length(a$tottime)])
O3.ts <- ts(a$OZONE.ts,start=bgn,end=end)
SRAD.ts <- ts(a$SRAD.ts,start=bgn,end=end)
#plot ACF
acf(O3.ts,lag.max=24,main="")
title("ACF of Ozone")
grid()

# create CCF Plot
ccf(SRAD.ts,O3.ts,ylab='ccf',lag.max=24, main="")
title('Solar Radiation-Ozone Correlation')

# STL plot
O3.ts <- ts(O3.ts,frequency=24)
stl(O3.ts,s.window= 'periodic')