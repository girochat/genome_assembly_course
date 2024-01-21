#!/usr/bin/env bash

# This script modifies how the chromosome name are referenced in the reference genome (FASTA file) to match the notation in the genomic feature annotation (GFF file) for compatibility with QUAST analysis.

# Get reference genome file and data directory
ref_genome=$1
DATA_DIR=$2

# Add "Chr" before the chromosome number and change the maternal and paternal chromosome name
sed -e '/^>/s/>/>Chr/' -e '/^>/s/>ChrMt/>ChrM/' -e '/^>/s/>ChrPt/>ChrC/' ${ref_genome} >> ${DATA_DIR}/temp.fa

# Clean the chromosome name to keep only the first column
awk '{ if ($1 ~ ">"){ print $1 }else{ print $0}}' ${DATA_DIR}/temp.fa >> ${DATA_DIR}/ref_genome.fa 
