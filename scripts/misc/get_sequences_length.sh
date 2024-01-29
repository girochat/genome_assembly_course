#!/usr/bin/env bash

# This script extracts the bp length of FASTA file sequences and store the result in a tsv file.
# Usage: bash get_sequences_length.sh <FASTA file> <output filename>

# Get FASTA file and name for output file from script arguments
sequences_file=$1
filename=$2
OUTPUT_DIR=$(dirname ${sequences_file})

# Extract sequence length of each sequence in FASTA file
awk 'BEGIN{
	l=0 
	name=""
}{
	if( !( $1 ~ /^>/ )){
		l += length($1)
	}else{
		print name "\t" l
		l=0
		name=$0
	}
}END{
	print name "\t" l
}' ${sequences_file} >> temp.txt

# Remove '>' from sequence name
sed -i"" 's/>//' temp.txt

# Remove first line
tail -n +2 temp.txt >> ${OUTPUT_DIR}/${filename}_length.tsv

rm temp.txt
