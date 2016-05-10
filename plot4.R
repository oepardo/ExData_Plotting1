household<-read.csv("C:/Users/OEP/Dropbox/Surface/Coursera/R/Working Directory/household_power_consumption.txt")
colnames(household)

splitnames<-strsplit(names(household),"\\.")


library(tidyr)
householddf<-data.frame(household)
colnames(householddf)="tmp"
sepdf<-separate(data = householddf, col = tmp, into = splitnames[[1]], sep = "\\;")
colnames(householddf)=splitnames

subdf <- sepdf[sepdf$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(subdf$Date, subdf$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(subdf$Global_active_power)
subMetering1 <- as.numeric(subdf$Sub_metering_1)
subMetering2 <- as.numeric(subdf$Sub_metering_2)
subMetering3 <- as.numeric(subdf$Sub_metering_3)
GRP <- as.numeric(subdf$Global_reactive_power)
Voltage <- as.numeric(subdf$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power")
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"),bty = "n")
plot(datetime, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()