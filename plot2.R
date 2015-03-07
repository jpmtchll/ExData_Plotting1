plot2<-function(){
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
  #open .png file, plot and close .png
  png(file="plot2.png",width=480,height=480)
   #windows()
  plot(try2,datause$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l",lty=1)

  dev.off()
}