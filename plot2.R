library(data.table)
data <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")
data_selected <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]
data_final <- data_selected[complete.cases(data_selected), ]
png(filename = "plot2.png", width = 480, height = 480, units = "px")
datetime <- strptime(paste(data_final$Date, data_final$Time), format="%d/%m/%Y %H:%M:%S")
plot(datetime, data_final$Global_active_power, xlab = "",ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()