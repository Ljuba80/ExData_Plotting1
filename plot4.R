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
globActPwr <- sapply(data[3], as.numeric)
globReactPwr <- sapply(data[4], as.numeric)
Voltage <- sapply(data[5], as.numeric)

par(mfrow=c(2,2))
par(mar=c(2,4,4,1))

plot(dateTime,globActPwr,type="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(dateTime,globActPwr);

plot(dateTime,Voltage,type="n",ylab="Voltage",xlab="")
lines(dateTime,Voltage);

plot(dateTime,Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
legend("topright",lty=c(1,1,1),bty="n",
  seg.len=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
lines(dateTime,Sub_metering_1);
lines(dateTime,Sub_metering_2,col="red");
lines(dateTime,Sub_metering_3,col="blue");

plot(dateTime,globReactPwr,type="n",ylab="Global Reactive Power",xlab="")
lines(dateTime,globReactPwr);



dev.copy(png,"plot4.png")
dev.off()