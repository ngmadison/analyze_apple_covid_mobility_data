#!/bin/bash

# Bash script for rendering Rmarkdown file using parameters passed in from shell

Rscript -e "rmarkdown::render('analysis.Rmd', \
            params = list(state = 'Wyoming',\
            data = 'data/raw_data/applemobilitytrends-2021-03-06.csv'))"
