#code to transform the bathrooms_text column into a workable column
#i create 1 dummy column showing whether the bathroom is private/shared
library(tidyverse)
library(stringr)


sum(is.na(june_s$bathrooms)) #checking if all bathrooms column is NA
unique(june_s$bathrooms_text) #checking the existing unique types of bathrooms

#creating dummies for shared and private ~replace with own table name
june_s$bathroom_shared <- ifelse(str_detect(june_s$bathrooms_text, 'shared|Shared'), 1, 0)

#replacing empty bathrooms_text with NAs
sum(june_s$bathrooms_text == "")

june_s %>% filter(bathrooms_text=="") 

june_s$bathrooms_text[june_s$bathrooms_text==""]<-NA
sum(is.na(june_s$bathrooms_text))


#putting the number of bathrooms into the right bathrooms column
june_s$bathrooms <- as.double(word(june_s$bathrooms_text,1)) 


#putting 0.5 for each half bath
june_s$bathrooms[str_detect(june_s$bathrooms_text, 'Private|Shared|Half')]<-0.5


