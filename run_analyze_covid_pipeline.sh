#!/bin/bash

# Bash script for rendering Rmarkdown file using parameters passed in from shell

# This script expects three command line parameters
# The first should be a US state, the second a city in that state, and third
# the raw Apple Covid mobility data csv downloaded from apple.com

# Madison Ng
# mtng2@dons.usfca.edu
# March 29, 2021

if [ $# -eq 0 ]
then
  echo "Supply three arguments to run this script:"
  echo "First, pick a US state to analyze."
  echo "Second, select a city in that state. Reference data for available names."
  echo "Finally, include the path to the mobility data csv."
  echo "Trouble? Try putting names with spaces in double quotes."
  exit 1
fi

state=$1
state=${state// /_}

city=$2
city=${city// /_}

Rscript -e "rmarkdown::render('Analysis.Rmd',\
            params = list(state = '$1',\
            city = '$2',\
            data = '$3'),\
            output_dir = 'output/analysis_from_covid_pipeline',\
            output_file = 'Analysis_${state}_${city}')"
