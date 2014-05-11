##Exploratory Data Analysis course project 1
## Date: 2014-05-11

#* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
#*     Read and prepare data
#* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
eldata <- "C:/Users/a1634565/Dropbox/Napier/PhD/Rcourse/Expdata/household_power_consumption.txt"
eltab <- read.table(eldata, header=TRUE, sep=";", na.strings = c("?"), stringsAsFactors=FALSE)
## Convert Date column to date format
eltab$Date <- (as.Date(eltab$Date, "%d/%m/%Y"))
## Filter data from  2007-02-01 and 2007-02-02 only
eltab <- eltab[(eltab$Date == as.Date("2007-02-01")) | (eltab$Date == as.Date("2007-02-02")),]
## Convert time to date-time format
eltab$Time2 <- strptime(paste(eltab$Date, eltab$Time), "%Y-%m-%d %H:%M:%S", )

#* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
#*     Generate plot 3
#* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
png(file="Plot3.png", 480, 480) #open png device
with(eltab, plot(Time2, Sub_metering_1, type="n",
                 xlab="", ylab="Energy sub metering"))
with(eltab, lines(Time2, Sub_metering_1))
with(eltab, lines(Time2, Sub_metering_2, col="red"))
with(eltab, lines(Time2, Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"),
       legend=c("Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"))
dev.off() #close png device