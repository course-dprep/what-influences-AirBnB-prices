#Data preperation for variable "accommodates".


# missing value check for accomodates in June
june %>% count(accommodates)            # There is no missing value only one value is 0 which doesnt make sense as an accomodation doesnt have accomodate.
june %>% filter(accommodates==0)        # one value has 0 accomodate with id:43309266 to understand the situation the website is checked realized that it is an hotel and has wrong number of accomodates. 

# missing value check for accomodates in Dec
dec %>% count(accommodates)             # only one value is missing 
dec %>% filter(accommodates==0)         # again the same only one value has 0 with id:43309266 

# missing value check for accomodates in Mar
mar %>% count(accommodates)             # only one value is missing 
mar %>% filter(accommodates==0)         # again the same only one value has 0 with id:43309266 

# type check for accomodates in Mar. all date sets are integer, there is no problem. 
typeof(june$accommodates)               # no problem with the type of variable as it is integer. 
typeof(dec$accommodates)                # no problem with the type of variable as it is integer. 
typeof(mar$accommodates)                # no problem with the type of variable as it is integer. 


#As there is one row may effect the result, that row is removed from june dataset. 
june %>% 
  filter(id==43309266)
june<- subset(june, id!="43309266")     #from the june data set the listing with id==43309266 is removed.

#As there is one row may effect the result, that row is removed from dec dataset.
dec %>% 
  filter(id==43309266)
dec<- subset(dec, id!="43309266")       #from the dec data set the listing with id==43309266 is removed.

#As there is one row may effect the result, that row is removed from march dataset.
mar %>% 
  filter(id==43309266)
mar<- subset(mar, id!="43309266")       #from the march data set the listing with id==43309266 is removed.



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





