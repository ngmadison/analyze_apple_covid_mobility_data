# Script to read in a csv file of subsetted Apple mobility data for any US state
# and write a new csv file only including transportation tallies for this subset
# using function in the code/functions directory

# Madison Ng
# February 24, 2021
# mtng2@dons.usfca.edu

# load function
source("code/functions/city_county_transport_tally.R")

# test use of function with normal data file
city_county_transport_tally(
  input_file_name = "output/applemobilitytrends-2021-02-22_Arizona.csv",
  state_to_tally = "Arizona")


# test use of function with data file missing information
city_county_transport_tally(
  input_file_name = paste0("output/",
                           "applemobilitytrends-2021-02-22_",
                           "Hawaii_missing_rows_test.csv"),
  state_to_tally = "Hawaii")
