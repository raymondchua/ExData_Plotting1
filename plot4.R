##plot 4

dataset<-read.table("household_power_consumption.txt", head=TRUE, sep=";")
dataset$datetime <- strptime(paste(dataset$Date, dataset$Time), format="%d/%m/%Y %H:%M:%S")
dataset[,1] <- as.Date(dataset$Date, "%d/%m/%Y")
temp <- subset(dataset, as.Date(Date) >= '2007-02-01' & as.Date(Date) <= '2007-02-02')
temp[,3] <- as.character(temp[,3]) #convert from integer to character
temp[,3] <- as.numeric(temp[,3]) #convert to decimals
temp[,4] <- as.character(temp[,4]) #convert from integer to character
temp[,4] <- as.numeric(temp[,4]) #convert to decimals
temp[,5] <- as.character(temp[,5])
temp[,5] <- as.numeric(temp[,5])
temp[,7] <- as.character(temp[,7])
temp[,7] <- as.numeric(temp[,7])
temp[,8] <- as.character(temp[,8])
temp[,8] <- as.numeric(temp[,8])
temp[,9] <- as.character(temp[,9])
temp[,9] <- as.numeric(temp[,9])

png(filename="plot4.png", width=480, height=480)
par(mfrow = c(2,2))

plot(temp$datetime, temp$Global_active_power, type="l", xlab = "",ylab = "Global Active Power")
plot(temp$datetime, temp$Voltage, type="l", xlab = "datetime",ylab = "Voltage")
plot(temp$datetime, temp$Sub_metering_1, type="l", xlab = "",ylab = "",axes=FALSE, col = "black", ylim=c(0,38))
axis(2,ylim=c(0,38), col="black")
mtext("Energy sub metering",side=2, line=2.5)
box()
par(new=TRUE)
plot(temp$datetime, temp$Sub_metering_2, type="l", xlab = "",ylab = "",axes=FALSE, col = "red", ylim=c(0,38))
par(new=TRUE)
plot(temp$datetime, temp$Sub_metering_3, type="l", xlab = "",ylab = "", col = "blue", ylim=c(0,38))
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(temp$datetime, temp$Global_reactive_power, type="l", xlab = "datetime",ylab = "Global_reactive_power", ylim=c(0.0,0.5))
dev.off()