# Script to read in Apple mobility data from a csv file
# and subset data to just include rows from any US state
# and write out a csv file that only includes this subset
# uses function in the code/functions directory

# Madison Ng
# mtng2@dons.usfca.edu
# March 11, 2021

# load functions
source("code/functions/subset_mobility_data_to_state.R")

# vector to pick any state to subset
pick_any_state_vector <- c("Hawaii",
                           "Virginia",
                           "Wisconsin",
                           "Maine",
                           "Arizona")

# use of function via for loop
for (state_to_subset in pick_any_state_vector) {

  x <- state_to_subset

  print(paste("The state you chose is", state_to_subset))

  state_to_subset <- subset_mobility_data_to_state(
    input_file_name = "data/raw_data/applemobilitytrends-2021-03-06.csv",
    state_to_subset = x)

  print(paste(x, "data is subsetting"))
  print(paste(x, "data now subsetted."))
  print("--------")
}
