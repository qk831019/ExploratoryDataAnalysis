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
plot(data1$Sub_metering_1~data1$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
lines(data1$Sub_metering_2~data1$Datetime,col='Red')
lines(data1$Sub_metering_3~data1$Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()