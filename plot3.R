# read the data

fulldata<- read.table("~/DataScience/Allfiles/household_power_consumption.txt",sep=";",stringsAsFactors = F, header = T,na.strings = "?")

# get the required data for 2 days
subdata<- fulldata[which(fulldata$Date=="1/2/2007" | fulldata$Date=="2/2/2007"),]

# Convert the date and time character to date and time class
date_time<- paste(subdata$Date, subdata$Time)
date_time<- strptime(date_time, "%d/%m/%Y %H:%M:%S")

# Plot the graph
png("plot3.png", width=480, height=480)
plot(date_time, subdata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subdata$Sub_metering_2, type="l", col="red")
lines(datetime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright",lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()