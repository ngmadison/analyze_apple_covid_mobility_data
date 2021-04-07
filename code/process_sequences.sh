#!/bin/bash

# Bash script to analyze sequences in compressed Sars Cov 2 fasta file from NCBI Blast.

# This script is expected to have one 
# command line parameter. This is the 
# compressed fasta file containing raw 
# sequence data.

# Madison Ng
# mtng2@dons.usfca.edu
# April 7, 2021

# Quick check to ensure there are command line arguments present before starting
if [ $# -eq 0 ]
then
	echo "Did you forget to include the path to the sequence data fasta?"
	exit 1
fi

# Intial peek at fasta file with zcat to see what variables are available to work with
zcat /blast-db/sars-cov-2-seq-data/2021-04-05_ncbi_sars_cov_2_sequences.fasta.gz | head

# Selecting parameter to filter data by with zgrep
zgrep
