#!/usr/bin/env bash

# This script performs a transcriptome assembly from Illumina RNASeq paired-end reads using Trinity assembler (version 2.5.1)
# Usage: sbatch 03_trinity_assembly.slurm <path_to_data_directory> <path_to_output_directory>

#SBATCH --cpus-per-task=12
#SBATCH --mem=48G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=trinity_assembly
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_trinity_assembly_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_trinity_assembly_%j.e
#SBATCH --partition=pall

# Store the data and output directories given in argument
DATA_DIR=$1
OUTPUT_DIR=$2

# Load Trinity module
module add UHTS/Assembler/trinityrnaseq/2.5.1

# Perform transcriptome assembly with Trinity (version 2.5.1)
# --seqType option: FASTQ (fq) or FASTA (fa) file
# --SS_lib_type option: to specify strandedness (RF or FR)
Trinity --seqType fq --left $DATA_DIR/RNAseq_R1.* --right $DATA_DIR/RNAseq_R2.* --CPU 12 --max_memory 48G --output $OUTPUT_DIR
