# change NA in bedrooms variable into 1 if room type is private room 
dec_s$bedrooms<- ifelse(dec_s$private_room_room_type == 1 & is.na(dec_s$bedrooms), 1, dec_s$bedrooms)
mar_s$bedrooms<- ifelse(mar_s$private_room_room_type == 1 & is.na(mar_s$bedrooms), 1, mar_s$bedrooms)
june_s$bedrooms<- ifelse(june_s$private_room_room_type == 1 & is.na(june_s$bedrooms), 1, june_s$bedrooms)

# Change NA in bedrooms variable into 1 if room type is hotel room
dec_s$bedrooms<- ifelse(dec_s$private_room_room_type == 0 & dec_s$entire_home_apt_room_type == 0 & dec_s$shared_room_room_type == 0 & is.na(dec_s$bedrooms), 1, dec_s$bedrooms)
mar_s$bedrooms<- ifelse(mar_s$private_room_room_type == 0 & mar_s$entire_home_apt_room_type == 0 & mar_s$shared_room_room_type == 0 & is.na(mar_s$bedrooms), 1, mar_s$bedrooms)
june_s$bedrooms<- ifelse(june_s$private_room_room_type == 0 & june_s$entire_home_apt_room_type == 0 & june_s$shared_room_room_type == 0 & is.na(june_s$bedrooms), 1, june_s$bedrooms)

# Change NA in bedrooms variable into 1 if room type is shared room
dec_s$bedrooms<- ifelse(dec_s$shared_room_room_type == 1 & is.na(dec_s$bedrooms), 1, dec_s$bedrooms)
mar_s$bedrooms<- ifelse(mar_s$shared_room_room_type == 1 & is.na(mar_s$bedrooms), 1, mar_s$bedrooms)
june_s$bedrooms<- ifelse(june_s$shared_room_room_type == 1 & is.na(june_s$bedrooms), 1, june_s$bedrooms)

# Remaining NAs are changed into the mean of bedrooms per each room type

unique(dec_s$room_type)

dec_s$bedrooms[is.na(dec_s$bedrooms) & dec_s$room_type == "Entire home/apt"] <- mean(dec_s$bedrooms[dec_s$room_type == "Entire home/apt"],na.rm = TRUE)
dec_s$bedrooms[is.na(dec_s$bedrooms) & dec_s$room_type == "Private room"] <- mean(dec_s$bedrooms[dec_s$room_type == "Private room"],na.rm = TRUE)
dec_s$bedrooms[is.na(dec_s$bedrooms) & dec_s$room_type == "Hotel room"] <- mean(dec_s$bedrooms[dec_s$room_type == "Hotel room"],na.rm = TRUE)
dec_s$bedrooms[is.na(dec_s$bedrooms) & dec_s$room_type == "Shared room"] <- mean(dec_s$bedrooms[dec_s$room_type == "Shared room"],na.rm = TRUE)

mar_s$bedrooms[is.na(mar_s$bedrooms) & mar_s$room_type == "Entire home/apt"] <- mean(mar_s$bedrooms[mar_s$room_type == "Entire home/apt"],na.rm = TRUE)
mar_s$bedrooms[is.na(mar_s$bedrooms) & mar_s$room_type == "Private room"] <- mean(mar_s$bedrooms[mar_s$room_type == "Private room"],na.rm = TRUE)
mar_s$bedrooms[is.na(mar_s$bedrooms) & mar_s$room_type == "Hotel room"] <- mean(mar_s$bedrooms[mar_s$room_type == "Hotel room"],na.rm = TRUE)
mar_s$bedrooms[is.na(mar_s$bedrooms) & mar_s$room_type == "Shared room"] <- mean(mar_s$bedrooms[mar_s$room_type == "Shared room"],na.rm = TRUE)

june_s$bedrooms[is.na(june_s$bedrooms) & june_s$room_type == "Entire home/apt"] <- mean(june_s$bedrooms[june_s$room_type == "Entire home/apt"],na.rm = TRUE)
june_s$bedrooms[is.na(june_s$bedrooms) & june_s$room_type == "Private room"] <- mean(june_s$bedrooms[june_s$room_type == "Private room"],na.rm = TRUE)
june_s$bedrooms[is.na(june_s$bedrooms) & june_s$room_type == "Hotel room"] <- mean(june_s$bedrooms[june_s$room_type == "Hotel room"],na.rm = TRUE)
june_s$bedrooms[is.na(june_s$bedrooms) & june_s$room_type == "Shared room"] <- mean(june_s$bedrooms[june_s$room_type == "Shared room"],na.rm = TRUE)


#check if there are NA's left
summary(dec_s$bedrooms)
summary(june_s$bedrooms)
summary(mar_s$bedrooms)

#take rounded values
dec_s$bedrooms <- round(dec_s$bedrooms)
june_s$bedrooms <- round(june_s$bedrooms)
mar_s$bedrooms <- round(mar_s$bedrooms)