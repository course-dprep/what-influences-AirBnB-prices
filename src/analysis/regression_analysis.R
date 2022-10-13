load("gen/data-preparation/output/merged_june.RData")

# Linear Regression 
merged_june_lm <- lm(price_n ~ bathrooms + accommodates + beds + bedrooms + review_scores_rating + bathroom_shared + hawaii_neighbourhood + kauai_neighbourhood + maui_neighbourhood +entire_home_apt_room_type + private_room_room_type + shared_room_room_type + instant_bookable_dummy + time_diff + winter, merged_june, na.action = na.omit)
summary(merged_june_lm)

save(merged_june_lm,file="gen/analysis/output/merged_june_lm.RData")
