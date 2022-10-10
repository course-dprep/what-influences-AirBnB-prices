#set working directory
setwd("D:/Material/MSc MA/dPrep/project") #~your own wd

#download datasets
options(timeout = 200) #extending download timeout because default is 60sec
download.file('http://data.insideairbnb.com/united-states/hi/hawaii/2022-06-08/data/calendar.csv.gz', destfile = 'calendar-8-jun.csv')


#load dataset into variables
calendar_j <-read.csv("calendar-8-jun.csv")

# june dataset
# change variable types of price and adjusted_price
calendar_j$price_n <- substring(calendar_j$price,2)
calendar_j$adjusted_price_n <- substring(calendar_j$price,2)

calendar_j$price_n <- as.double(calendar_j$price_n)
calendar_j$adjusted_price_n <- as.double(calendar_j$adjusted_price_n)

typeof(calendar_j$price_n) # check variable type
typeof(calendar_j$adjusted_price_n)

# Inspect variables for NAs
sum(is.na(calendar_j$price_n))
sum(is.na(calendar_j$adjusted_price_n))

# Check if price and adjusted_price are different
calendar_j$difference_p <- calendar_j$price_n - calendar_j$adjusted_price_n
summary(calendar_j$difference_p)# no difference, work with price

# Creating smaller df containing only necessary columns of listings tables
calendar_j_s <- calendar_j %>% select(listing_id, date, price_n)

#create time difference
# change date type from character to date
calendar_j_s$date <- as.Date(calendar_j_s$date)
typeof(calendar_j_s$date)#check

# Add new variable with time until booking
calendar_j_s$time_diff<- as.numeric(calendar_j_s$date-as.Date("2022-06-08"))

#remove original calendar data frame to free memory
rm(calendar_j)