# june dataset
# change date type from character to date
calendar_j_s$date <- as.Date(calendar_j_s$date)
typeof(calendar_j_s$date)#check

# Add new variable with time until booking
calendar_j_s$time_diff<- as.numeric(calendar_j_s$date-as.Date("2022-06-08"))

# march dataset
calendar_m_s$date <- as.Date(calendar_m_s$date)
calendar_m_s$time_diff<- as.numeric(calendar_m_s$date-as.Date("2022-03-12"))

# december dataset
calendar_d_s$date <- as.Date(calendar_d_s$date)
calendar_d_s$time_diff<- as.numeric(calendar_d_s$date-as.Date("2021-12-11"))
