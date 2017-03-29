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

## Generating Plot 3
png(file = 'plot3.png', width = 480, height = 480)
with(power_dat, {
    plot(Sub_metering_1 ~ Datetime, type = "l", 
         ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(Sub_metering_2 ~ Datetime, col = 'Red')
    lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()