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
# Check if total seq count is requested
if [ "$2" = 'ALL' ]
then
    echo "The total number of sequences is:" "$(bioawk -c fastx 'END{print NR}' "$1" )"
fi

# Output sequences by country tally
zgrep "isolate.*Homo" "$1" | cut -d"|" -f5 | sort | uniq -c | sort -rn
