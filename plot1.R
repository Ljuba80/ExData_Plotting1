myFile<-"household_power_consumption.txt"
data<-read.table(myFile, header = TRUE,sep=";", nrows = 70000,colClasses=c("character","character",rep("numeric",7)),
na.strings="?")

data=subset(data,Date=="1/2/2007" | Date=="2/2/2007" )

newData <- sapply(data[3], as.numeric)
hist(newData,xlab="Global Active Power (kilowatts)",col="red",main="Global Active power")
dev.copy(png,"plot1.png")
dev.off()