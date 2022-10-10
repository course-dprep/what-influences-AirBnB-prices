# merge march listings and calendar
# Rename listings_id to id for merging
calendar_m_s<- calendar_m_s %>% rename(id = listing_id)

# Now lists, transform to data frames
#mar_s <- data.frame(mar_s)
#calendar_m_s <- data.frame(calendar_m_s)

# Merge the datasets
merged_mar <- merge(mar_s,calendar_m_s)

# merge june listings and calendar
# Rename listings_id to id for merging
calendar_j_s<- calendar_j_s %>% rename(id = listing_id)

# Now lists, transform to data frames
#june_s <- data.frame(june_s)
#calendar_j_s <- data.frame(calendar_j_s)

# Merge the datasets
merged_june <- merge(june_s,calendar_j_s)

# merge december listings and calendar
# Rename listings_id to id for merging
calendar_d_s<- calendar_d_s %>% rename(id = listing_id)

# Now lists, transform to data frames
#dec_s <- data.frame(dec_s)
#calendar_d_s <- data.frame(calendar_d_s)

# Merge the datasets
merged_dec <- merge(dec_s,calendar_d_s)
