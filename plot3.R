#####################################################################
#
# JH Exploratory Data class project 1 - 2/5/15
#
# Plot 3
#
# load and view the data
power_df <- read.table("household_power_consumption.txt", sep=";", header=TRUE,
                       stringsAsFactors=FALSE, na.strings="?")

# date format is: "17/12/2006" == "dd/mm/yy" without any 0's
#    "2007-02-01" == "1/2/2007" 
#    "2007-02-02" == "2/2/2007" 
# get the data for: 2007-02-01 and 2007-02-02 
two_day_df <- subset(power_df, 
                     power_df$Date=="1/2/2007" |
                     power_df$Date=="2/2/2007")

# create a new column in the data frame that holds the Date and Time
two_day_df$Date_Time <- strptime(paste(two_day_df$Date, two_day_df$Time),
                                 "%d/%m/%Y %H:%M:%S")

# set up the graphics device
png(file = "./plot3.png", width = 480, height = 480, units = "px")

# create the plot
plot(two_day_df$Date_Time, two_day_df$Sub_metering_1, 
     type="l", 
     xlab="",
     ylab= "Energy sub metering")
lines(two_day_df$Date_Time, two_day_df$Sub_metering_2, 
      col="red")
lines(two_day_df$Date_Time, two_day_df$Sub_metering_3, 
      col="blue")
legend("topright", cex=1.0, lty=1, 
       col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     
# close the graphics device
dev.off()




