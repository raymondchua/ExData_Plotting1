#plot 1

dataset<-read.table("household_power_consumption.txt", head=TRUE, sep=";")
dataset[,1] <- as.Date(dataset$Date, "%d/%m/%Y")
temp <- subset(dataset, as.Date(Date) >= '2007-02-01' & as.Date(Date) <= '2007-02-02') #take only the rows needed
temp$Global_active_power <- as.numeric(temp$Global_active_power)
png(filename="plot1.png", width=480, height=480)
hist(temp$Global_active_power, main = "Global Active Power", col = "red" ,xlab = "Global Active Power(kilowatts)")
dev.off()