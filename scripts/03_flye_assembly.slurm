#!/usr/bin/env bash

# This script performs a genome assembly from Pacbio CLR reads using Flye assembler (version 2.8.3)
# Usage: sbatch 03_flye_assembly.slurm <path_to_data_directory> <path_to_output_directory>

#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=1-0:00:00
#SBATCH --job-name=flye
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_flye_assembly_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_flye_assembly_%j.e
#SBATCH --partition=pall

# Store the data and output directories given in argument
DATA_DIR=$1
OUTPUT_DIR=$2

# Import flye module
module load UHTS/Assembler/flye/2.8.3
 
# Launch flye assembly with Pacbio reads
# --pacbio-raw option : perform assembly with Pacbio regular CLR reads
# --asm-coverage option : reduced coverage for disjointig assembly (if used need to specify genome size)
flye --pacbio-raw $DATA_DIR/* --out-dir $OUTPUT_DIR --genome-size 126m --threads=16
