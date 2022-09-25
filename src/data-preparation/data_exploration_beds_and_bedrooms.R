#check if beds variable contains NA
any(is.na(dec_s$beds))
any(is.na(june_s$beds))
any(is.na(mar_s$beds))

#check if bedrooms variable contains NA
any(is.na(dec_s$bedrooms))
any(is.na(june_s$bedrooms))
any(is.na(mar_s$bedrooms))

#check range of number of bedrooms and other summary statistics
summary(dec_s$bedrooms)
summary(june_s$bedrooms)
summary(mar_s$bedrooms)

#check range of number of beds and other summary statistics
summary(dec_s$beds)
summary(june_s$beds)
summary(mar_s$beds)
