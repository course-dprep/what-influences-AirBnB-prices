
# loading R data and libraries --------------------------------------------

load("../../gen/data-preparation/temp/calendar_j.RData")
library(utils)
library(tidyverse)
library(stringr)


# data preparation for price ----------------------------------------------

  #drop the dollar sign
  calendar_j$price_n <- substring(calendar_j$price,2)
  calendar_j$adjusted_price_n <- substring(calendar_j$price,2)
  
  # change variable types of price and adjusted_price
  calendar_j$price_n <- as.double(calendar_j$price_n)
  calendar_j$adjusted_price_n <- as.double(calendar_j$adjusted_price_n)
  
  # check variable type
  typeof(calendar_j$price_n) 
  typeof(calendar_j$adjusted_price_n)

  # Inspect variables for NAs
  sum(is.na(calendar_j$price_n))
  sum(is.na(calendar_j$adjusted_price_n))

  # Check if price and adjusted_price are different
  calendar_j$difference_p <- calendar_j$price_n - calendar_j$adjusted_price_n
  summary(calendar_j$difference_p)# no difference, work with price


# make smaller dataset ----------------------------------------------------

# Creating smaller df containing only necessary columns of listings tables
calendar_j_s <- calendar_j %>% select(listing_id, date, price_n)


# create variable time_diff -----------------------------------------------

  #create time difference
  # change date type from character to date
  calendar_j_s$date <- as.Date(calendar_j_s$date)
  typeof(calendar_j_s$date)#check

  # Add new variable with time until booking
  calendar_j_s$time_diff<- as.numeric(calendar_j_s$date-as.Date("2022-06-08"))


# include seasonality variable --------------------------------------------

#divide data per seasons 
#summer: May-Oct
#winter: Nov-April
calendar_j_s$winter <- ifelse((calendar_j_s$date >= as.Date("2022-11-01") & calendar_j_s$date < as.Date("2023-04-01")), 1, 0) 


# clean memory and save data ----------------------------------------------

#remove original calendar data frame to free memory
rm(calendar_j)

save(calendar_j_s,file="../../gen/data-preparation/output/calendar_j_s.RData")


