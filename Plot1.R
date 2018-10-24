library(dplyr)
library(lubridate)
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

# plot 1 - histogram (red), x=Global_active_power, y=frequency

png(filename = "Plot 1.png")
hist(elec_f$Global_active_power,main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red",ylim=c(0,1200))
dev.off()
