setwd("C:/Users/SalaizG/Downloads/Personal/Coursera/Data Science Specialization/Exploratory Analysis/")

household_power_consumption <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?")
household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")

PowerData <- subset(household_power_consumption, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")  )

png(file="./plot1.png",width=480,height=480)
hist(PowerData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
dev.off()
