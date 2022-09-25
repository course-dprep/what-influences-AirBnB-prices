# change NA in beds variable into 1 if listing accommodates 1 person
dec_s$beds <- ifelse(dec_s$accommodates == 1 & is.na(dec_s$beds), 1, dec_s$beds)
mar_s$beds <- ifelse(mar_s$accommodates == 1 & is.na(mar_s$beds), 1, mar_s$beds)
june_s$beds <- ifelse(june_s$accommodates == 1 & is.na(june_s$beds), 1, june_s$beds)