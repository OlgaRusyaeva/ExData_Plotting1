#read data from a file with the dates 2007-02-01 and 2007-02-02
library(sqldf)
fileName <- "household_power_consumption.txt"
df <- read.csv.sql(fileName, sql='select * from file where Date="1/2/2007" OR Date="2/2/2007"',sep=";",header=T)
closeAllConnections()
#create new column out of Date and Time columns
df$DateTime <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
#create a graph Global active power usage in days of the week
png("plot2.png")
plot(df$DateTime,df$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()