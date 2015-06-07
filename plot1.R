#read data from a file with the dates 2007-02-01 and 2007-02-02
library(sqldf)
fileName <- "household_power_consumption.txt"
df <- read.csv.sql(fileName, sql='select * from file where Date="1/2/2007" OR Date="2/2/2007"',sep=";",header=T)
closeAllConnections()
#create histogram of Global Active Power in red
png("plot1.png")
hist(df$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()