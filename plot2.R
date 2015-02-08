#####################################################################
#
# JH Exploratory Data class project 2 - 2/5/15
#
# Plot 2
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
png(file = "./plot2.png", width = 480, height = 480, units = "px")

# create the plot
plot(two_day_df$Date_Time, two_day_df$Global_active_power,
     type="l",
     xlab="",
     ylab= "Global Active Power (kilowatts)")

# close the graphics device
dev.off()








