# Script to read in csv file for subsetted state mobility data
# and convert it to long format before writing it to a new csv

# read in the csv
california_long_data <- readr::read_csv(
  "output/subset_outputs/applemobilitytrends-2021-02-22_California.csv"
)

# load in tidyr
library(tidyr)

# convert to long format data table
fixed_california_data <- california_long_data %>%
tidyr::pivot_longer(
  cols = starts_with("X202"),
  names_to = "date",
  names_prefix = "X",
  values_to = "frequency",
  )

# trying to fix date data style
# chartr(".", "-", fixed_california_data$date)

# write new csv of long format data
readr::write_csv(fixed_california_data,
                 file = paste0("output/",
                               "california_mobility_data_long.csv"))
