##Down load data and unzip file
##set wroking directory to the location of the data file
setwd("C:/Coursera data/Exploring Data/Week1/exdata_data_household_power_consumption")


##will need to set graphics device to png

##read in and clean up data

consumerdata<-read.table("household_power_consumption.txt",header = TRUE,sep = ";", na.strings = "?")
consumerdata$Time<-paste(consumerdata$Date,consumerdata$Time)
consumerdata$Time<-strptime(consumerdata$Time,"%d/%m/%Y %X")
consumerdata$Date<-as.Date(consumerdata$Date,"%d/%m/%Y")

consumerdata2<-consumerdata[consumerdata$Date >= '2007-02-01' & consumerdata$Date <= '2007-02-02',]



cuts<-table(cut(consumerdata2$Global_active_power,breaks = seq(0,8,0.5)))

##set par to default


dir.create("C:/Coursera data/Exploring Data/Week1/Analysis/figure")
setwd("C:/Coursera data/Exploring Data/Week1/Analysis/figure")


dev.off()
##plot 1
barplot(cuts,space = 0,col = "red",axis.lty = 1,axisnames = FALSE, las = 2,xlim = c(0,16))
axis(1,at = c(0,4,8,12),labels = c(0,2,4,6),line = .5)
title(main = "Global Active Power",xlab = "Global Active Power (kilowatts)", ylab = "frequency")
dev.copy(png,file = "unnamed-chunk-2.png")
dev.off()

##plot 2

with(consumerdata2,plot(Time,Global_active_power,ylab = "Global Active Power (kilowatts)",xlab = "",type = "l"))
dev.copy(png,file = "unnamed-chunk-3.png")
dev.off()

#plot 3

with(consumerdata2,plot(Time,Sub_metering_1,ylab = "Energy Sub Metering",xlab = "",type = "l"))
with(consumerdata2,lines(Time,Sub_metering_2,col = "red"))
with(consumerdata2,lines(Time,Sub_metering_3,col = "blue"))
legend("topright",lwd = 1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file = "unnamed-chunk-4.png")
dev.off()

#plot 4


par(mfcol = c(2,2), cex.axis = .8, cex.sub = .8, cex.lab = .8)

with(consumerdata2,plot(Time,Global_active_power,ylab = "Global Active Power",xlab = "",type = "l"))

with(consumerdata2,plot(Time,Sub_metering_1,ylab = "Energy Sub Metering",xlab = "",type = "l"))
with(consumerdata2,lines(Time,Sub_metering_2,col = "red"))
with(consumerdata2,lines(Time,Sub_metering_3,col = "blue"))
legend("topright",lwd = 1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),box.col = "white",cex = .5, inset = .008)

with(consumerdata2,plot(Time,Voltage,ylab = "Voltage",xlab = "datetime",type = "l"))
with(consumerdata2,plot(Time,Global_reactive_power,xlab = "datetime",type = "l"))
dev.copy(png,file = "unnamed-chunk-5.png")
dev.off()
