
  Sys.setlocale("LC_ALL","US")
  # reading data from file
  data<-read.csv("household_power_consumption.txt",sep=";",
                 na.strings="?",colClasses=c("character",
                                             "character","numeric","numeric","numeric","numeric",
                                             "numeric","numeric","numeric"))
  #substucting data
  data<-data[which(data[,1]=="1/2/2007")[1]:tail(which(data[,1]=="2/2/2007"),1),]
  # adding Datetime column to data
  data$Date<-strptime(data$Date,format="%d/%m/%Y")
  datetime <- paste(as.Date(data$Date), data$Time)
  data$Datetime <- as.POSIXct(datetime)
  #plotting data to plot4.png
  png("plot4.png", width=480,heigh=480)
  par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  with(data, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
  })
  dev.off()
