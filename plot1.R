hpc<-read.csv(file='household_power_consumption.txt',sep=';',
              na.strings = '?',
              colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),
)

#create subset for the 2 days of interest
hpc.2day<-subset(hpc,hpc['Date']=='1/2/2007'|hpc['Date']=='2/2/2007')

#paste the time and date columns of the subsetted data together
time.date.2day<-paste(hpc.2day$Date,hpc.2day$Time)
#use strptime to put variable in POSIXlt class
time.date.2day<-strptime(time.date.2day,format='%d/%m/%Y %H:%M:%S')




#plot 1
hist(hpc.2day$Global_active_power,col='red',main='Global Active Power',
     xlab='Global Active Power (kilowatts)')