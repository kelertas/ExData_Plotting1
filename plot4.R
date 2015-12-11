library(data.table)
data <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")
data_selected <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]
data_final <- data_selected[complete.cases(data_selected), ]
png(filename = "plot4.png", width = 480, height = 480, units = "px")
datetime <- strptime(paste(data_final$Date, data_final$Time), format="%d/%m/%Y %H:%M:%S")
par(mfrow = c(2,2))
plot(datetime, data_final$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
plot(datetime, data_final$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(datetime, data_final$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
lines(datetime, data_final$Sub_metering_2, col = "red")
lines(datetime, data_final$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = "solid")
plot(datetime, data_final$Global_reactive_power, type = "l", ylab = "Global Reactive Power", xlab = "datetime")
dev.off()