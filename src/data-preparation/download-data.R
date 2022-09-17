#load libraries
library(utils)


#set working directory
setwd("D:/Material/MSc MA/dPrep/project") #~your own wd

#download datasets
options(timeout = 200) #extending download timeout because default is 60sec
#8 jun 2022
download.file('http://data.insideairbnb.com/united-states/hi/hawaii/2022-06-08/data/listings.csv.gz', destfile = 'listings-8-jun.csv')
download.file('http://data.insideairbnb.com/united-states/hi/hawaii/2022-06-08/data/calendar.csv.gz', destfile = 'calendar-8-jun.csv')
download.file('http://data.insideairbnb.com/united-states/hi/hawaii/2022-06-08/data/reviews.csv.gz', destfile = 'reviews-8-jun.csv')

#12 mar 2022
download.file('http://data.insideairbnb.com/united-states/hi/hawaii/2022-03-12/data/reviews.csv.gz', destfile = 'reviews-12-mar.csv')
download.file('http://data.insideairbnb.com/united-states/hi/hawaii/2022-03-12/data/calendar.csv.gz', destfile = 'calendar-12-mar.csv')
download.file('http://data.insideairbnb.com/united-states/hi/hawaii/2022-03-12/data/listings.csv.gz', destfile = 'listings-12-mar.csv')
#11 dec 2021
download.file('http://data.insideairbnb.com/united-states/hi/hawaii/2021-12-11/data/reviews.csv.gz', destfile = 'reviews-11-dec.csv')
download.file('http://data.insideairbnb.com/united-states/hi/hawaii/2021-12-11/data/calendar.csv.gz', destfile = 'calendar-11-dec.csv')
download.file('http://data.insideairbnb.com/united-states/hi/hawaii/2021-12-11/data/listings.csv.gz', destfile = 'listings-11-dec.csv')


#load datasets into variables
june <- read.csv("listings-8-jun.csv")
calendar_j <-read.csv("calendar-8-jun.csv")
reviews_j <-read.csv("reviews-8-jun.csv")

mar <- read.csv("listings-12-mar.csv")
calendar_m <-read.csv("calendar-12-mar.csv")
reviews_m <-read.csv("reviews-12-mar.csv")

dec <- read.csv("listings-11-dec.csv")
calendar_d <-read.csv("calendar-11-dec.csv")
reviews_d <-read.csv("reviews-11-dec.csv")




