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

## Generating Plot 2
png(file = 'plot2.png', width = 480, height = 480)
with(power_dat,plot(Global_active_power ~ Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()
