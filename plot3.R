#read data from a file with the dates 2007-02-01 and 2007-02-02
library(sqldf)
fileName <- "household_power_consumption.txt"
df <- read.csv.sql(fileName, sql='select * from file where Date="1/2/2007" OR Date="2/2/2007"',sep=";",header=T)
closeAllConnections()
#create new column out of Date and Time columns
df$DateTime <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
#create a graph of Energy sub metering (three types) in days of the week
png("plot3.png")
#DateTime-Sub_metering_1 in black
plot(df$DateTime,df$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",ylim=yrange,col="black")
#DateTime-Sub_metering_2 in red
lines(df$DateTime,df$Sub_metering_2,type="l",col="red")
#DateTime-Sub_metering_3 in blue
lines(df$DateTime,df$Sub_metering_3,type="l",col="blue")
#legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()