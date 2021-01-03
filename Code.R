
################################### GET DATA ###################################

# file URL
URL <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip" 

# download data
download.file(URL, destfile = "./data.zip") 

# read/load data into R environment
data <- read.table(unz("data.zip", "activity.csv"), sep = ",", header = TRUE)


# total number of steps per day
question1 <- aggregate(data$steps, by=list(data$date), FUN=sum)

# histogram of total number of steps per day
windows()
library(ggplot2)
g <- ggplot(data = question1, mapping = aes(x))
g + 
  geom_density(color="darkblue", 
               fill="lightblue", size=1) + 
  geom_histogram(aes(y = ..density..), 
                 bins = 9, fill="cornsilk2", 
                 alpha=.5, color="black", 
                 size=1) + 
  labs(title = "Total Steps per Day",
       x = "Total Steps",
       y = "Density") + 
  theme(plot.title = element_text(size = 16),
        axis.title.y = element_text(size = 13.5),
        axis.title.x = element_text(size = 13.5),
        axis.text.x = element_text(size = 13),
        axis.text.y = element_blank())
 
# mean and median of total number of steps per day
rbind(c("Mean", "Median"), 
      c(round(mean(question1$x, na.rm = TRUE), 0), 
        round(median(question1$x, na.rm = TRUE), 0)))





