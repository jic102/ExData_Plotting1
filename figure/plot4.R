rm(list = ls())
setwd( "/Users/haicen/Desktop/coursera")
# read dataset into r
fh <- file("household_power_consumption.txt")
power_dat <- read.table(text = grep("^[1,2]/2/2007", readLines(fh), value = TRUE), 
                        col.names = c("Date", "Time", "Global_active_power", 
                                      "Global_reactive_power", "Voltage", 
                                      "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

# check the dimension. 
dim(power_dat)
## Converting dates and times
power_dat$Date <- as.Date(power_dat$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(power_dat$Date), power_dat$Time)
power_dat$Datetime <- as.POSIXct(datetime)

## Generating Plot 4

png(file = 'plot4.png', width = 480, height = 480)

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(power_dat, {
    plot(Global_active_power ~ Datetime, type = "l", 
         ylab = "Global Active Power", xlab = "")
    plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
    plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering",
         xlab = "")
    lines(Sub_metering_2 ~ Datetime, col = 'Red')
    lines(Sub_metering_3 ~ Datetime, col = 'Blue')
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
           bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power ~ Datetime, type = "l", 
         ylab = "Global_rective_power", xlab = "datetime")
})
dev.off()