plot3<-function(){
  data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
  #getting subset
  datause<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
  #changing date to "Date" form
  library(lubridate)
  try1<-paste(datause$Date,datause$Time)
  try2<-dmy_hms(try1)
  #Transforming data to char then numeric for plot
  datause<-transform(datause,Sub_metering_1=as.character(Sub_metering_1))
  datause<-transform(datause,Sub_metering_1=as.numeric(Sub_metering_1))
  datause<-transform(datause,Sub_metering_2=as.character(Sub_metering_2))
  datause<-transform(datause,Sub_metering_2=as.numeric(Sub_metering_2))
  datause<-transform(datause,Sub_metering_3=as.character(Sub_metering_3))
  datause<-transform(datause,Sub_metering_3=as.numeric(Sub_metering_3))
  #open .png file, plot and close .png
  png(file="plot3.png",width=480,height=480)
  #windows()
  plot(try2,datause$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",lty=1,col="black")
  lines(try2,datause$Sub_metering_2,type="l",lty=1,col="red")
  lines(try2,datause$Sub_metering_3,ylab="Energy sub metering",type="l",lty=1,col="blue")
  legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

  dev.off()
}