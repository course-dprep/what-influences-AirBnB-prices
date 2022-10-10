# change NA in beds variable into 1 if listing accommodates 1 person
dec_s$beds <- ifelse(dec_s$accommodates == 1 & is.na(dec_s$beds), 1, dec_s$beds)
mar_s$beds <- ifelse(mar_s$accommodates == 1 & is.na(mar_s$beds), 1, mar_s$beds)
june_s$beds <- ifelse(june_s$accommodates == 1 & is.na(june_s$beds), 1, june_s$beds)

# Remaining NAs are changed into the mean of beds per room type
dec_s$beds[is.na(dec_s$beds) & dec_s$room_type == "Entire home/apt"] <- mean(dec_s$beds[dec_s$room_type == "Entire home/apt"],na.rm = TRUE)
dec_s$beds[is.na(dec_s$beds) & dec_s$room_type == "Private room"] <- mean(dec_s$beds[dec_s$room_type == "Private room"],na.rm = TRUE)
dec_s$beds[is.na(dec_s$beds) & dec_s$room_type == "Hotel room"] <- mean(dec_s$beds[dec_s$room_type == "Hotel room"],na.rm = TRUE)
dec_s$beds[is.na(dec_s$beds) & dec_s$room_type == "Shared room"] <- mean(dec_s$beds[dec_s$room_type == "Shared room"],na.rm = TRUE)

mar_s$beds[is.na(mar_s$beds) & mar_s$room_type == "Entire home/apt"] <- mean(mar_s$beds[mar_s$room_type == "Entire home/apt"],na.rm = TRUE)
mar_s$beds[is.na(mar_s$beds) & mar_s$room_type == "Private room"] <- mean(mar_s$beds[mar_s$room_type == "Private room"],na.rm = TRUE)
mar_s$beds[is.na(mar_s$beds) & mar_s$room_type == "Hotel room"] <- mean(mar_s$beds[mar_s$room_type == "Hotel room"],na.rm = TRUE)
mar_s$beds[is.na(mar_s$beds) & mar_s$room_type == "Shared room"] <- mean(mar_s$beds[mar_s$room_type == "Shared room"],na.rm = TRUE)

june_s$beds[is.na(june_s$beds) & june_s$room_type == "Entire home/apt"] <- mean(june_s$beds[june_s$room_type == "Entire home/apt"],na.rm = TRUE)
june_s$beds[is.na(june_s$beds) & june_s$room_type == "Private room"] <- mean(june_s$beds[june_s$room_type == "Private room"],na.rm = TRUE)
june_s$beds[is.na(june_s$beds) & june_s$room_type == "Hotel room"] <- mean(june_s$beds[june_s$room_type == "Hotel room"],na.rm = TRUE)
june_s$beds[is.na(june_s$beds) & june_s$room_type == "Shared room"] <- mean(june_s$beds[june_s$room_type == "Shared room"],na.rm = TRUE)


#check if there are NA's left
summary(dec_s$beds)
summary(june_s$beds)
summary(mar_s$beds)

#take rounded values
dec_s$beds <- round(dec_s$beds)
june_s$beds <- round(june_s$beds)
mar_s$beds <- round(mar_s$beds)

