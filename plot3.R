#Read in Data

epcdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")


#Convert date to date format

library(lubridate)
epcdata$Date <- dmy(epcdata$Date)


#Limit to certain dates

epc_subset <- rbind(epcdata[epcdata$Date=="2007/02/01",],epcdata[epcdata$Date=="2007/02/02",])

#Create Date Time field

epc_subset <- cbind(epc_subset, "DateTime" = as.POSIXct(paste(epc_subset$Date, epc_subset$Time)))

#plot 3
with(epc_subset, plot(DateTime, Sub_metering_1, type="l", col = "black", ylab="Energy sub metering"))
with(epc_subset, lines(DateTime, Sub_metering_2, col = "red"))
with(epc_subset, lines(DateTime, Sub_metering_3, col = "blue"))

legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))