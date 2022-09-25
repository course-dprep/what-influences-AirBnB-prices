#code to transform the bathrooms_text column into a workable column
#i create 2 dummy columns showing whether the bathroom is private/shared/not mentioned
library(tidyverse)
library(stringr)

#here i just take a smaller sample of the main table to work faster, no need to copy this
#df <- head(june, 200)
#df <- df %>% select(id, bathrooms, bathrooms_text)

sum(is.na(june_s$bathrooms)) #checking if all bathrooms column is NA
unique(june_s$bathrooms_text) #checking the existing unique types of bathrooms

#creating dummies for shared and private ~replace with own table name
#df$bathroom_shared <- ifelse(str_detect(df$bathrooms_text, 'shared'), 1, 0)
#df$bathroom_private <- ifelse(str_detect(df$bathrooms_text, 'shared'), 0, 1)

june_s$bathroom_shared <- ifelse(str_detect(june_s$bathrooms_text, 'shared|Shared'), 1, 0)
june_s$bathroom_private <- ifelse(str_detect(june_s$bathrooms_text, 'shared|Shared'), 0, 1)

#replacing empty bathrooms_text with NAs
sum(june_s$bathrooms_text == "")


june_s %>% filter(bathrooms_text=="") 


june_s$bathrooms_text[june_s$bathrooms_text==""]<-NA
sum(is.na(june_s$bathrooms_text))

june_s$bathrooms <- ifelse(str_detect(june_s$bathrooms_text, 'Private'), 0.5, 0)
june_s$bathrooms <- ifelse(str_detect(june_s$bathrooms_text, 'Shared'), 0.5, 0)
june_s$bathrooms <- ifelse(str_detect(june_s$bathrooms_text, 'Half'), 0.5, 0)

june_s$bathrooms <- as.double(word(june_s$bathrooms_text,1)) #putting the number of bathrooms into the right bathrooms column

sum(is.na(june_s$bathrooms))

june_s %>% filter(str_detect(june_s$bathrooms_text, 'Private')) 

june_s$bathrooms[str_detect(june_s$bathrooms_text, 'Private|Shared|Half')]<-0.5
