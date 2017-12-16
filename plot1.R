library(readr)
elect <-read.csv("household_power_consumption.txt",header=TRUE, sep=";",na.strings="?",stringsAsFactors=TRUE)

#filter to two dates that we want to keep
elect$Date <- as.Date(elect$Date,"%d/%m/%Y")
elect_sml <- subset(elect,elect$Date >= "2007-02-01" & elect$Date <= "2007-02-02")

#create continuous date variable with date and time in correct format
elect_sml$Date <- paste(elect_sml$Date,elect_sml$Time,sep=" ")
elect_sml$datetime <-strptime(elect_sml$Date, "%Y-%m-%d %H:%M:%S")

attach(elect_sml)
png("plot1.png")
hist(Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()