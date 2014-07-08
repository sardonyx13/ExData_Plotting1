
source('readDataForPlot.R')

df <- readDataForPlot()

png("plot1.png", width = 480, height = 480)

hist(df$Global_active_power, col="red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()