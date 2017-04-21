#Read in Data

epcdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")


#Convert date to date format

library(lubridate)
epcdata$Date <- dmy(epcdata$Date)


#Limit to certain dates

epc_subset <- rbind(epcdata[epcdata$Date=="2007/02/01",],epcdata[epcdata$Date=="2007/02/02",])

#Create Date Time field

epc_subset <- cbind(epc_subset, "DateTime" = as.POSIXct(paste(epc_subset$Date, epc_subset$Time)))

#plot 2
with(epc_subset, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))