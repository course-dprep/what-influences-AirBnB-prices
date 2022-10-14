DATA = ../../data
TEMP = ../../gen/data-preparation/temp
OUTPUT_DP=../../gen/data-preparation/output

all: $(TEMP)/june.RData $(TEMP)/calendar_j.RData $(OUTPUT_DP)/calendar_j_s.RData $(OUTPUT_DP)/june_s.RData $(OUTPUT_DP)/merged_june.RData

../../gen/data-preparation/temp/june.RData ../../gen/data-preparation/temp/calendar_j.RData: ../../src/data-preparation/download_june.R
	R --vanilla < download_june.R

../../gen/data-preparation/output/calendar_j_s.RData: ../../src/data-preparation/preparation_calendar.R
	R --vanilla < preparation_calendar.R

../../gen/data-preparation/output/june_s.RData: ../../src/data-preparation/preparation_listings.R
	R --vanilla < preparation_listings.R

../../gen/data-preparation/output/merged_june.RData: ../../src/data-preparation/merge_ds.R
	R --vanilla < merge_ds.R