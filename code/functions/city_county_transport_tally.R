# Script to create function to read in subsetted data for any US state
# and tally transportation type by city and/or county
# and write a csv with the tallied data.

# Madison Ng
# February 24, 2021
# mtng2@dons.usfca.edu

# load in dplyr
library("dplyr")

# create function to tally city/county transport type for any subsetted state
# end result should be CSV named based on state transportation data tallied
city_county_transport_tally <- function(input_file_name,
                                        state_to_tally) {
  # read in subsetted csv
  state_data <- read.csv(input_file_name)

  # defensive code to ensure data present before generating count table
  if (nrow(state_data) == 0) {
    stop("WARNING: No rows in data table. Is this the right input file?")
  }

  # refine data with dplyr to only include columns for geo_type, region, and
  # transportation_type
  count_cities_counties_by_type <- state_data %>%
    select(geo_type, region, transportation_type) %>%
    group_by(geo_type, transportation_type) %>%
    tally()

  # defensive code to ensure data present before generating csv
  if (nrow(count_cities_counties_by_type) == is.logical(NA))  {
    print(count_cities_counties_by_type)
    stop("WARNING: Missing data in count table. Incorrect tallies may result.
         CSV will not be generated.")
  }

  # write new csv of tally results and save to output directory
  write.csv(count_cities_counties_by_type,
            file = paste0("output/",
                          "tally_outputs/",
                          "city_county_transport_tally",
                          "_",
                          state_to_tally,
                          ".csv"))
}
