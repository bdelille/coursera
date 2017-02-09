# Set up the Working directory

setwd("C:/coursera/data_science/exploratory data analysis")

#set up the packages
library(dplyr)

# Download the file in the workinfdg directory

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                   destfile = "household_power_consumption.zip")

# Unzip the data from the zip file into the working directory

unzip("household_power_consumption.zip")

# Checking the presence of the file in the directory
dir()

# The file is txt file with semi-colum (;) separated

# Read the data into R
# NAs are represented by blanks and ? in this data, so need to change

power <- read.table("household_power_consumption.txt", sep=";", header=T,
na.strings=c("?",""), stringsAsFactors=FALSE)

# Checking the structure of the file
str(power)

#The Date and Time variables were read in as characters, so we'll convert them to date and time
#classes, respectively, as well as create a new DateTime column:

# Convert character date to an ISO date
power$Date <- as.Date(power$Date, format="%Y/%m/%d")

#Checking the structure again
str(power)

#Subset the datat to select only data between 2007-02-01 and 2007-02-02
power1 <- subset(power, filter(Date >="2007-02-01" & Date <= "2007-02-02"))

with(power1, hist(Global_active_power))
title("Global Active Power")

# apply the hist function 
  
colors = c("red", "yellow", "green", "violet", "orange", "blue", "pink", "cyan")

hist(power1$Global_active_power, col= "red", 
          main="Global Active Power", 
          xlab="Global Active Power (kilowatts)")    


# copy the graph to png device     
dev.copy(png, file="plot1.png", width=480, height=480)

# close the device  
dev.off()
