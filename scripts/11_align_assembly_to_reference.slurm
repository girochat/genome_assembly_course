#!/usr/bin/env bash

# This script aligns assembly to the reference genome using nucmer alignment tool (MUMmer beta version 4.0.0). Can be run for multiple assemblies using slurm array.
# Usage: sbatch 11_align_assembly_to_reference.slurm <assembly directory> <reference genome file> <output directory>

#SBATCH --array=0-3
#SBATCH --cpus-per-task=2
#SBATCH --mem=10G
#SBATCH --time=01:00:00
#SBATCH --job-name=align_ref_assembly
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_align_ref_assembly_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_align_ref_assembly_%j.e
#SBATCH --partition=pall

# Get assembly files and reference file from script arguments
assemblies=($(ls $1/*.fasta))
reference=$2
OUTPUT_DIR=$3

# Get filename for output prefix
filename=$(basename ${assemblies[$SLURM_ARRAY_TASK_ID]} .fasta)

# Import Mummer module
module add UHTS/Analysis/mummer/4.0.0beta1

# Align assemblies to reference genome using Nucmer
# --mincluster option: minimal length of a cluster of matches
# --breaklen option: minimal extension length that is tried before giving up
# --prefix option: output file name
#nucmer --mincluster 1000 --delta ${OUTPUT_DIR}/${filename}.delta --breaklen 1000 ${reference} ${assemblies}
nucmer --mincluster 1000 --delta ${OUTPUT_DIR}/${filename}.delta --breaklen 1000 ${reference} ${assemblies[$SLURM_ARRAY_TASK_ID]}

