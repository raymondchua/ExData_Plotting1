dataset<-read.table("household_power_consumption.txt", head=TRUE, sep=";")
dataset[,1] <- as.Date(dataset$Date, "%d/%m/%Y")
temp <- subset(dataset, as.Date(Date) >= '2007-02-01' & as.Date(Date) <= '2007-02-02') #take only the rows needed
temp[,3] <- as.character(temp[,3]) #convert from integer to character
temp[,3] <- as.numeric(temp[,3]) #convert to decimals
png(filename="plot1.png", width=480, height=480)
hist(temp$Global_active_power, main = "Global Active Power", col = "red" ,xlab = "Global Active Power(kilowatts)")
dev.off()