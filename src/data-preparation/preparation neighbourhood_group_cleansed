# Inspect neighbourhood_group_cleaned variable
sum(is.na(june_s$neighbourhood_group_cleansed)) #checking if neighbourhood column has NA
sum(is.na(dec_s$neighbourhood_group_cleansed))
sum(is.na(mar_s$neighbourhood_group_cleansed))

june_s %>% group_by(neighbourhood_group_cleansed) %>% summarise(number_of_observations = n(), nrlistings = sum(id)) #checking number of listings per neighbourhood group 
dec_s %>% group_by(neighbourhood_group_cleansed) %>% summarise(number_of_observations = n(), nrlistings = sum(id)) 
mar_s %>% group_by(neighbourhood_group_cleansed) %>% summarise(number_of_observations = n(), nrlistings = sum(id)) 

# Recode neighbourhood_group_cleaned into a working format: 3 dummy variables (with Honolulu as baseline as the capital)

# june_s data set
june_s$hawaii_neighbourhood <- ifelse(june_s$neighbourhood_group_cleansed == "Hawaii", 1, 0)
june_s$kauai_neighbourhood <- ifelse(june_s$neighbourhood_group_cleansed == "Kauai", 1, 0)
june_s$maui_neighbourhood <- ifelse(june_s$neighbourhood_group_cleansed == "Maui", 1, 0)

# dec_s data set
dec_s$hawaii_neighbourhood <- ifelse(dec_s$neighbourhood_group_cleansed == "Hawaii", 1, 0)
dec_s$kauai_neighbourhood <- ifelse(dec_s$neighbourhood_group_cleansed == "Kauai", 1, 0)
dec_s$maui_neighbourhood <- ifelse(dec_s$neighbourhood_group_cleansed == "Maui", 1, 0)

# mar_s data set
mar_s$hawaii_neighbourhood <- ifelse(mar_s$neighbourhood_group_cleansed == "Hawaii", 1, 0)
mar_s$kauai_neighbourhood <- ifelse(mar_s$neighbourhood_group_cleansed == "Kauai", 1, 0)
mar_s$maui_neighbourhood <- ifelse(mar_s$neighbourhood_group_cleansed == "Maui", 1, 0)
