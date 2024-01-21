#!/usr/bin/env bash

# This script determines the degree of divergence of TE sequence from mother sequence (global consensus) by parsing RepeatMasker output with parseRM.pl script (Parsing-RepeatMasker-Outputs GitHub repository).
# Usage: sbatch 03_deterine_divergence.slurm <EDTA *anno/*.mod.out file> <output directory> <parseRM script directory> 

#SBATCH --cpus-per-task=10
#SBATCH --mem=5G
#SBATCH --time=05:00:00
#SBATCH --job-name=TE_divergence
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_TE_divergence_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_TE_divergence_%j.e
#SBATCH --partition=pall

# Get EDTA file, output directory and script directory from arguments
file=$(realpath $1)
OUTPUT_DIR=$2
SCRIPT_DIR=$(realpath $3)

# Go to output directory
cd ${OUTPUT_DIR}

# Estimate sequence divergence
perl ${SCRIPT_DIR}/parseRM.pl -i $file -l 50,1 -v

