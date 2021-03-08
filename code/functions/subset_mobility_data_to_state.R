# Script to read in Apple mobility data from a csv file
# and subset data to just include rows from any US state
# and write out a csv file that only includes this subset.

# Madison Ng
# mtng2@dons.usfca.edu
# February 22, 2021

# create a function to subset any US state out of the full dataset
# this should also create an output CSV named based on the state subsetted
subset_mobility_data_to_state <- function(input_file_name,
                                          state_to_subset) {
  # read in complete csv file
  full_covid_data <- read.csv(input_file_name)

  # subset dataset to only include rows where sub.region column has
  # that state name in it, but include all other columns.
  state_data <- full_covid_data[full_covid_data$sub.region == state_to_subset, ]

  # check subsetted data actually has data present
  if (nrow(state_data) == 0) {
    stop("ERROR: No rows matching given state name. Possible typo.")
  }

  # save US state data to new csv file in output directory
  write.csv(state_data, file = paste0("output/",
                                      "subset_states_wide/",
                                     tools::file_path_sans_ext(
                                       basename(input_file_name)),
                                      "_",
                                      state_to_subset,
                                      ".csv"))
}
