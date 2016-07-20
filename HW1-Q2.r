setwd("C:/Users/SalaizG/Downloads/Personal/Coursera/Data Science Specialization/Exploratory Analysis/")

household_power_consumption <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?")
household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")

PowerData <- subset(household_power_consumption, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")  )

PowerData$newdate <- with(PowerData, as.POSIXct(paste(Date, Time)))

png(file="./plot2.png",width=480,height=480)

plot(PowerData$newdate , PowerData$Global_active_power, type = "l", ylim=c(0, 8),  xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
