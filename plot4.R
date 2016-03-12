# plot4

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(strptime(data$Date, format="%d/%m/%Y", tz="UTC"))

sdate <- as.Date(strptime("01/02/2007", format="%d/%m/%Y", tz="UTC"))
edate <- as.Date(strptime("02/02/2007", format="%d/%m/%Y", tz="UTC"))


mydata1 <- data[((data$Date <= edate) & (data$Date >= sdate)),]
mydata1$datetime = paste(mydata1$Date, mydata1$Time, sep = " ")
mydata1$datetime = as.POSIXct(mydata1$datetime)


mydata1$Global_active_power <- as.numeric(as.character( mydata1$Global_active_power))

mydata1$Sub_metering_1 <- as.numeric(as.character( mydata1$Sub_metering_1))
mydata1$Sub_metering_2 <- as.numeric(as.character( mydata1$Sub_metering_2))
mydata1$Sub_metering_3 <- as.numeric(as.character( mydata1$Sub_metering_3))

mydata1$Voltage <- as.numeric(as.character( mydata1$Voltage))
mydata1$Global_reactive_power <- as.numeric(as.character( mydata1$Global_reactive_power))

png(filename="plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(2,0,2,0))
plot(mydata1$Global_active_power ~ mydata1$datetime, type="l", xlab="", ylab="Global Active Power")

plot(mydata1$Voltage ~ mydata1$datetime, type="l", xlab="datetime", ylab="Voltage")

plot(mydata1$Sub_metering_1 ~ mydata1$datetime, type="l", xlab="", ylab="Energy sub metering")
lines(mydata1$Sub_metering_2 ~ mydata1$datetime, col="red", type="l")
lines(mydata1$Sub_metering_3 ~ mydata1$datetime, col="blue", type="l")
legend("topright", lty=c(1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), bty="n")

plot(mydata1$Global_reactive_power ~ mydata1$datetime, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()


