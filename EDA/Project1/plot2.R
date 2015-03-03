
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
  #plotting data to plot1.png
  png("plot2.png", width=480,heigh=480)
  plot(data$Global_active_power~data$Datetime,type="l",
       ylab="Global Active Power (kilowatts)",xlab="")
  dev.off()
