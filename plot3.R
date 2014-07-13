myFile<-"household_power_consumption.txt"
data<-read.table(myFile, header = TRUE,sep=";", nrows = 70000,colClasses=c("character","character",rep("numeric",7)),
na.strings="?")

data=subset(data,Date=="1/2/2007" | Date=="2/2/2007" )

Sub_metering_1 <- sapply(data[7], as.numeric)
Sub_metering_2 <- sapply(data[8], as.numeric)
Sub_metering_3 <- sapply(data[9], as.numeric)
date<-sapply(data[1],as.character)
time<-sapply(data[2],as.character)
dateTime<-paste(date,time)



dateTime<-strptime(dateTime, "%d/%m/%Y %H:%M:%S")



plot(dateTime,Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
legend("topright",lty=c(1,1,1),
  seg.len=3,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

lines(dateTime,Sub_metering_1);
lines(dateTime,Sub_metering_2,col="red");
lines(dateTime,Sub_metering_3,col="blue");
dev.copy(png,"plot3.png")
dev.off()