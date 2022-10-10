#check if beds variable contains NA
any(is.na(dec_s$beds)) # contains NA
any(is.na(june_s$beds)) # contains NA
any(is.na(mar_s$beds)) # contains NA

#check if bedrooms variable contains NA
any(is.na(dec_s$bedrooms)) # contains NA
any(is.na(june_s$bedrooms)) # contains NA
any(is.na(mar_s$bedrooms)) # contains NA

#check range of number of bedrooms and other summary statistics
summary(dec_s$bedrooms) # contains 3354 NAs
summary(june_s$bedrooms) # contains 3534 NAs
summary(mar_s$bedrooms) # contains 3483 NAs

#check range of number of beds and other summary statistics
summary(dec_s$beds) # contains 727 NAs
summary(june_s$beds) # contains 310 NAs
summary(mar_s$beds) # contains 328 NAs
