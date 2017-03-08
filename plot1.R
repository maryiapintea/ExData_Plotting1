data<-read.table("C:\\Users\\Maria\\Documents\\Household\\household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

Interval <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
head(Interval)

datetime <- strptime(paste(Interval$Date, Interval$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data$Datetime <- datetime


GlobalActivePower <- as.numeric(Interval$Global_active_power)

png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power", ylab="Frequency")
dev.off()
