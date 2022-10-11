All: gen/data-preparation/temp/june.RData gen/data-preparation/temp/calendar_j.RData gen/data-preparation/output/calendar_j_s.RData gen/data-preparation/output/june_s.RData gen/data-preparation/output/merged_june.RData gen/analysis/output/merged_june_lm.RData

gen/data-preparation/temp/june.RData gen/data-preparation/temp/calendar_j.RData: src/data-preparation/download_june.R
	R --vanilla < src/data-preparation/download_june.R

gen/data-preparation/output/calendar_j_s.RData: src/data-preparation/preparation_calendar.R
	R --vanilla < src/data-preparation/preparation_calendar.R

gen/data-preparation/output/june_s.RData: src/data-preparation/preparation_listings.R
	R --vanilla < src/data-preparation/preparation_listings.R

gen/data-preparation/output/merged_june.RData: src/data-preparation/merge_ds.R
	R --vanilla < src/data-preparation/merge_ds.R

gen/analysis/output/merged_june_lm.RData: src/data-preparation/merge_ds.R
	R --vanilla < src/analysis/regression_analysis.R

