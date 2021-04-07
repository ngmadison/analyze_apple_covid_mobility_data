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

# Selecting parameter to filter data using zgrep
echo zgrep "[A-Z].*coronavirus" "$1" | less | awk '$1 ~ /"[A-Z].*.[0-9]"/ {print NR}' "$1"
