# Script to read in csv file for subsetted state mobility data
# and convert it to long format before writing it to a new csv

# Madison Ng
# mtng2@dons.usfca.edu
# March 3, 2021

# create function to convert mobility data from wide to long form
convert_wide_to_long <- function(input_wide_data) {

  # load in packages
  library("tidyr")
  library("readr")

  # read in the csv
  state_wide_data <- readr::read_csv(input_wide_data)

  # convert to long format data table, fix data display
  fixed_wide_data <- state_wide_data %>%
    tidyr::pivot_longer(
      cols = starts_with("X202"),
      names_to = "date",
      names_prefix = "X",
      values_to = "frequency"
    )

  # trying to fix date data style
  # chartr(".", "-", fixed_wide_data$date)

  # write new csv of long format data
  readr::write_csv(fixed_wide_data,
                   file = paste0("output/",
                                 "subset_states_long/",
                                 tools::file_path_sans_ext
                                 (basename(input_wide_data)),
                                 "_",
                                 "long",
                                 ".csv"))
}
