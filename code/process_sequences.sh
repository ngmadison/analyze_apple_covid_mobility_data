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

# Use zcat to isolate identifier line to assess variables available for use in functions
zcat "$1" | head -n1

# Use bioawk to locate and count total sequences, then store count output in txt file
echo "Bioawk will isolate sequence names, count the total, and place count in an output txt file."
bioawk -c fastx 'END{print NR}' "$1" > total_seqs.txt
mv total_seqs.txt /home/Ng_Madison/analyze_apple_covid_mobility_data/output/
# Display output saved to txt file in terminal
echo "The total number of sequences is"
cat /home/Ng_Madison/analyze_apple_covid_mobility_data/output/total_seqs.txt

#Tally SARS-CoV-2 sequences and sort by country
zgrep "[A-Z].*coronavirus" "$1" | awk '{print $5}' | uniq -c | \sort -rn > tally_attempt.txt

