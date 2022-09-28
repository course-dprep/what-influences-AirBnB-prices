#load libraries
library(utils)

#set working directory
setwd("`/Desktop/dPrep") #~your own wd

#download datasets
#8 jun 2022
download.file('http://data.insideairbnb.com/united-states/hi/hawaii/2022-06-08/data/calendar.csv.gz', destfile = 'calendar-8-jun.csv')
download.file('http://data.insideairbnb.com/united-states/hi/hawaii/2022-06-08/data/listings.csv.gz', destfile = 'listings-8-jun.csv')

#load datasets
calendar_j <-read.csv("calendar-8-jun.csv")
june <-read.csv("listings-8-jun.csv")

# Creating smaller df containing only necessary columns of listings tables
library(tidyverse)
june_s <- june %>% select(id, bathrooms, bathrooms_text, neighbourhood_group_cleansed, room_type, accommodates,
                          bedrooms, beds, instant_bookable, review_scores_rating)

# DATA INSPECTION AND PREPARATION LISTINGS DATASET
# BATHROOMS TEXT VARIABLE
# Transform the bathrooms_text column into a workable column
# Create 2 dummy columns showing whether the bathroom is private/shared/not mentioned
library(tidyverse)
library(stringr)

sum(is.na(june_s$bathrooms)) #checking if all bathrooms column is NA
unique(june_s$bathrooms_text) #checking the existing unique types of bathrooms

june_s$bathroom_shared <- ifelse(str_detect(june_s$bathrooms_text, 'shared|Shared'), 1, 0)
june_s$bathroom_private <- ifelse(str_detect(june_s$bathrooms_text, 'shared|Shared'), 0, 1)

#replacing empty bathrooms_text with NAs
sum(june_s$bathrooms_text == "")

june_s %>% filter(bathrooms_text=="") 

june_s$bathrooms_text[june_s$bathrooms_text==""]<-NA
sum(is.na(june_s$bathrooms_text))

june_s$bathrooms <- ifelse(str_detect(june_s$bathrooms_text, 'Private'), 0.5, 0)
june_s$bathrooms <- ifelse(str_detect(june_s$bathrooms_text, 'Shared'), 0.5, 0)
june_s$bathrooms <- ifelse(str_detect(june_s$bathrooms_text, 'Half'), 0.5, 0)

june_s$bathrooms <- as.double(word(june_s$bathrooms_text,1)) #putting the number of bathrooms into the right bathrooms column

sum(is.na(june_s$bathrooms))

june_s %>% filter(str_detect(june_s$bathrooms_text, 'Private')) 

june_s$bathrooms[str_detect(june_s$bathrooms_text, 'Private|Shared|Half')]<-0.5

# NEIGHBOURHOOD GROUP CLEANSED VARIABLE 
# Inspect neighbourhood_group_cleaned variable
sum(is.na(june_s$neighbourhood_group_cleansed)) #checking if neighbourhood column has NA
june_s %>% group_by(neighbourhood_group_cleansed) %>% summarise(number_of_observations = n(), nrlistings = sum(id)) #checking number of listings per neighbourhood group 

# Recode neighbourhood_group_cleaned into a working format: 3 dummy variables (with Honolulu as baseline as the capital)
june_s$hawaii_neighbourhood <- ifelse(june_s$neighbourhood_group_cleansed == "Hawaii", 1, 0)
june_s$kauai_neighbourhood <- ifelse(june_s$neighbourhood_group_cleansed == "Kauai", 1, 0)
june_s$maui_neighbourhood <- ifelse(june_s$neighbourhood_group_cleansed == "Maui", 1, 0)

# ROOM TYPE VARIABLE 
# Inspect room_type variable
sum(is.na(june_s$room_type)) #checking if room type column has NA
june_s %>% group_by(room_type) %>% summarise(number_of_observations = n(), nrlistings = sum(id)) #checking number of listings per room type 

#Recode room_type into 3 dummy variables (hotel room is the baseline)
june_s$entire_home_apt_room_type <- ifelse(june_s$room_type == "Entire home/apt", 1, 0)
june_s$private_room_room_type <- ifelse(june_s$room_type == "Private room", 1, 0)
june_s$shared_room_room_type <- ifelse(june_s$room_type == "Shared room", 1, 0)

# BEDROOMS VARIABLE AND BEDS VARAIABLE
#check if beds variable contains NA
any(is.na(june_s$beds))

#check if bedrooms variable contains NA
any(is.na(june_s$bedrooms))

#check range of number of bedrooms and other summary statistics
summary(june_s$bedrooms)

#check range of number of beds and other summary statistics
summary(june_s$beds)

# change NA in beds variable into 1 if listing accommodates 1 person
june_s$beds <- ifelse(june_s$accommodates == 1 & is.na(june_s$beds), 1, june_s$beds)

# ACCOMMODATES VARIABLE
# missing value check for accomodates in June
june_s %>% count(accommodates)            # There is no missing value only one value is 0 which doesnt make sense as an accomodation doesnt have accomodate.
june_s %>% filter(accommodates==0)        # one value has 0 accomodate with id:43309266 to understand the situation the website is checked realized that it is an hotel and has wrong number of accomodates. 

# type check for accomodates in Mar. all date sets are integer, there is no problem. 
typeof(june_s$accommodates)               # no problem with the type of variable as it is integer. 

#As there is one row may effect the result, that row is removed from june_s dataset. 
june_s %>% 
  filter(id==43309266)
june_s<- subset(june_s, id!="43309266")     #from the june_s data set the listing with id==43309266 is removed.

# Checking for missing values
june_s %>% count(instant_bookable) #no missing value, 10143 listing with instant bookable and 16201 listing with no instant bokkable values.

#checking for type
typeof(june_s$instant_bookable)   # now it is character

# june_s data set changing type to double and changing values from t,f to 1,0.
june_s$instant_bookable_dummy <- ifelse(june_s$instant_bookable == "t", 1, 0) 
june_s$instant_bookable_dummy
typeof(june_s$instant_bookable_dummy) 


# DATA INSPECTION AND PREPARATION CALENDAR DATASET 
# change variable types of price and adjusted_price
calendar_j$price_n <- substring(calendar_j$price,2)
calendar_j$adjusted_price_n <- substring(calendar_j$price,2)

calendar_j$price_n <- as.double(calendar_j$price_n)
calendar_j$adjusted_price_n <- as.double(calendar_j$adjusted_price_n)

typeof(calendar_j$price_n)
typeof(calendar_j$adjusted_price_n)

# Inspect variables for NAs
sum(is.na(calendar_j$price_n))
sum(is.na(calendar_j$adjusted_price_n))

# Check if price and adjusted_price are different
calendar_j$difference_p <- calendar_j$price_n - calendar_j$adjusted_price_n
summary(calendar_j$difference_p)

# Creating smaller df containing only necessary columns of listings tables
library(tidyverse)
calendar_j_s <- calendar_j %>% select(listing_id, date, price_n)

# change date type from character to date
calendar_j_s$date <- as.Date(calendar_j_s$date)
typeof(calendar_j_s$date)

# Add new variable with time until booking
calendar_j_s$time_diff<- as.numeric(calendar_j_s$date-as.Date("2022-06-08"))

# Rename listings_id to id for merging
calendar_j_s<- calendar_j_s %>% rename(id = listing_id)

# Now lists, transform to data frames
june_s <- data.frame(june_s)
calendar_j_s <- data.frame(calendar_j_s)

# Merge the datasets
merged <- merge(june_s,calendar_j_s)

# Linear Regression
merged_lm <- lm(price_n ~ bathrooms + accommodates + beds + bedrooms + review_scores_rating + bathroom_shared + bathroom_private + hawaii_neighbourhood + kauai_neighbourhood + maui_neighbourhood +entire_home_apt_room_type + private_room_room_type + shared_room_room_type + instant_bookable_dummy + time_diff, merged, na.action = na.omit)
summary(merged_lm)

