#!/usr/bin/env bash

# This script runs a GENESPACE analysis (version 1.1.4).
# Usage: sbatch 11_run_genespace.slurm <GENESPACE apptainer image> <GENESPACE R script> 

#SBATCH --cpus-per-task=8
#SBATCH --mem=65G
#SBATCH --time=02:00:00
#SBATCH --job-name=genespace
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_genespace_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_genespace_%j.e
#SBATCH --partition=pall

# Store script arguments in variables
genespace_image=$1
genespace_script=$2

# Launch GENESPACE analysis
apptainer exec ${genespace_image} Rscript ${genespace_script}
