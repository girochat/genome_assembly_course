#!/usr/bin/env bash

# This script launches a genome assembly evaluation with BUSCO (version 4.1.4).
# Usage: sbatch 08_busco_evaluation.slurm <assembly directory> <output directory> <analysis mode> <lineage>

#SBATCH --cpus-per-task=4
#SBATCH --mem=40G
#SBATCH --time=12:00:00
#SBATCH --job-name=busco_evaluation
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_busco_evaluation_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_busco_evaluation_%j.e
#SBATCH --partition=pall

# Get output directory, analysis mode and lineage from script arguments
OUTPUT_DIR=$2
MODE=$3
LINEAGE=$4

# Get assembly file and filename
assembly_file=$1
filename=$(basename ${assembly_file} .fasta)

# Import Busco module and set environment variable for Busco config file (Note: expected to be in same directory that will contain output)
module load UHTS/Analysis/busco/4.1.4
export AUGUSTUS_CONFIG_PATH=${OUTPUT_DIR}/augustus_config

# Evaluate assembly with Busco
# -i option : assembly file to analyse
# -o option : output directory name that Busco will create
# -m option : genome or transcriptome or protein mode
# -l option : lineage datasets to use
# --auto-lineage option : automatic detection of lineage
# --cpu option : number of cpus (threads) to use
# --force option : erase extant output directory
busco -m $MODE -i ${assembly_file} -l $LINEAGE -o ${filename} --cpu 4 --out_path ${OUTPUT_DIR} --force
