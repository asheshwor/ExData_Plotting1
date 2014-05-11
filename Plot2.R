##Exploratory Data Analysis course project 1
## Date: 2014-05-11

#* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
#*     Read and prepare data
#* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
eldata <- "Expdata/household_power_consumption.txt"
eltab <- read.table(eldata, header=TRUE, sep=";", na.strings = c("?"), stringsAsFactors=FALSE)
## Convert Date column to date format
eltab$Date <- (as.Date(eltab$Date, "%d/%m/%Y"))
## Filter data from  2007-02-01 and 2007-02-02 only
eltab <- eltab[(eltab$Date == as.Date("2007-02-01")) | (eltab$Date == as.Date("2007-02-02")),]
## Convert time to date-time format
eltab$Time2 <- strptime(paste(eltab$Date, eltab$Time), "%Y-%m-%d %H:%M:%S", )

#* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
#*     Generate plot 2
#* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
png(file="Plot2.png", 480, 480) #open png device
with(eltab, plot(Time2, Global_active_power, type="n",
                 xlab="", ylab="Global Active Power (kilowatts)"))
with(eltab, lines(Time2, Global_active_power))
dev.off() #close png device