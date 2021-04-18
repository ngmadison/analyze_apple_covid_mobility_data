#!/bin/bash

# Bash script to analyze sequences in compressed SARS-CoV-2 fasta file from  NCBI Blast.
# The goal is to find the total number of sequences.
# We also want to tally the number of sequences per country
# and sort them largest to smallest count.

# This script is expected to have two command line parameters.
# First, a compressed fasta file containing raw sequence data for SARS-CoV-2.
# Second, 'ALL' to ensure complete output as it was orignally intended.

# Madison Ng
# mtng2@dons.usfca.edu
# April 7, 2021

# Quick check to ensure there are command line arguments present before script progresses
if [ $# -eq 0 ]
then
        echo "There are two arugments necessary to make this script run:"
        echo "First, please include the path to the compressed sequence data fasta."
        echo "Next, include 'ALL' if you would like more detailed output."
        exit 1
fi

# Tally SARS-CoV-2 sequences and sort by country
if [ $# -ne 2 ]
then
    zgrep "isolate.*Homo" "$1" | cut -d"|" -f5 | sort | uniq -c | \sort -rn > ~/analyze_apple_covid_mobility_data/output/sort_country_seqs.txt
    cat ~/analyze_apple_covid_mobility_data/output/sort_country_seqs.txt
    exit 1
fi

# Complete output from original script
echo "The total number of sequences is:" "$(bioawk -c fastx 'END{print NR}')" "$1" > ~/analyze_apple_covid_mobility_data/output/sort_country_seqs.txt
echo "Tally SARS-CoV-2 sequences and sort countries by greatest to least" >> ~/analyze_apple_covid_mobility_data/output/sort_country_seqs.txt
zgrep "isolate.*Homo" "$1" | cut -d"|" -f5 | sort | uniq -c | \sort -rn >> ~/analyze_apple_covid_mobility_data/output/sort_country_seqs.txt
cat ~/analyze_apple_covid_mobility_data/output/sort_country_seqs.txt
