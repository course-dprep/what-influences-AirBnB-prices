#code to transform the bathrooms_text column into a workable column
#i create 1 dummy column showing whether the bathroom is private/shared
library(tidyverse)
library(stringr)


sum(is.na(june_s$bathrooms)) #checking if all bathrooms column is NA
unique(june_s$bathrooms_text) #checking the existing unique types of bathrooms

# june dataset
#creating dummies for shared and private 
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

# for the june dataset, there are only 22 NAs in the bathrooms column; these will be ignored during the regression analysis


#march dataset
mar_s$bathroom_shared <- ifelse(str_detect(mar_s$bathrooms_text, 'shared|Shared'), 1, 0)

#replacing empty bathrooms_text with NAs
sum(mar_s$bathrooms_text == "")

mar_s %>% filter(bathrooms_text=="") 

mar_s$bathrooms_text[mar_s$bathrooms_text==""]<-NA
sum(is.na(mar_s$bathrooms_text))


#putting the number of bathrooms into the right bathrooms column
mar_s$bathrooms <- as.double(word(mar_s$bathrooms_text,1)) 

# for the march dataset, there are only 23 NAs in the bathrooms column; these will be ignored during the regression analysis

#putting 0.5 for each half bath
mar_s$bathrooms[str_detect(mar_s$bathrooms_text, 'Private|Shared|Half')]<-0.5

# december dataset
dec_s$bathroom_shared <- ifelse(str_detect(dec_s$bathrooms_text, 'shared|Shared'), 1, 0)

#replacing empty bathrooms_text with NAs
sum(dec_s$bathrooms_text == "")

dec_s %>% filter(bathrooms_text=="") 

dec_s$bathrooms_text[dec_s$bathrooms_text==""]<-NA
sum(is.na(dec_s$bathrooms_text))


#putting the number of bathrooms into the right bathrooms column
dec_s$bathrooms <- as.double(word(dec_s$bathrooms_text,1)) 

# for the december dataset, there are only 29 NAs in the bathrooms column; these will be ignored during the regression analysis

#putting 0.5 for each half bath
dec_s$bathrooms[str_detect(dec_s$bathrooms_text, 'Private|Shared|Half')]<-0.5


