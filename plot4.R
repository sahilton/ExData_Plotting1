library(readr)
elect <-read.csv("household_power_consumption.txt",header=TRUE, sep=";",na.strings="?",stringsAsFactors=TRUE)

#filter to two dates that we want to keep
elect$Date <- as.Date(elect$Date,"%d/%m/%Y")
elect_sml <- subset(elect,elect$Date >= "2007-02-01" & elect$Date <= "2007-02-02")

#create continuous date variable with date and time in correct format
elect_sml$Date <- paste(elect_sml$Date,elect_sml$Time,sep=" ")
elect_sml$datetime <-strptime(elect_sml$Date, "%Y-%m-%d %H:%M:%S")

attach(elect_sml)
png("plot4.png")
par(mfrow=c(2,2),mar = c(4, 4, 2, 1))
plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

plot(datetime,Voltage,type="l")

plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(datetime,Sub_metering_2,col="red")
lines(datetime,Sub_metering_3,col="blue")
legend(x="topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"),lty=1,bty="n")

plot(datetime,Global_reactive_power,type="l")
dev.off()