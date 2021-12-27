# input dataset
# source: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
df <- read.table('household_power_consumption.txt', header=TRUE, sep=';', colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings = '?')

# Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Note that in this dataset missing values are coded as ?.

df$datetime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
df$Date <- strptime(df$Date, '%d/%m/%Y')
df$Time <- strptime(df$Time, '%H:%M:%S')

df_2007_1 <- df[df$Date== strptime('2007-02-01', '%Y-%m-%d'),]
df_2007_2 <- df[df$Date== strptime('2007-02-02', '%Y-%m-%d'),]
df_2007 <- rbind(df_2007_1, df_2007_2)

# plot 3 energy submetering
png('plot3.png', width=480, height=480)
plot(df_2007$datetime, df_2007$Sub_metering_1, col='black', type='l', ylab='Energy sub metering', xlab='')
lines(x, df_2007$Sub_metering_2, col='red', type='l')
lines(x, df_2007$Sub_metering_3, col='blue', type='l')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1)
dev.off()
