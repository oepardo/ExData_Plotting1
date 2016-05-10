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

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", xlab="", ylab="Energy Submetering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()