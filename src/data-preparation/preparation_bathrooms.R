#code to transform the bathrooms_text column into a workable column
#i create 2 dummy columns showing whether the bathroom is private/shared/not mentioned
library(tidyverse)
library(stringr)

#here i just take a smaller sample of the main table to work faster, no need to copy this
df <- head(june, 200)
df <- df %>% select(id, bathrooms, bathrooms_text)

sum(is.na(df$bathrooms)) #checking if all bathrooms column is NA
unique(df$bathrooms_text) #checking the existing unique types of bathrooms

#creating dummies for shared and private ~replace with own table name
df$bathroom_shared <- ifelse(str_detect(df$bathrooms_text, 'shared'), 1, 0)
df$bathroom_private <- ifelse(str_detect(df$bathrooms_text, 'private'), 1, 0)


df$bathrooms <- as.integer(word(df$bathrooms_text,1)) #putting the number of bathrooms into the right bathrooms column
