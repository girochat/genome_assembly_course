#!/usr/bin/env bash

# This script performs a kmer count of paired-end sequencing data (FASTQ files) using the tool Jellyfish (version 2.3.0) and outputs the histogram of the kmer distribution. Multiple files can be run in parallel. Note: paired-end files are expected to be differentiable using R1 and R2.
# Usage: sbatch 02_count_kmer.slurm <path_to_data_directory> <path_to_output_directory> <kmer_length (optional, DEFAULT=21)>

#SBATCH --array=0
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G
#SBATCH --time=02:00:00
#SBATCH --job-name=count_kmer
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_count_kmer_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_count_kmer_%j.e
#SBATCH --partition=pall

# Import jellyfish module
module add UHTS/Analysis/jellyfish/2.3.0

# Store data and output directories given in argument
DATA_DIR=$1
OUTPUT_DIR=$2

# Use kmer size given in argument (default=21)
if [ ! -z $3 ]
then
	kmer_length=$3
else
	kmer_length=21
fi

# Retrieve current file for the slurm array task
data_files=($(ls ${DATA_DIR}/*R1.fastq.gz))
current_file=${data_files[SLURM_ARRAY_TASK_ID]}
filename=$(basename ${current_file} _R1.fastq.gz)

# Count number of kmer
jellyfish count -C -m $kmer_length -s 200M -t 4 -o $OUTPUT_DIR/${filename}_kmer_count.jf <(zcat $DATA_DIR/${filename}*R1.fastq.gz) <(zcat $DATA_DIR/${filename}*R2.fastq.gz) 

# Output histogram of kmer count
jellyfish histo -t 4 $OUTPUT_DIR/${filename}_kmer_count.jf > $OUTPUT_DIR/${filename}_kmer.histo

