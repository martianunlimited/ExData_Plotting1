library(data.table)
data=fread('household_power_consumption.txt',sep=';')
data$Date=as.Date(data$Date,'%d/%m/%Y')
dates =as.Date(c("2007-02-01","2007-02-02"))
data=data[data$Date %in% dates,]
data[,DateTime:=paste(Date,Time)]
a=strptime(data$DateTime,'%Y-%m-%d %H:%M:%S')
data=cbind(data,a)
data$Global_active_power=as.numeric(data$Global_active_power)
data$Global_reactive_power=as.numeric(data$Global_reactive_power)
data$Voltage=as.numeric(data$Voltage)
data$Global_intensity=as.numeric(data$Global_intensity)
data$Sub_metering_1=as.numeric(data$Sub_metering_1)
data$Sub_metering_2=as.numeric(data$Sub_metering_2)
data$Sub_metering_3=as.numeric(data$Sub_metering_3)

png(filename="plot3.png")
plot(data$a,data$Sub_metering_1,type = 'l',xlab='',ylab='Energy sub metering')
lines(data$a,data$Sub_metering_2, col="red")
lines(data$a,data$Sub_metering_3, col="blue")
dev.off();