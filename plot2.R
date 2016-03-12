# plot2

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(strptime(data$Date, format="%d/%m/%Y", tz="UTC"))

sdate <- as.Date(strptime("01/02/2007", format="%d/%m/%Y", tz="UTC"))
edate <- as.Date(strptime("02/02/2007", format="%d/%m/%Y", tz="UTC"))


mydata1 <- data[((data$Date <= edate) & (data$Date >= sdate)),]
mydata1$datetime = paste(mydata1$Date, mydata1$Time, sep = " ")
mydata1$datetime = as.POSIXct(mydata1$datetime)
mydata1$Global_active_power <- as.numeric(as.character( mydata1$Global_active_power))


# plotting in png device
png(filename="plot2.png", width = 480, height = 480)
plot(mydata1$Global_active_power ~ mydata1$datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
