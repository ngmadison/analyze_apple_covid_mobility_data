# Script to read in Apple mobility data from a csv file
# and subset data to just include rows from any US state
# and write out a csv file that only includes this subset
# uses function in the code/functions directory

# Madison Ng
# mtng2@dons.usfca.edu
# February 22, 2021

# load functions
source("code/functions/subset_mobility_data_to_state.R")

# test use of function
subset_mobility_data_to_state(
  input_file_name = "data/raw_data/applemobilitytrends-2021-02-20.csv",
  state_to_subset = "New York")
