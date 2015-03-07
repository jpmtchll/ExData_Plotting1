plot4<-function(){
  data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
  #getting subset
  datause<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
  #changing date to "Date" form
  library(lubridate)
  try1<-paste(datause$Date,datause$Time)
  try2<-dmy_hms(try1)
  #Transforming data to char then numeric for plot
  datause<-transform(datause,Global_active_power=as.character(Global_active_power))
  datause<-transform(datause,Global_active_power=as.numeric(Global_active_power))
  datause<-transform(datause,Sub_metering_1=as.character(Sub_metering_1))
  datause<-transform(datause,Sub_metering_1=as.numeric(Sub_metering_1))
  datause<-transform(datause,Sub_metering_2=as.character(Sub_metering_2))
  datause<-transform(datause,Sub_metering_2=as.numeric(Sub_metering_2))
  datause<-transform(datause,Sub_metering_3=as.character(Sub_metering_3))
  datause<-transform(datause,Sub_metering_3=as.numeric(Sub_metering_3))
  datause<-transform(datause,Voltage=as.character(Voltage))
  datause<-transform(datause,Voltage=as.numeric(Voltage))
  datause<-transform(datause,Global_reactive_power=as.character(Global_reactive_power))
  datause<-transform(datause,Global_reactive_power=as.numeric(Global_reactive_power))
  #open .png file, plot and close .png  
  png(file="plot4.png",width=480,height=480)
  #windows()
  par(mfrow=c(2,2))
  plot(try2,datause$Global_active_power,xlab="",ylab="Global Active Power",type="l",lty=1)
  plot(try2,datause$Voltage,xlab="datetime",ylab="Voltage",type="l",lty=1)
  plot(try2,datause$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",lty=1,col="black")
  lines(try2,datause$Sub_metering_2,type="l",lty=1,col="red")
  lines(try2,datause$Sub_metering_3,ylab="Energy sub metering",type="l",lty=1,col="blue")  
  legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(try2,datause$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l",lty=1)

   dev.off()
}