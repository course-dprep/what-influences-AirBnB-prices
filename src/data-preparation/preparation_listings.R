#set working directory
setwd("D:/Material/MSc MA/dPrep/project") #~your own wd

#download datasets
options(timeout = 200) #extending download timeout because default is 60sec

#8 jun 2022
download.file('http://data.insideairbnb.com/united-states/hi/hawaii/2022-06-08/data/listings.csv.gz', destfile = 'listings-8-jun.csv')

#load dataset into variables
june <- read.csv("listings-8-jun.csv")


#take only significant columns to not work with the whole data set
june_s <- june %>% select(id, bathrooms, bathrooms_text, neighbourhood_group_cleansed, room_type, accommodates,
                          bedrooms, beds, instant_bookable, review_scores_rating)

#remove initial dataset to free up memory
rm(june)

# Inspect neighbourhood_group_cleaned variable
sum(is.na(june_s$neighbourhood_group_cleansed)) #checking if neighbourhood column has NA

#there were no NAs found

june_s %>% group_by(neighbourhood_group_cleansed) %>% summarise(number_of_observations = n(), nrlistings = sum(id)) #checking number of listings per neighbourhood group 

# Recode neighbourhood_group_cleaned into a working format: 3 dummy variables (with Honolulu as baseline as the capital)

# june_s data set
june_s$hawaii_neighbourhood <- ifelse(june_s$neighbourhood_group_cleansed == "Hawaii", 1, 0)
june_s$kauai_neighbourhood <- ifelse(june_s$neighbourhood_group_cleansed == "Kauai", 1, 0)
june_s$maui_neighbourhood <- ifelse(june_s$neighbourhood_group_cleansed == "Maui", 1, 0)


# missing value check for accomodates in June
june_s %>% count(accommodates)            # There is no missing value only one value is 0 which doesnt make sense as an accomodation doesnt have accomodate.
june_s %>% filter(accommodates==0)        # one value has 0 accomodate with id:43309266 to understand the situation the website is checked realized that it is an hotel and has wrong number of accomodates. 

typeof(june_s$accommodates)               # no problem with the type of variable as it is integer. 

#As there is one row may effect the result, that row is removed from june dataset. 
june_s %>% 
  filter(id==43309266)
june_s<- subset(june_s, id!="43309266")     #from the june data set the listing with id==43309266 is removed.

# Data preperation for variable instant_bookable


# Checking for missing values
june_s %>% count(instant_bookable) #no missing value, 10143 listing with instant bookable and 16201 listing with no instant bookable values.

#checking for type
typeof(june_s$instant_bookable)   # now it is character

# june data set changing type to double and changing values from t,f to 1,0.
june_s$instant_bookable_dummy <- ifelse(june_s$instant_bookable == "t", 1, 0) 

#check if beds variable contains NA
any(is.na(june_s$beds)) # contains NA

#check if bedrooms variable contains NA
any(is.na(june_s$bedrooms)) # contains NA

#check range of number of bedrooms and other summary statistics
summary(june_s$bedrooms) # contains 3534 NAs

#check range of number of beds and other summary statistics
summary(june_s$beds) # contains 310 NAs

#code to transform the bathrooms_text column into a workable column
#i create 1 dummy column showing whether the bathroom is private/shared
sum(is.na(june_s$bathrooms)) #checking if all bathrooms column is NA
unique(june_s$bathrooms_text) #checking the existing unique types of bathrooms

# june dataset
#creating dummies for shared and private 
june_s$bathroom_shared <- ifelse(str_detect(june_s$bathrooms_text, 'shared|Shared'), 1, 0)

#replacing empty bathrooms_text with NAs
sum(june_s$bathrooms_text == "")

june_s %>% filter(bathrooms_text=="") 

june_s$bathrooms_text[june_s$bathrooms_text==""]<-NA
sum(is.na(june_s$bathrooms_text))


#putting the number of bathrooms into the right bathrooms column
june_s$bathrooms <- as.double(word(june_s$bathrooms_text,1)) 


#putting 0.5 for each half bath
june_s$bathrooms[str_detect(june_s$bathrooms_text, 'Private|Shared|Half')]<-0.5

# for the june dataset, there are only 22 NAs in the bathrooms column; these will be ignored during the regression analysis

# Inspect room_type variable
sum(is.na(june_s$room_type)) #checking if room type column has NA

june_s %>% group_by(room_type) %>% summarise(number_of_observations = n(), nrlistings = sum(id)) #checking number of listings per room type 

#Recode room_type into 3 dummy variables (hotel room is the baseline)

# june_s data set
june_s$entire_home_apt_room_type <- ifelse(june_s$room_type == "Entire home/apt", 1, 0)
june_s$private_room_room_type <- ifelse(june_s$room_type == "Private room", 1, 0)
june_s$shared_room_room_type <- ifelse(june_s$room_type == "Shared room", 1, 0)

# change NA in bedrooms variable into 1 if room type is private room 
june_s$bedrooms<- ifelse(june_s$private_room_room_type == 1 & is.na(june_s$bedrooms), 1, june_s$bedrooms)

# Change NA in bedrooms variable into 1 if room type is hotel room
june_s$bedrooms<- ifelse(june_s$private_room_room_type == 0 & june_s$entire_home_apt_room_type == 0 & june_s$shared_room_room_type == 0 & is.na(june_s$bedrooms), 1, june_s$bedrooms)

# Change NA in bedrooms variable into 1 if room type is shared room
june_s$bedrooms<- ifelse(june_s$shared_room_room_type == 1 & is.na(june_s$bedrooms), 1, june_s$bedrooms)

# Remaining NAs are changed into the mean of bedrooms per each room type
june_s$bedrooms[is.na(june_s$bedrooms) & june_s$room_type == "Entire home/apt"] <- mean(june_s$bedrooms[june_s$room_type == "Entire home/apt"],na.rm = TRUE)
june_s$bedrooms[is.na(june_s$bedrooms) & june_s$room_type == "Private room"] <- mean(june_s$bedrooms[june_s$room_type == "Private room"],na.rm = TRUE)
june_s$bedrooms[is.na(june_s$bedrooms) & june_s$room_type == "Hotel room"] <- mean(june_s$bedrooms[june_s$room_type == "Hotel room"],na.rm = TRUE)
june_s$bedrooms[is.na(june_s$bedrooms) & june_s$room_type == "Shared room"] <- mean(june_s$bedrooms[june_s$room_type == "Shared room"],na.rm = TRUE)

#check if there are NA's left
summary(june_s$bedrooms)

#take rounded values
june_s$bedrooms <- round(june_s$bedrooms)

# change NA in beds variable into 1 if listing accommodates 1 person
june_s$beds <- ifelse(june_s$accommodates == 1 & is.na(june_s$beds), 1, june_s$beds)

# Remaining NAs are changed into the mean of beds per room type
june_s$beds[is.na(june_s$beds) & june_s$room_type == "Entire home/apt"] <- mean(june_s$beds[june_s$room_type == "Entire home/apt"],na.rm = TRUE)
june_s$beds[is.na(june_s$beds) & june_s$room_type == "Private room"] <- mean(june_s$beds[june_s$room_type == "Private room"],na.rm = TRUE)
june_s$beds[is.na(june_s$beds) & june_s$room_type == "Hotel room"] <- mean(june_s$beds[june_s$room_type == "Hotel room"],na.rm = TRUE)
june_s$beds[is.na(june_s$beds) & june_s$room_type == "Shared room"] <- mean(june_s$beds[june_s$room_type == "Shared room"],na.rm = TRUE)

#check if there are NA's left
summary(june_s$beds)

#take rounded values
june_s$beds <- round(june_s$beds)
