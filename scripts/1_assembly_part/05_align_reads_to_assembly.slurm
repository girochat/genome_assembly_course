#!/usr/bin/env bash

# This script aligns paired-end reads to an assembly using BowTie2 (version 2.3.4.1). The SAM output file is converted to BAM file using samtools (version 1.10).
# Usage: sbatch 05_align_reads_to_assembly.slurm <data directory> <output directory> <index prefix> <index directory>

#SBATCH --cpus-per-task=4
#SBATCH --mem=20G
#SBATCH --time=05:00:00
#SBATCH --job-name=align_reads
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_alignment_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_alignment_%j.e
#SBATCH --partition=pall

# Store data and output directories given in argument and index prefix
DATA_DIR=$1
OUTPUT_DIR=$2
index_prefix=$3

# Retrieve read files from data directory
reads=($(ls $DATA_DIR))

# Load BowTie2 and samtools modules
module add UHTS/Aligner/bowtie2/2.3.4.1
module add UHTS/Analysis/samtools/1.10

# Set BowTie2 environment variable to search for index
BOWTIE2_INDEXES=$4
export BOWTIE2_INDEXES

# Align Illumina short reads to assembly with BowTie2
bowtie2 -p 4 --sensitive-local \
-x ${index_prefix} \
-1 ${DATA_DIR}/${reads[0]} -2 ${DATA_DIR}/${reads[1]} \
-S ${OUTPUT_DIR}/${index_prefix}_alignment.sam 2> ${OUTPUT_DIR}/${index_prefix}_alignment_stats.txt

# Convert SAM file to BAM file using Samtools
samtools view -bh -o ${OUTPUT_DIR}/${index_prefix}_alignment.bam ${OUTPUT_DIR}/${index_prefix}_alignment.sam 
