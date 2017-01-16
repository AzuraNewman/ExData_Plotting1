##Down load data and unzip file
##set wroking directory to the location of the data file
setwd("C:/Coursera data/Exploring Data/Week1/exdata_data_household_power_consumption")


##will need to set graphics device to png

##read in and clean up data
## na values in the source data is indicated by ?  
consumerdata<-read.table("household_power_consumption.txt",header = TRUE,sep = ";", na.strings = "?")
consumerdata$Time<-paste(consumerdata$Date,consumerdata$Time)
consumerdata$Time<-strptime(consumerdata$Time,"%d/%m/%Y %X")
consumerdata$Date<-as.Date(consumerdata$Date,"%d/%m/%Y")

##subsetting to only include desired timeframe.
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
