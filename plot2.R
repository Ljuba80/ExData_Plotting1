myFile<-"household_power_consumption.txt"
data<-read.table(myFile, header = TRUE,sep=";", nrows = 70000,colClasses=c("character","character",rep("numeric",7)),
na.strings="?")

data=subset(data,Date=="1/2/2007" | Date=="2/2/2007" )

globActPwr <- sapply(data[3], as.numeric)
date<-sapply(data[1],as.character)
time<-sapply(data[2],as.character)
dateTime<-paste(date,time)

dateTime<-strptime(dateTime, "%d/%m/%Y %H:%M:%S")

plot(dateTime,globActPwr,type="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(dateTime,globActPwr);
dev.copy(png,"plot2.png")
dev.off()