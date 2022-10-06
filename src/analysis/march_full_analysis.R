#load libraries
library(utils)

#download datasets
#12 mar 2022
download.file('http://data.insideairbnb.com/united-states/hi/hawaii/2022-03-12/data/calendar.csv.gz', destfile = 'calendar-12-mar.csv')
download.file('http://data.insideairbnb.com/united-states/hi/hawaii/2022-03-12/data/listings.csv.gz', destfile = 'listings-12-mar.csv')


#download datasets
options(timeout = 200) #extending download timeout because default is 60sec

#load datasets
mar <- read.csv("listings-12-mar.csv")
calendar_m <-read.csv("calendar-12-mar.csv")

# Creating smaller df containing only necessary columns of listings tables
library(tidyverse)
mar_s <- mar %>% select(id, bathrooms, bathrooms_text, neighbourhood_group_cleansed, room_type, accommodates,
                          bedrooms, beds, instant_bookable, review_scores_rating)

# DATA INSPECTION AND PREPARATION LISTINGS DATASET
# BATHROOMS TEXT VARIABLE
# Transform the bathrooms_text column into a workable column
# Create 2 dummy columns showing whether the bathroom is private/shared/not mentioned
library(tidyverse)
library(stringr)

sum(is.na(mar_s$bathrooms)) #checking if all bathrooms column is NA
unique(mar_s$bathrooms_text) #checking the existing unique types of bathrooms

mar_s$bathroom_shared <- ifelse(str_detect(mar_s$bathrooms_text, 'shared|Shared'), 1, 0)
mar_s$bathroom_private <- ifelse(str_detect(mar_s$bathrooms_text, 'shared|Shared'), 0, 1)


#replacing empty bathrooms_text with NAs
sum(mar_s$bathrooms_text == "")

mar_s %>% filter(bathrooms_text=="") 

mar_s$bathrooms_text[mar_s$bathrooms_text==""]<-NA
sum(is.na(mar_s$bathrooms_text))

mar_s$bathrooms <- ifelse(str_detect(mar_s$bathrooms_text, 'Private'), 0.5, 0)
mar_s$bathrooms <- ifelse(str_detect(mar_s$bathrooms_text, 'Shared'), 0.5, 0)
mar_s$bathrooms <- ifelse(str_detect(mar_s$bathrooms_text, 'Half'), 0.5, 0)

mar_s$bathrooms <- as.double(word(mar_s$bathrooms_text,1)) #putting the number of bathrooms into the right bathrooms column

sum(is.na(mar_s$bathrooms))

mar_s %>% filter(str_detect(mar_s$bathrooms_text, 'Private')) 

mar_s$bathrooms[str_detect(mar_s$bathrooms_text, 'Private|Shared|Half')]<-0.5

# NEIGHBOURHOOD GROUP CLEANSED VARIABLE 
# Inspect neighbourhood_group_cleaned variable
sum(is.na(mar_s$neighbourhood_group_cleansed)) #checking if neighbourhood column has NA
mar_s %>% group_by(neighbourhood_group_cleansed) %>% summarise(number_of_observations = n(), nrlistings = sum(id)) #checking number of listings per neighbourhood group 

# Recode neighbourhood_group_cleaned into a working format: 3 dummy variables (with Honolulu as baseline as the capital)
mar_s$hawaii_neighbourhood <- ifelse(mar_s$neighbourhood_group_cleansed == "Hawaii", 1, 0)
mar_s$kauai_neighbourhood <- ifelse(mar_s$neighbourhood_group_cleansed == "Kauai", 1, 0)
mar_s$maui_neighbourhood <- ifelse(mar_s$neighbourhood_group_cleansed == "Maui", 1, 0)

# ROOM TYPE VARIABLE 
# Inspect room_type variable
sum(is.na(mar_s$room_type)) #checking if room type column has NA
mar_s %>% group_by(room_type) %>% summarise(number_of_observations = n(), nrlistings = sum(id)) #checking number of listings per room type 

#Recode room_type into 3 dummy variables (hotel room is the baseline)
mar_s$entire_home_apt_room_type <- ifelse(mar_s$room_type == "Entire home/apt", 1, 0)
mar_s$private_room_room_type <- ifelse(mar_s$room_type == "Private room", 1, 0)
mar_s$shared_room_room_type <- ifelse(mar_s$room_type == "Shared room", 1, 0)

# BEDROOMS VARIABLE AND BEDS VARAIABLE
#check if beds variable contains NA
any(is.na(mar_s$beds))

#check if bedrooms variable contains NA
any(is.na(mar_s$bedrooms))

#check range of number of bedrooms and other summary statistics
summary(mar_s$bedrooms)

#check range of number of beds and other summary statistics
summary(mar_s$beds)

# change NA in beds variable into 1 if listing accommodates 1 person
mar_s$beds <- ifelse(mar_s$accommodates == 1 & is.na(mar_s$beds), 1, mar_s$beds)

# ACCOMMODATES VARIABLE
# missing value check for accomodates in June
mar_s %>% count(accommodates)            # There is no missing value only one value is 0 which doesnt make sense as an accomodation doesnt have accomodate.
mar_s %>% filter(accommodates==0)        # one value has 0 accomodate with id:43309266 to understand the situation the website is checked realized that it is an hotel and has wrong number of accomodates. 

# type check for accomodates in Mar. all date sets are integer, there is no problem. 
typeof(mar_s$accommodates)               # no problem with the type of variable as it is integer. 

#As there is one row may effect the result, that row is removed from june_s dataset. 
mar_s %>% 
  filter(id==43309266)
mar_s<- subset(mar_s, id!="43309266")     #from the june_s data set the listing with id==43309266 is removed.

# Checking for missing values
mar_s %>% count(instant_bookable) #no missing value, 10143 listing with instant bookable and 16201 listing with no instant bokkable values.

#checking for type
typeof(mar_s$instant_bookable)   # now it is character

# june_s data set changing type to double and changing values from t,f to 1,0.
mar_s$instant_bookable_dummy <- ifelse(mar_s$instant_bookable == "t", 1, 0) 
mar_s$instant_bookable_dummy
typeof(mar_s$instant_bookable_dummy) 

# DATA INSPECTION AND PREPARATION CALENDAR DATASET 
# change variable types of price and adjusted_price
calendar_m$price_n <- substring(calendar_m$price,2)
calendar_m$adjusted_price_n <- substring(calendar_m$price,2)

calendar_m$price_n <- as.double(calendar_m$price_n)
calendar_m$adjusted_price_n <- as.double(calendar_m$adjusted_price_n)

typeof(calendar_m$price_n)
typeof(calendar_m$adjusted_price_n)

# Inspect variables for NAs
sum(is.na(calendar_m$price_n))
sum(is.na(calendar_m$adjusted_price_n))

# Check if price and adjusted_price are different
calendar_m$difference_p <- calendar_m$price_n - calendar_m$adjusted_price_n
summary(calendar_m$difference_p)

# Creating smaller df containing only necessary columns of listings tables
library(tidyverse)
calendar_m_s <- calendar_m %>% select(listing_id, date, price_n)

# change date type from character to date
calendar_m_s$date <- as.Date(calendar_m_s$date)
typeof(calendar_m_s$date)

# Add new variable with time until booking
calendar_m_s$time_diff<- as.numeric(calendar_m_s$date-as.Date("2022-03-12"))

# Rename listings_id to id for merging
calendar_m_s<- calendar_m_s %>% rename(id = listing_id)

# Now lists, transform to data frames
mar_s <- data.frame(mar_s)
calendar_m_s <- data.frame(calendar_m_s)

# Merge the datasets
merged <- merge(mar_s,calendar_m_s)

# Linear Regression
merged_lm <- lm(price_n ~ bathrooms + accommodates + beds + bedrooms + review_scores_rating + bathroom_shared + bathroom_private + hawaii_neighbourhood + kauai_neighbourhood + maui_neighbourhood +entire_home_apt_room_type + private_room_room_type + shared_room_room_type + instant_bookable_dummy + time_diff, merged, na.action = na.omit)
summary(merged_lm)

















