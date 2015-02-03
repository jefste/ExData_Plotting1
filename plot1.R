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



#device to create PNG file
png("plot1.png", width=480, height=480, units='px')

#creates histogram for global active power 
hist(hpc.2day$Global_active_power,
     #colors and labels plot per instructions
     col='red',main='Global Active Power',
     xlab='Global Active Power (kilowatts)')

#close the plot1.png devices
dev.off() 
