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
png("plot2.png", width=480, height=480)
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()