# read the data

fulldata<- read.table("~/DataScience/Allfiles/household_power_consumption.txt",sep=";",stringsAsFactors = F, header = T,na.strings = "?")

# get the required data for 2 days
subdata<- fulldata[which(fulldata$Date=="1/2/2007" | fulldata$Date=="2/2/2007"),]

# Convert the date and time character to date and time class
date_time<- paste(subdata$Date, subdata$Time)
date_time<- strptime(date_time, "%d/%m/%Y %H:%M:%S")

# Plot the graph
png("plot1.png", width=480, height=480)
hist(subdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()