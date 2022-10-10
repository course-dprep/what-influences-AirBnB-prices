# Inspect room_type variable
sum(is.na(june_s$room_type)) #checking if room type column has NA
sum(is.na(dec_s$room_type)) 
sum(is.na(mar_s$room_type)) 

june_s %>% group_by(room_type) %>% summarise(number_of_observations = n(), nrlistings = sum(id)) #checking number of listings per room type 
dec_s %>% group_by(room_type) %>% summarise(number_of_observations = n(), nrlistings = sum(id)) 
mar_s %>% group_by(room_type) %>% summarise(number_of_observations = n(), nrlistings = sum(id)) 

#Recode room_type into 3 dummy variables (hotel room is the baseline)

# june_s data set
june_s$entire_home_apt_room_type <- ifelse(june_s$room_type == "Entire home/apt", 1, 0)
june_s$private_room_room_type <- ifelse(june_s$room_type == "Private room", 1, 0)
june_s$shared_room_room_type <- ifelse(june_s$room_type == "Shared room", 1, 0)

# dec_s data set
dec_s$entire_home_apt_room_type <- ifelse(dec_s$room_type == "Entire home/apt", 1, 0)
dec_s$private_room_room_type <- ifelse(dec_s$room_type == "Private room", 1, 0)
dec_s$shared_room_room_type <- ifelse(dec_s$room_type == "Shared room", 1, 0)

# mar_s data set
mar_s$entire_home_apt_room_type <- ifelse(mar_s$room_type == "Entire home/apt", 1, 0)
mar_s$private_room_room_type <- ifelse(mar_s$room_type == "Private room", 1, 0)
mar_s$shared_room_room_type <- ifelse(mar_s$room_type == "Shared room", 1, 0)
