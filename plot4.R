# a script readDataForPlot.R contains function 'readDataForPlot' that reads 
# and returns data.frame from household_power_consumption.txt
#
# the result data.frame contains rows for dates: 2007-02-01 and 2007-02-02 only
#
# see 'readDataForPlot.R' for details of implementation
source('readDataForPlot.R')

df <- readDataForPlot()

png("plot4.png", width = 480, height = 480)

par(mfcol = c(2,2))

plot(df$DateTime, df$Global_active_power, 
     type = "l", xlab = "", ylab = "Global Active Power")

plot(df$DateTime, df$Sub_metering_1,
     type = "l", xlab = "", ylab = "Enery sub metering", col = "black")

lines(df$DateTime, df$Sub_metering_2, col = "red")
lines(df$DateTime, df$Sub_metering_3, col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = 1, lty = 1, col = c("black", "red", "blue"), bty = "n")

plot(df$DateTime, df$Voltage, 
     type = "l", xlab = "datetime", ylab = "Voltage")


plot(df$DateTime, df$Global_reactive_power, 
     type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
