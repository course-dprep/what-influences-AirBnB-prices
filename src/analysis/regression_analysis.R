# Linear Regression june
merged_june_lm <- lm(price_n ~ bathrooms + accommodates + beds + bedrooms + review_scores_rating + bathroom_shared + hawaii_neighbourhood + kauai_neighbourhood + maui_neighbourhood +entire_home_apt_room_type + private_room_room_type + shared_room_room_type + instant_bookable_dummy + time_diff, merged_june, na.action = na.omit)
summary(merged_june_lm)

# Linear Regression december
merged_dec_lm <- lm(price_n ~ bathrooms + accommodates + beds + bedrooms + review_scores_rating + bathroom_shared  + hawaii_neighbourhood + kauai_neighbourhood + maui_neighbourhood +entire_home_apt_room_type + private_room_room_type + shared_room_room_type + instant_bookable_dummy + time_diff, merged_dec, na.action = na.omit)
summary(merged_dec_lm)

# Linear Regression march
merged_mar_lm <- lm(price_n ~ bathrooms + accommodates + beds + bedrooms + review_scores_rating + bathroom_shared + hawaii_neighbourhood + kauai_neighbourhood + maui_neighbourhood +entire_home_apt_room_type + private_room_room_type + shared_room_room_type + instant_bookable_dummy + time_diff, merged_mar, na.action = na.omit)
summary(merged_mar_lm)

#Linear regression per seasons from june dataset
winter_lm <- lm(price_n ~ bathrooms + accommodates + beds + bedrooms + review_scores_rating + bathroom_shared + hawaii_neighbourhood + kauai_neighbourhood + maui_neighbourhood +entire_home_apt_room_type + private_room_room_type + shared_room_room_type + instant_bookable_dummy + time_diff, merged_june, na.action = na.omit)
summary(winter_lm)

summer_lm <- lm(price_n ~ bathrooms + accommodates + beds + bedrooms + review_scores_rating + bathroom_shared + hawaii_neighbourhood + kauai_neighbourhood + maui_neighbourhood +entire_home_apt_room_type + private_room_room_type + shared_room_room_type + instant_bookable_dummy + time_diff, merged_june, na.action = na.omit)
summary(summer_lm)