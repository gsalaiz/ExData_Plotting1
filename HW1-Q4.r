setwd("C:/Users/SalaizG/Downloads/Personal/Coursera/Data Science Specialization/Exploratory Analysis/")

household_power_consumption <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?")
household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")

PowerData <- subset(household_power_consumption, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")  )

PowerData$newdate <- with(PowerData, as.POSIXct(paste(Date, Time)))

png(file="./plot4.png",width=480,height=480)

par(mfrow = c(2, 2))

with (PowerData,{ 
    plot(PowerData$newdate , PowerData$Global_active_power, type = "l", ylim=c(0, 8),  xlab="", ylab="Global Active Power") 
    plot(PowerData$newdate , PowerData$Voltage, type = "l", ylim=c(233, 246),  xlab="", ylab="Voltage") 
    plot(PowerData$newdate , PowerData$Sub_metering_1, type = "l",  xlab="", ylab="Energy Sub Metering")
    
    par(new=T)
    plot(PowerData$Sub_metering_2,type="l", col=2, axes = FALSE, ylim = c(0,12), xlab="", ylab="")
    par(new=T)
    plot(PowerData$Sub_metering_3,type="l", col=4, axes = FALSE, ylim = c(0,40), xlab="", ylab="")
    legend("topright", pch = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(PowerData$newdate , PowerData$Global_reactive_power, type = "l", ylim=c(0, 0.6),  xlab="", ylab="Global Reactive Power")
})

dev.off()
