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
elec_f$Global_reactive_power <- as.numeric(levels(elec_f$Global_reactive_power))[elec_f$Global_reactive_power]
elec_f$Voltage <- as.numeric(levels(elec_f$Voltage))[elec_f$Voltage]
elec_f$Global_intensity <- as.numeric(levels(elec_f$Global_intensity))[elec_f$Global_intensity]



#Plot 4: 2 by 2 mini plots

png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(elec_f,plot(Time,Global_active_power,type="l",ylab="Global Active Power", xlab=""))
with(elec_f,plot(Time,Voltage,type="l",ylab="Voltage", xlab="datetime"))
plot(Sub_metering_1~Time, data=elec_f,type="l",ylab="Energy sub metering",xlab="")
lines(elec_f$Time,elec_f$Sub_metering_2,col="red")
lines(elec_f$Time,elec_f$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty=c(1,1,1))
with(elec_f,plot(Time,Global_reactive_power,type="l",ylab="Global_reactive_power", xlab="datetime"))
dev.off()
