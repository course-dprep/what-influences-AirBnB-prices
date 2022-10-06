#Data preperation for variable "accommodates".


# missing value check for accomodates in June
june_s %>% count(accommodates)            # There is no missing value only one value is 0 which doesnt make sense as an accomodation doesnt have accomodate.
june_s %>% filter(accommodates==0)        # one value has 0 accomodate with id:43309266 to understand the situation the website is checked realized that it is an hotel and has wrong number of accomodates. 

# missing value check for accomodates in Dec
dec_s %>% count(accommodates)             # only one value is missing 
dec_s %>% filter(accommodates==0)         # again the same only one value has 0 with id:43309266 

# missing value check for accomodates in Mar
mar_s %>% count(accommodates)             # only one value is missing 
mar_s %>% filter(accommodates==0)         # again the same only one value has 0 with id:43309266 

# type check for accomodates in Mar. all date sets are integer, there is no problem. 
typeof(june_s$accommodates)               # no problem with the type of variable as it is integer. 
typeof(dec_s$accommodates)                # no problem with the type of variable as it is integer. 
typeof(mar_s$accommodates)                # no problem with the type of variable as it is integer. 


#As there is one row may effect the result, that row is removed from june dataset. 
june_s %>% 
  filter(id==43309266)
june_s<- subset(june_s, id!="43309266")     #from the june data set the listing with id==43309266 is removed.

#As there is one row may effect the result, that row is removed from dec dataset.
dec_s %>% 
  filter(id==43309266)
dec_s<- subset(dec_s, id!="43309266")       #from the dec data set the listing with id==43309266 is removed.

#As there is one row may effect the result, that row is removed from march dataset.
mar_s %>% 
  filter(id==43309266)
mar_s<- subset(mar_s, id!="43309266")       #from the march data set the listing with id==43309266 is removed.



# Data preperation for variable instant_bookable


# Checking for missing values
june_s %>% count(instant_bookable) #no missing value, 10143 listing with instant bookable and 16201 listing with no instant bokkable values.
dec_s %>% count(instant_bookable)  #no missing value
mar_s %>% count(instant_bookable)  #no missing value

#checking for type
typeof(june_s$instant_bookable)   # now it is character
typeof(mar_s$instant_bookable)    # now it is character
typeof(dec_s$instant_bookable)    # now it is character

# june data set changing type to double and changing values from t,f to 1,0.
june_s$instant_bookable_dummy <- ifelse(june_s$instant_bookable == "t", 1, 0) 
june_s$instant_bookable_dummy
typeof(june_s$instant_bookable_dummy) 

# dec data set changing type to double and changing values from t,f to 1,0.
dec_s$instant_bookable_dummy <- ifelse(dec_s$instant_bookable == "t", 1, 0) 
dec_s$instant_bookable_dummy
typeof(dec_s$instant_bookable_dummy) 

# mar data set changing type to double and changing values from t,f to 1,0.
mar_s$instant_bookable_dummy <- ifelse(mar_s$instant_bookable == "t", 1, 0) 
mar_s$instant_bookable_dummy
typeof(mar_s$instant_bookable_dummy) 

# Summary: 
# First regarding to "accommodates" variable one row is removed from all three data sets (june,dec,mar) as it is not logical for a airbnb listing does not accomodate anyone. After checking the Airbnb site it is acknowledged that this listing belongs to a hotel. And probably made a data entry error.  
# Second regarding to "instant_bookable" not any missing values identified, and created a new dummy variable called instant_bookable_dummy for all three data sets(june,dec,mar).





