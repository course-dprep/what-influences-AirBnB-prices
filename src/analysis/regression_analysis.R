load("gen/data-preparation/output/merged_june.RData")

#divide data per seasons 
#summer: May-Oct
#winter: Nov-April
merged_june$winter <- ifelse((merged_june$date >= as.Date("2022-11-01") & merged_june$date < as.Date("2023-04-01")), 1, 0) 


# Linear Regression june
merged_june_lm <- lm(price_n ~ bathrooms + accommodates + beds + bedrooms + review_scores_rating + bathroom_shared + hawaii_neighbourhood + kauai_neighbourhood + maui_neighbourhood +entire_home_apt_room_type + private_room_room_type + shared_room_room_type + instant_bookable_dummy + time_diff + winter, merged_june, na.action = na.omit)
summary(merged_june_lm)

save(merged_june_lm,file="gen/analysis/output/merged_june_lm.RData")