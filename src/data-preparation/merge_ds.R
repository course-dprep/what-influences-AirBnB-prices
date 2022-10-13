
# load R data -------------------------------------------------------------

load("gen/data-preparation/output/calendar_j_s.RData")
load("gen/data-preparation/output/june_s.RData")

# load libraries ----------------------------------------------------------

library(utils)
library(tidyverse)
library(stringr)


# merge calendar_j_s and june_s -------------------------------------------

  # Rename listings_id to id for merging
  calendar_j_s<- calendar_j_s %>% rename(id = listing_id)
  
  # Merge the datasets
  merged_june <- merge(june_s,calendar_j_s)
  
  #save the output
  save(merged_june,file="gen/data-preparation/output/merged_june.RData")