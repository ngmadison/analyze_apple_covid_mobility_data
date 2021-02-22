# Script to read in Apple mobility data from a csv file
# and subset data to just include rows from Wisconsin
# and write out a csv file that only includes this subset.

# Madison Ng
# mtng2@dons.usfca.edu
# February 6, 2021

# read in complete csv file
full_covid_data <- read.csv("data/raw_data/applemobilitytrends-2021-02-05.csv")

#Subset dataset to only include rows where sub.region column has
# "Wisconsin" in it but include all other columns.
wisconsin_data <- full_covid_data[full_covid_data$sub.region == "Wisconsin", ]

# Save Wisconsin data to new csv file in output directory
write.csv(wisconsin_data, file = "output/wisconsin_apple_mobility_data.csv")
