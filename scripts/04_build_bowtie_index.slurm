#!/usr/bin/env bash

# This script builds the BowTie2 (version 2.3.4.1) index of assembly file(s) and output the index in the working directory.
# Usage: sbatch 04_build_bowtie_index.slurm <list of assemblies>

#SBATCH --array=0-2
#SBATCH --cpus-per-task=4
#SBATCH --mem=1G
#SBATCH --time=00:10:00
#SBATCH --job-name=index_bowtie
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_bowtie_index_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_bowtie_index_%j.e
#SBATCH --partition=pall

# Load BowTie2 module
module add UHTS/Aligner/bowtie2/2.3.4.1

# Get assembly files given in argument
assemblies=($@)

# Get prefix for index from assembly filename
prefix=$(basename ${assemblies[$SLURM_ARRAY_TASK_ID]} .fasta)

# Build assembly index with BowTie2
# Note: index will be saved in same directory as assembly file
bowtie2-build --threads 4 ${assemblies[$SLURM_ARRAY_TASK_ID]} ${prefix}


