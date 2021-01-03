
################################### GET DATA ###################################

# file URL
URL <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip" 

# download data
download.file(URL, destfile = "./data.zip") 

# read/load data into R environment
data <- read.table(unz("data.zip", "activity.csv"), sep = ",", header = TRUE)


