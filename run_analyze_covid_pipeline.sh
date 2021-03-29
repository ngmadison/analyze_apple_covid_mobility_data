#!/bin/bash

# Bash script for rendering Rmarkdown file using parameters passed in from shell

Rscript -e "rmarkdown::render('analysis.Rmd')"
