library(data.table)
data <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")
data_selected <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]
data_final <- data_selected[complete.cases(data_selected), ]
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data_final$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()