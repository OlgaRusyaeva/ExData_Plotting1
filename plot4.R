#read data from a file with the dates 2007-02-01 and 2007-02-02
library(sqldf)
fileName <- "household_power_consumption.txt"
df <- read.csv.sql(fileName, sql='select * from file where Date="1/2/2007" OR Date="2/2/2007"',sep=";",header=T)
closeAllConnections()
#create new column out of Date and Time columns
df$DateTime <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
png("plot4.png")
#create 4 graphs
par(mfrow=c(2,2))
# DateTime - Global Active Power
plot(df$DateTime,df$Global_active_power,type="l",xlab="",ylab="Global Active Power")
# DateTime - Voltage
plot(df$DateTime,df$Voltage,type="l",xlab="datetime",ylab="Voltage")
# DateTime - Energy sub metering
plot(df$DateTime,df$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",ylim=yrange,col="black")
lines(df$DateTime,df$Sub_metering_2,type="l",col="red")
lines(df$DateTime,df$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n")
# DateTime - Global reactive power
plot(df$DateTime,df$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
