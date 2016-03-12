# plot1

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(strptime(data$Date, format="%d/%m/%Y", tz="UTC"))

sdate <- as.Date(strptime("01/02/2007", format="%d/%m/%Y", tz="UTC"))
edate <- as.Date(strptime("02/02/2007", format="%d/%m/%Y", tz="UTC"))

mydata1 <- data[((data$Date <= edate) & (data$Date >= sdate)),]
mydata1$Global_active_power <- as.numeric(as.character( mydata1$Global_active_power))

# plotting in png device
png(filename="plot1.png", width = 480, height = 480)
hist(mydata1$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)" )
dev.off()
