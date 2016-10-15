.PHONY: data tests eda regression report clean all

output = report/report.pdf

all: clean session data eda regression tests report

data:
	cd data && curl -O http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv

tests: code/test-that.R code/tests/test-regression.R
	RScript $<
	
eda: code/scripts/eda-script.R data
	RScript $<
	
regression: code/scripts/regression-script.R data
	Rscript $<
	
report: report/report.Rmd regression eda
	Rscript -e "library(rmarkdown); render('report/report.Rmd', 'pdf_document')"
	
session: code/scripts/session-info-script.R
	RScript $<
	
clean:
	rm -f $(output)