# change NA in bedrooms variable into 1 if room type is private room 
dec_s$bedrooms<- ifelse(dec_s$private_room_room_type == 1 & is.na(dec_s$bedrooms), 1, dec_s$bedrooms)
mar_s$bedrooms<- ifelse(mar_s$private_room_room_type == 1 & is.na(mar_s$bedrooms), 1, mar_s$bedrooms)
june_s$bedrooms<- ifelse(june_s$private_room_room_type == 1 & is.na(june_s$bedrooms), 1, june_s$bedrooms)

# Change NA in bedrooms variable into 1 if room type is hotel room
dec_s$bedrooms<- ifelse(dec_s$hotel_room_room_type == 1 & is.na(dec_s$bedrooms), 1, dec_s$bedrooms)
mar_s$bedrooms<- ifelse(mar_s$hotel_room_room_type == 1 & is.na(mar_s$bedrooms), 1, mar_s$bedrooms)
june_s$bedrooms<- ifelse(june_s$hotel_room_room_type == 1 & is.na(june_s$bedrooms), 1, june_s$bedrooms)

# Change NA in bedrooms variable into 1 if room type is shared room
dec_s$bedrooms<- ifelse(dec_s$shared_room_room_type == 1 & is.na(dec_s$bedrooms), 1, dec_s$bedrooms)
mar_s$bedrooms<- ifelse(mar_s$shared_room_room_type == 1 & is.na(mar_s$bedrooms), 1, mar_s$bedrooms)
june_s$bedrooms<- ifelse(june_s$shared_room_room_type == 1 & is.na(june_s$bedrooms), 1, june_s$bedrooms)

