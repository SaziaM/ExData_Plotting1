
a<-read.csv("household_power_consumption.txt",sep=";",colClasses="character",header=TRUE)
b<-subset(a,a$Date=="1/2/2007")
c<-subset(a,a$Date=="2/2/2007")
data<-rbind(b,c)
data[,1]<-as.Date(data[,1],"%d/%m/%Y")
data[,3]<-as.numeric(data[,3])
png("plot1.png",width=480,height=480,units="px")
with(data,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)"))
dev.off()

