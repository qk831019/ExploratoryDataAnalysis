## The dataset has 2,075,259 rows and 9 columns.

setwd("C:/Users/Mark/Desktop/Kaggle/exp")

data <- read.csv("data.txt", header=T, sep=';',na.strings="?")

## We will only be using data from the dates 2007-02-01 and 2007-02-02

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data1 = data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]


## Converting dates
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)


## histogram

plot(data1$Global_active_power~data1$Datetime, type="l",ylab="Global Active Power (kilowatts)",xlab="")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()