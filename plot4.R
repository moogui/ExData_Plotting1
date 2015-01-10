download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="HH.zip")
unzip("HH.zip")
hh <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
hh1 <- subset(hh, hh$Date=="1/2/2007")
hh2 <- subset(hh, hh$Date=="2/2/2007")
data <- rbind(hh1,hh2)
data$Date_Time<-paste(as.Date(data$Date, format="%d/%m/%Y"),data$Time)
data$Date_Time<-as.POSIXct(data$Date_Time)
par(mfrow=c(2,2))
plot(data$Global_active_power ~ data$Date_Time, type="l",
     xlab="", ylab="Global Active Power(kilowatts)")
plot(data$Voltage ~ data$Date_Time, type="l",
     xlab="datetime", ylab="Voltage")
plot(data$Date_Time, data$Sub_metering_1, type="l",
     xlab="",ylab= "Energy sub metering")
lines(data$Date_Time, data$Sub_metering_2, type="l", col="red")
lines(data$Date_Time, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1,cex=0.7, bty="n", col=c("black", "red", "blue"))
plot(data$Global_reactive_power ~ data$Date_Time, type="l",
     xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file = "plot4.png", width=480, height=480, units="px")
dev.off()