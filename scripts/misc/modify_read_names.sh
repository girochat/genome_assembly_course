#!/usr/bin/env bash

# This script modifies the name of each pair of reads in the FASTQ files of paired-end data such that it is compatible with QUAST analysis.

# One of the FASTQ files of paired-end data
fastq_file=$1
filename=$(basename ${fastq_file})

# Get the read directory
READS_DIR=$2

# Copy the original FASTQ file in the read directory
cp ${fastq_file} ${READS_DIR}/${filename}

# Remove the prefix "_R" in each read name
zcat ${READS_DIR}/${filename} | sed /@HWI/s/_R// | gzip >> ${READS_DIR}/modif_${filename}


