data<-read.table("C:\\Users\\Maria\\Documents\\Household\\household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

Interval <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
head(Interval)

datetime <- strptime(paste(Interval$Date, Interval$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data$Datetime <- datetime


png("plot3.png", width=480, height=480)
plot(Interval$Datetime, as.numeric(Interval$Sub_metering_1), ylab="Energy sub metering", type="l")lines(Interval$Datetime, as.numeric(Interval$Sub_metering_2), type="l", col="red")
lines(Interval$Datetime, as.numeric(Interval$Sub_metering_3), type="l", col="red")
lines(Interval$Datetime, as.numeric(Interval$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
