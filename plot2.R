dataset<-read.table("household_power_consumption.txt", head=TRUE, sep=";")
dataset$datetime <- strptime(paste(dataset$Date, dataset$Time), format="%d/%m/%Y %H:%M:%S")
dataset[,1] <- as.Date(dataset$Date, "%d/%m/%Y")
temp <- subset(dataset, as.Date(Date) >= '2007-02-01' & as.Date(Date) <= '2007-02-02') #take only the rows needed
temp[,3] <- as.character(temp[,3]) #convert from integer to character
temp[,3] <- as.numeric(temp[,3]) #convert to decimals
plot(temp$datetime, temp$Global_active_power, type="l", xlab = "",ylab = "Global Active Power(kilowatts)")