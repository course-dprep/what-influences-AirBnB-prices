#divide data per seasons 
#summer: May-Oct
#winter: Nov-April


winter <- merged_june %>% filter(date >= as.Date("2022-11-01") & date < as.Date("2023-04-01"))
summer1 <-  merged_june %>% filter(date >= as.Date("2022-06-08") & date < as.Date("2022-11-01"))
summer2 <-  merged_june %>% filter(date >= as.Date("2023-05-01") & date <= as.Date("2023-06-08"))  

summer <- rbind(summer1, summer2)
