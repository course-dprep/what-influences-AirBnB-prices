# june dataset
# change variable types of price and adjusted_price
calendar_j$price_n <- substring(calendar_j$price,2)
calendar_j$adjusted_price_n <- substring(calendar_j$price,2)

calendar_j$price_n <- as.double(calendar_j$price_n)
calendar_j$adjusted_price_n <- as.double(calendar_j$adjusted_price_n)

typeof(calendar_j$price_n) # check variable type
typeof(calendar_j$adjusted_price_n)

# Inspect variables for NAs
sum(is.na(calendar_j$price_n))
sum(is.na(calendar_j$adjusted_price_n))

# Check if price and adjusted_price are different
calendar_j$difference_p <- calendar_j$price_n - calendar_j$adjusted_price_n
summary(calendar_j$difference_p)# no difference, work with price

# Creating smaller df containing only necessary columns of listings tables
library(tidyverse)
calendar_j_s <- calendar_j %>% select(listing_id, date, price_n)

# march dataset
calendar_m$price_n <- substring(calendar_m$price,2)
calendar_m$adjusted_price_n <- substring(calendar_m$price,2)

calendar_m$price_n <- as.double(calendar_m$price_n)
calendar_m$adjusted_price_n <- as.double(calendar_m$adjusted_price_n)

calendar_m_s <- calendar_m %>% select(listing_id, date, price_n)

# december dataset
calendar_d$price_n <- substring(calendar_d$price,2)
calendar_d$adjusted_price_n <- substring(calendar_d$price,2)

calendar_d$price_n <- as.double(calendar_d$price_n)
calendar_d$adjusted_price_n <- as.double(calendar_d$adjusted_price_n)

calendar_d_s <- calendar_d %>% select(listing_id, date, price_n)
