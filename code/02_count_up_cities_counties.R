# Script to read in a csv file of subsetted Apple mobility data for any US state
# and write a new csv file only including transportation tallies for this subset
# using function in the code/functions directory

# Madison Ng
# March 12, 2021
# mtng2@dons.usfca.edu

# load function
source("code/functions/city_county_transport_tally.R")

tally_chosen_state <- c("Hawaii",
                        "Virginia",
                        "Wisconsin",
                        "Maine",
                        "Arizona")

# test use of function with for loop
for (state_to_tally in tally_chosen_state) {

  chosen_state <- state_to_tally

  print(paste("Tally transportation data for", state_to_tally))

  # sub out spaces with underscores to ensure file is named properly
  state_no_spaces <- gsub(state_to_tally,
                          pattern = " ",
                          replacement = "_")

  # change "subset_states_wide/" directory to "subsets_for_defensive_tests/"
  # directory to test defenses
  # remember to change input file date as needed
  tally_chosen_state <- city_county_transport_tally(
  input_file_name = paste0("output/subset_states_wide/",
                           "applemobilitytrends-2021-03-11_",
                          state_no_spaces,
                          ".csv"),
  state_to_tally = chosen_state)

  print(paste(state_to_tally, "transportation data has been tallied."))
  print("-------")
}
