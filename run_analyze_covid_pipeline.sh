#!/bin/bash

# Bash script for rendering Rmarkdown file using parameters passed in from shell

# This script expects four command line parameters
# The first should be a US state, the second a city in that state,
# third the raw Apple Covid mobility data csv downloaded from apple.com,
# and fourth the sequence summary text file

# Madison Ng
# mtng2@dons.usfca.edu
# March 29, 2021

if [ $# -eq 0 ]
then
  echo "Supply three arguments to run this script:"
  echo "First, pick a US state to analyze."
  echo "Second, select a city in that state. Reference data for available names."
  echo "Third, include the path to the mobility data csv."
  echo "Finally, include the path to the sequence data summary txt file."
  echo "Trouble? Try putting city/state names in double quotes."
  exit 1
fi

state=$1
state=${state// /_}

city=$2
city=${city// /_}

RMD_PARAMS="params = list(state = '$1', city = '$2', data = '$3', seqdata = '$4')"
RMD_OUTPUT="output_dir = 'output', output_file = 'Analysis_${state}_${city}'"

Rscript -e "rmarkdown::render('analysis.Rmd', $RMD_PARAMS, $RMD_OUTPUT)"
