# read the data

fulldata<- read.table("~/DataScience/Allfiles/household_power_consumption.txt",sep=";",stringsAsFactors = F, header = T,na.strings = "?")

# get the required data for 2 days
subdata<- fulldata[which(fulldata$Date=="1/2/2007" | fulldata$Date=="2/2/2007"),]

# Convert the date and time character to date and time class
date_time<- paste(subdata$Date, subdata$Time)
date_time<- strptime(date_time, "%d/%m/%Y %H:%M:%S")

# Plot the graph
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

with(subdata,{
  plot(date_time, Global_active_power, type="l", xlab="", ylab="Global Active Power")
  plot(date_time, Voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(date_time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(datetime, Sub_metering_2, type="l", col="red")
  lines(datetime, Sub_metering_3, type="l", col="blue")
  legend("topright",lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty="n")
  plot(date_time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
})

dev.off()