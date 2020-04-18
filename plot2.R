
png("plot2.png", width=480, height=480)

## Read in data ##

dat <- read.csv("data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=2075259, 
                check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# subset the 2007-02-01 and 2007-02-02 data
dat <- subset(dat, Date %in% c("1/2/2007", "2/2/2007"))

# convert date to date object type
dat$Date =  as.Date(dat$Dat, format="%d/%m/%Y")

dat$time_series = strptime(paste(dat$Date, dat$Time), format= "%Y-%m-%d %H:%M:%S")

with(dat, plot(time_series, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))


dev.off()