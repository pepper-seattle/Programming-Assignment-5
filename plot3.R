with(epc_subset, plot(DateTime, Sub_metering_1, type="l", col = "black", ylab="Energy sub metering"))
with(epc_subset, lines(DateTime, Sub_metering_2, col = "red"))
with(epc_subset, lines(DateTime, Sub_metering_3, col = "blue"))

legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))