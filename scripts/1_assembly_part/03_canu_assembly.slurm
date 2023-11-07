#!/usr/bin/env bash

# This script launches a genome assembly using Pacbio reads and the Canu assembler (version 2.1.1)
# Usage: sbatch 03_canu_assembly.slurm <path_to_data_directory> <path_to_output_directory>

#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --time=01:00:00
#SBATCH --job-name=canu_assembly
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_canu_assembly_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_canu_assembly_%j.e
#SBATCH --partition=pall

# Store the data and output directories given in argument
DATA_DIR=$1
OUTPUT_DIR=$2

# Load Canu module
module load UHTS/Assembler/canu/2.1.1

# Perform genome assembly using Canu 
# -p option : specify the file prefix for the intermediary files output by Canu
# -d option : specify the output directory
# gridEngineResourceOption : specify how much resources Canu can request to the cluster (maximum) 
# gridOptions : specify sbatch options given to all Canu subjobs
canu -p athaliana -d $OUTPUT_DIR genomeSize=128m maxThreads=16 maxMemory=64 gridEngineResourceOption="--cpus-per-task=THREADS --mem-per-cpu=MEMORY --time=2-00:00:00" gridOptions="--partition=pall --output=/data/users/grochat/genome_assembly_course/log/output_canu_assembly_%j.o --error=/data/users/grochat/genome_assembly_course/log/error_canu_assembly_%j.e" -pacbio $DATA_DIR/*
