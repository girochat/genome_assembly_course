#!/usr/bin/env bash

# This script performs a quality control analysis of a list of FASTQ files with FASTQC (version 0.11.9).
# Usage: sbatch 01_perform_QC.slurm <path_to_data_directory> <path_to_output_directory>

#SBATCH --array=0-1%2
#SBATCH --cpus-per-task=1
#SBATCH --mem=1M
#SBATCH --time=01:00:00
#SBATCH --job-name=fastqc
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_fastqc_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_fastqc_%j.e
#SBATCH --partition=pall

# Store data and output directories passed in argument  
DATA_DIR=$1
OUTPUT_DIR=$2

# Store files of data directory in an array
data_files=($(ls $DATA_DIR))

# Get current file in the slurm job array
current_file=${data_files[SLURM_ARRAY_TASK_ID]}

# Install FASTQC module
module add UHTS/Quality_control/fastqc/0.11.9

# Run parallel FastQC analysis for each FASTQ file in data directory 
# -o option : output directory
# -t option : number of threads used
fastqc -o $OUTPUT_DIR $DATA_DIR/$current_file

