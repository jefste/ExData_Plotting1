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


#plot 3
#create scatter plot of sub metering vs. time with colored solid lines
plot(x=time.date.2day,y=hpc.2day$Sub_metering_1,type='l',
    #labels y axis, clears label on x-axis
     ylab='Energy sub metering',xlab='')
#add a red line for submetering 2
lines(x=time.date.2day,y=hpc.2day$Sub_metering_2,col='red')
#add a blue line for submetering 3
lines(x=time.date.2day,y=hpc.2day$Sub_metering_3,col='blue')
#add a legend in the top right with 3 solid lines
legend('topright',lty=c(1,1,1),
       #gives the labels used in the legend
       c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       #gives the coloring of the lines in the legend
       col=c('black',"red","blue"))