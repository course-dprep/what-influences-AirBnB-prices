OUTPUT_A = ../../gen/analysis/output

all: $(OUTPUT_A)/merged_june_lm.RData
../../gen/analysis/output/merged_june_lm.RData: ../../src/data-preparation/merge_ds.R
	R --vanilla < regression_analysis.R