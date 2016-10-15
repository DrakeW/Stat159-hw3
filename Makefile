# Makefile -- run 'make' to reproduce the entire content

.PHONY: data tests eda regression report clean all

output = report/report.pdf

# does everything at once
all: clean session data eda regression tests report

# data preparation
data:
	cd data && curl -O http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv

# regression function testing
tests: code/test-that.R code/tests/test-regression.R
	RScript $<

# eda script execution	
eda: code/scripts/eda-script.R data
	RScript $<

# regression script execution
regression: code/scripts/regression-script.R data
	Rscript $<

# report generation and conversion
report: report/report.Rmd regression eda
	Rscript -e "library(rmarkdown); render('report/report.Rmd', 'pdf_document')"

# record and save session info 
session: code/scripts/session-info-script.R
	RScript $<
	
# clean existing report
clean:
	rm -f $(output)