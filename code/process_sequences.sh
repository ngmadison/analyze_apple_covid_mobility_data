#!/bin/bash

# Bash script to analyze sequences in compressed Sars Cov 2 fasta file from  NCBI Blast.
# The goal is to find the total number of sequences.
# We also want to tally the number of sequences per country and sort them
# by largest to smallest count.

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

# Intial peek at fasta with zcat to see what variables are available to work with
zcat "$1" | head

# Use zgrep to filter and count sequence names.
# Use awk to isolate sequence names and compile them.
# Outputs placed in txt file for future use.
echo "Zgrep will filter data for all sequences. Awk will isolate sequence names."
zgrep "[A-Z].*.[0-9] " "$1" | awk '{print $1}' > list_counted_seqs.txt
echo "Find isolated sequence names in output/list_counted_seqs.txt."
echo "Zgrep will now count those sequences and the output will be added to the output txt file."
x="$(zgrep -c "[A-Z].*.[0-9]" "$1")"
echo "$x sequences were counted." >> list_counted_seqs.txt







