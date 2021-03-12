# basic test of convert_to_long_data function

# Madison Ng
# mtng2@dons.usfca.edu
# March 8, 2021

# load the function
source("code/functions/convert_to_long_data.R")

# select input file
make_long <- convert_wide_to_long(
  input_wide_data = paste0("output/subset_states_wide/",
                           "applemobilitytrends-2021-03-06_Wisconsin.csv"))
