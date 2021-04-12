#!/bin/bash

# Bash script to analyze sequences in compressed SARS-CoV-2 fasta file from  NCBI Blast.
# The goal is to find the total number of sequences.
# We also want to tally the number of sequences per country
# and sort them largest to smallest count.

# This script is expected to have one command line parameter.
# This is the compressed fasta file containing raw sequence data.

# Madison Ng
# mtng2@dons.usfca.edu
# April 7, 2021

# Quick check to ensure there are command line arguments present before script progresses
if [ $# -eq 0 ]
then
	echo "Did you forget to include the path to the compressed sequence data fasta?"
	exit 1
fi

# Count total sequences in compressed fasta

# Use bioawk to locate and count total sequences, then store count output in txt file
echo "Bioawk will isolate sequence names, total them, and place count in an output txt file."
bioawk -c fastx 'END{print NR}' "$1" > ~/analyze_apple_covid_mobility_data/output/sort_country_seqs.txt

# Display output total in terminal for user
echo "The total number of sequences is:"
cat ~/analyze_apple_covid_mobility_data/output/sort_country_seqs.txt

# Tally SARS-CoV-2 sequences and sort by country

# Use zcat to isolate indentifier line and determine available variables and
# assess data make up for function creation
zcat "$1" | head -n1

# Use zgrep, cut, and sort to tally and sort sequences
echo "Zgrep, cut, and sort will isolate, tally, and order sequences by country from greatest to least in a txt output file."
zgrep "isolate.*Homo" "$1" | cut -d"|" -f5 | sort | uniq -c | \sort -rn >> ~/analyze_apple_covid_mobility_data/output/sort_country_seqs.txt

# Identify output file for user
echo "Output file generation complete. Look for sort_country_seqs.txt in output directory."
