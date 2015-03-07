plot1<-function(){
  data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
  #getting subset
  datause<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
  #changing date to "Date" form
  library(lubridate)
  datause$Date<-dmy(datause$Date)
  #Transforming data to char then numeric for plot
  datause<-transform(datause,Global_active_power=as.character(Global_active_power))
  datause<-transform(datause,Global_active_power=as.numeric(Global_active_power))
  #open .png file, plot and close .png
  png(file="plot1.png",width=480,height=480)
  hist(datause$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
  dev.off()
}