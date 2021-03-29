# Analyzing Apple Mobility Data in the Covid-19 Era

Madison Ng  
mtng2@dons.usfca.edu

The goal of this project is to analyze mobility data made available by Apple.

Data obtained from the following URL:
https://covid19.apple.com/mobility

Currently uses dplyr to work with some of the tabular data and ggplot2 to visualize data set.

### Change Log
* 2021-03-29: Parametereized Rmd and added bash script to knit file.
* 2021-03-26: Added safety check to address issue of ggplot failing silently in Rmd.
* 2021-03-13: Resolved plotting errors in in analysis.Rmd and generated test figures.
* 2021-03-13: Added return statements to functions, corrected carryover errors from switching between read.csv and read_csv.
* 2021-03-12: Continue function and associated script dplyr and/or readr modifications. Object naming and state name style for file naming also updated.
* 2021-03-11: Converted all three functions to use dplyr and/or readr as needed.
* 2021-03-08: Create 03 script to test long form data conversion function. Output saved in output/subset_states_long directory.
* 2021-03-07: Created R markdown file of analysis. output/figures directory also generated for later.
* 2021-03-07: Modified functions and associated scripts to reflect updated output directory names that more accurately reflect content.
* 2021-03-03: Created function to convert subsetted data to long form.
* 2021-02-27: Reorganized files in output directory and updated functions to reflect new output locations.
* 2021-02-26: Archived original 02 script. Added for loop to new version of 02 script.
* 2021-02-26: Added defensive code to city_county_transport_tally function.
* 2021-02-26: Added for loop to new version of 01 script.
* 2021-02-26: Archived original 01 script.
* 2021-02-25: Updated 01 script to use most recently downloaded Apple mobility data in data/raw_data directory.
* 2021-02-24: Created new function using code from 02 script to tally count of city and county transportation data in any given state
* 2021-02-24: Linked project repository to Github.
* 2021-02-24: Added second script using dplyr to tally count of cities and counties in given state that have data for different transportation types.
* 2021-02-22: Initialized a git repository in this project.
* 2021-02-22: A new version of the data file was downloaded. I also refactored the code to be more general and allow any state to be subset from the larger file.
* 2021-02-06: Data file downloaded for analysis.
