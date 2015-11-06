library(dplyr)
a<-read.csv("household_power_consumption.txt",sep=";",colClasses="character",header=TRUE)
b<-subset(a,a$Date=="1/2/2007")
c<-subset(a,a$Date=="2/2/2007")
data<-rbind(b,c)
data<-mutate(data,DT=paste(Date,Time))
data[,1]<-as.Date(data[,1],"%d/%m/%Y")
data$DT<-strptime(data$DT,"%d/%m/%Y %H:%M:%S")
data[,3]<-as.numeric(data[,3])
data[,4]<-as.numeric(data[,4])
data[,5]<-as.numeric(data[,5])
data[,7]<-as.numeric(data[,7])
data[,8]<-as.numeric(data[,8])
data[,9]<-as.numeric(data[,9])

png("plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2),mar=c(4,4,2,1))
##Plot 1
with(data,plot(DT,Global_active_power,type="l",xlab="",ylab="Global Active Power"))
##Plot 2
with(data,plot(DT,Voltage,type="l",xlab="datetime",ylab="Voltage"))
##Plot 3
y<-range(c(data$Sub_metering_1,data$Sub_metering_2,data$Sub_metering_3))
with(data,plot(DT,Sub_metering_1,type="l",ylim=y,xlab="",ylab=""))
with(data,lines(DT,Sub_metering_2,col="red"))
with(data,lines(DT,Sub_metering_3,col="blue"))
title(ylab="Energy sub metering")
x<-c("sub_metering_1","sub_metering_2","sub_metering_3")
legend("topright",x,pch="_",col=c("black","red","blue"))
##Plot 4
with(data,plot(DT,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))

dev.off()

