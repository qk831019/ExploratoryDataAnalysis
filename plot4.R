## The dataset has 2,075,259 rows and 9 columns.

setwd("C:/Users/Mark/Desktop/Kaggle/exp")

data <- read.csv("data.txt", header=T, sep=';',na.strings="?")

## We will only be using data from the dates 2007-02-01 and 2007-02-02

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data1 = data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]


## Converting dates
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)


## plot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data1, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})


## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()