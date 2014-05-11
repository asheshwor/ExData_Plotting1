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
#*     Generate plot 4
#* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
png(file="Plot4.png", 480, 480) #open png device
par(mfrow=c(2,2))
#col 1, row1
with(eltab, plot(Time2, Global_active_power, type="n",
                 xlab="", ylab="Global Active Power"))
with(eltab, lines(Time2, Global_active_power))
#col 2, row 1
with(eltab, plot(Time2, Voltage, type="n",
                 xlab="datetime", ylab="Voltage"))
with(eltab, lines(Time2, Voltage))
#col 1, row 2
ally <- c(eltab$Sub_metering_1, eltab$Sub_metering_2, eltab$Sub_metering_3)
ylimit <- c(min(allx, na.rm=TRUE), max(allx, na.rm=TRUE))
with(eltab, plot(Time2, Sub_metering_1, type="n",
                 xlab = "", ylab="Energy sub metering",
                 ylim = ylimit))
with(eltab, lines(Time2, Sub_metering_1))
with(eltab, lines(Time2, Sub_metering_2, col="red"))
with(eltab, lines(Time2, Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"),
       legend=c("Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"), bty="n")
#col 2, row 2
with(eltab, plot(Time2, Global_reactive_power, type="n",
                 xlab="datetime", ylab="Global_reactive_power"))
with(eltab, lines(Time2, Global_reactive_power))
dev.off() #close png device
par(mfrow=c(1,1)) #reset par seeting