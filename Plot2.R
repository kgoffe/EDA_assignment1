
require(dplyr)
require(lubridate)
#setwd("~/Coursera/EDA_assignment1/data")
elec <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
# Convert Date & Time using lubridate library
elec$Date <- dmy(as.character(elec$Date))

# factor to relevant class type
elec_f <- elec %>% filter(Date >= "2007-02-01" & Date< "2007-02-03")
elec_f$Global_active_power <- as.numeric(levels(elec_f$Global_active_power))[elec_f$Global_active_power]
elec_f$Sub_metering_1 <- as.numeric(levels(elec_f$Sub_metering_1))[elec_f$Sub_metering_1]
elec_f$Sub_metering_2 <- as.numeric(levels(elec_f$Sub_metering_2))[elec_f$Sub_metering_2]
elec_f$Time <- as.POSIXct(paste(elec_f$Date, as.character(elec_f$Time)))


# Plot 2 - convert time to Day (in x-axis)
png(filename = "Plot2.png", width=480, height = 480)
with(elec_f,plot(Time,Global_active_power,type="l",ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()