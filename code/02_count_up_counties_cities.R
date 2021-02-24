# The goal of this script is to use the dplyr package to count the number of
# cities and counties in a given state that have detailed Apple mobility data
# available and then save it to a csv.

# Madison Ng
# February 24, 2021
# mtng2@dons.usfca.edu

# load "dplyr" package
library("dplyr")

# I want to get the count of cities and counties in a given state that have
# driving mobility data. The input for this will be the output of the previous
# script namely the state csv files that were already subsetted.

# load in data from previous script
input_file_name <- "output/applemobilitytrends-2021-02-20_New York.csv"
state_data <- read.csv(input_file_name)

# starting with dplyr chains
count_cities_counties_by_type <- state_data %>%
  select(geo_type, region, transportation_type) %>%
  group_by(geo_type, transportation_type) %>%
  tally()

# write out results of dplyr chain
write.csv(count_cities_counties_by_type,
          "output/new-york_cities_counties_counts.csv")
