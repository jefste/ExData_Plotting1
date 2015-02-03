#read in data and store in data frame hpc
hpc<-read.csv(file='household_power_consumption.txt',sep=';',
              #set '?' values to 'NA'
              na.strings = '?',
              #gives data the appropriate class
              colClasses=c('character','character','numeric','numeric',
                           'numeric','numeric','numeric','numeric','numeric'),
)

#create subset for the 2 days of interest
hpc.2day<-subset(hpc,hpc['Date']=='1/2/2007'|hpc['Date']=='2/2/2007')

#paste the time and date columns of the subsetted data together
time.date.2day<-paste(hpc.2day$Date,hpc.2day$Time)

#use strptime to put variable in POSIXlt class
time.date.2day<-strptime(time.date.2day,format='%d/%m/%Y %H:%M:%S')


#plot 2
#device to create PNG file
png("plot2.png", width=480, height=480, units='px')

#create a scatter plot of global active power vs time, with a solid line
plot(x=time.date.2day,y=hpc.2day$Global_active_power,type='l',
     #labels plot per instructions
     ylab='Global Active Power (kilowatts)',xlab='')

#close the plot2.png device
dev.off() 
