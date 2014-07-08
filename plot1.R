# a script readDataForPlot.R contains function 'readDataForPlot' that reads 
# and returns data.frame from household_power_consumption.txt
#
# the result data.frame contains rows for dates: 2007-02-01 and 2007-02-02 only
#
# see 'readDataForPlot.R' for details of implementation
source('readDataForPlot.R')

df <- readDataForPlot()

png("plot1.png", width = 480, height = 480)

hist(df$Global_active_power, col="red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()
