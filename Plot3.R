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

# Plot 3 - with sub meter reading columns

png(filename= "Plot3.png", width = 480, height= 480)
plot(Sub_metering_1~Time, data=elec_f,type="l",ylab="Energy sub metering",xlab="")
lines(elec_f$Time,elec_f$Sub_metering_2,col="red")
lines(elec_f$Time,elec_f$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty=c(1,1,1))
dev.off()