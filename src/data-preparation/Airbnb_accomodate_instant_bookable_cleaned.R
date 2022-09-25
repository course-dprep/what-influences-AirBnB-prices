
# Data preperation for variable instant_bookable

# Checking for missing values
june %>% count(instant_bookable) #no missing value, 10143 listing with instant bookable and 16201 listing with no instant bokkable values.
dec %>% count(instant_bookable)  #no missing value
mar %>% count(instant_bookable)  #no missing value



#checking for type
typeof(june$instant_bookable)   # now it is character
typeof(mar$instant_bookable)    # now it is character
typeof(dec$instant_bookable)    # now it is character


# june data set changing type to double and changing values from t,f to 1,0.
june$instant_bookable_dummy <- ifelse(june$instant_bookable == "t", 1, 0) 
june$instant_bookable_dummy
typeof(june$instant_bookable_dummy) 

# dec data set changing type to double and changing values from t,f to 1,0.
dec$instant_bookable_dummy <- ifelse(dec$instant_bookable == "t", 1, 0) 
dec$instant_bookable_dummy
typeof(dec$instant_bookable_dummy) 

# mar data set changing type to double and changing values from t,f to 1,0.
mar$instant_bookable_dummy <- ifelse(mar$instant_bookable == "t", 1, 0) 
mar$instant_bookable_dummy
typeof(mar$instant_bookable_dummy) 

# Summary: 
# First regarding to "accommodates" variable one row is removed from all three data sets (june,dec,mar) as it is not logical for a airbnb listing does not accomodate anyone. After checking the Airbnb site it is acknowledged that this listing belongs to a hotel. And probably made a data entry error.  
# Second regarding to "instant_bookable" not any missing values identified, and created a new dummy variable called instant_bookable_dummy for all three data sets(june,dec,mar).





