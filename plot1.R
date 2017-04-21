#Read in Data

epcdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")


#Convert date to date format

library(lubridate)
epcdata$Date <- dmy(epcdata$Date)


#Limit to certain dates

epc_subset <- rbind(epcdata[epcdata$Date=="2007/02/01",],epcdata[epcdata$Date=="2007/02/02",])

#Create Date Time field

epc_subset <- cbind(epc_subset, "DateTime" = as.POSIXct(paste(epc_subset$Date, epc_subset$Time)))

#plot 1
hist(as.numeric(epc_subset$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")