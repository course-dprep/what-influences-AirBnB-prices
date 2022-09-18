#creating smaller df containing only necessary columns of listings tables
library(tidyverse)
#summary(june)
june_s <- june %>% select(id, bathrooms, bathrooms_text, neighbourhood_group_cleansed, room_type, accommodates,
                          bedrooms, beds, instant_bookable, review_scores_rating)
mar_s <- mar %>% select(id, bathrooms, bathrooms_text, neighbourhood_group_cleansed, room_type, accommodates,
                        bedrooms, beds, instant_bookable, review_scores_rating)
dec_s <- dec %>% select(id, bathrooms, bathrooms_text, neighbourhood_group_cleansed, room_type, accommodates,
                        bedrooms, beds, instant_bookable, review_scores_rating)