SPACE		:= $() $()
STATE		:= Wisconsin
STATE_NOSPACE	:= $(subst $(SPACE),_,$(STATE))
CITY		:= Madison
CITY_NOSPACE	:= $(subst $(SPACE),_,$(CITY))
REPORT		:= Analysis_$(STATE_NOSPACE)_$(CITY_NOSPACE).html
OUTPUT		:= output
REPORT_PATH	:= $(OUTPUT)/$(REPORT)
R_FUNCTIONS	:= $(wildcard code/functions/*.R)
MOBILITY_DATA	:= data/raw_data/applemobilitytrends-2021-03-11.csv
SEQ_DATA	:= /blast-db/sars-cov-2-seq-data/2021-04-05_ncbi_sars_cov_2_sequences.fasta.gz
SEQ_SUMMARY	:= $(OUTPUT)/sort_country_seqs.txt

all: $(REPORT_PATH)

$(REPORT_PATH): analysis.Rmd references.bib $(R_FUNCTIONS) $(SEQ_SUMMARY) $(MOBILITY_DATA) run_analyze_covid_pipeline.sh
	bash run_analyze_covid_pipeline.sh "$(STATE)" "$(CITY)" "$(MOBILITY_DATA)" "$(SEQ_SUMMARY)"

$(SEQ_SUMMARY): code/process_sequences.sh $(SEQ_DATA)
	bash code/process_sequences.sh "$(SEQ_DATA)" > "$(SEQ_SUMMARY)"

clean:
	rm -fv output/*.html
	rm -fv analysis.html
	rm -fv output/*seqs.txt
	rm -fv output/*/*.csv
	rm -fv output/*/*.png
