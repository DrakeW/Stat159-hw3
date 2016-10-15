# Stat159 HW3 - Multiple Regression Analysis

Introduction
---
This is the third homework of **Statistics 159: Reproducible and Collaborative Statistical Data Science** at UC Berkeley.

In this homework we reproduce the main results of simple regression analysis displayed in section 3.2 *Multiple Linear Regression* (chapter 3) of the book *[An Introduction to Statistical Learning](http://www-bcf.usc.edu/~gareth/ISL/)*.

## Structure

The structure of this project is listed as following:

```
stat159-fall2016-hw03/
    .gitignore
    README.md
    LICENSE
    Makefile
    session-info.txt
    code/
        README.md
        test-that.R
        functions/
            regression-functions.R
        scripts/
            eda-script.R
            regression-script.R
            session-info-script.R
    data/
    	README.md
    	Advertising.csv
    	eda-output.txt
        correlation-matrix.RData
    	regression.RData
    images/
        histogram-sales.png
        histogram-tv.png
        histogram-radio.png
        histogram-newspaper.png
        scatterplot-matrix.png
        scatterplot-tv-sales.png
        scatterplot-radio-sales.png
        scatterplot-newspaper-sales.png
        residual-plot.png
        scale-location-plot.png
        normal-qq-plot.png
    report/
    	report.Rmd
    	report.pdf
```

Reproduction Steps
---
1. clone repository using `git clone`
2. `cd` into cloned directory and run `make`

Author
---
Junyu Wang

License
---

All media contents are licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).

All code is licensed under [BSD-2.0](https://opensource.org/licenses/BSD-2-Clause).

