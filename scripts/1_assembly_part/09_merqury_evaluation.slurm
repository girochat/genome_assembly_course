#!/usr/bin/env bash

# This script performs assembly evaluation with Merqury (version 1.3.1).
# Usage: sbatch 08_merqury_evaluation.slurm <meryl database directory> <assembly directory> <output directory>

#SBATCH --array=0-3
#SBATCH --cpus-per-task=4
#SBATCH --mem=20G
#SBATCH --time=05:00:00
#SBATCH --job-name=merqury_evaluation
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_merqury_evaluation_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_merqury_evaluation_%j.e
#SBATCH --partition=pall

# Get meryl DB, assembly and output directories
MERYL_DB=$(realpath $1)
ASSEMBLY_DIR=$(realpath $2)
OUTPUT_DIR=$3

# Store all assemblies in an array
assemblies=($(ls ${ASSEMBLY_DIR}/*assembly*.fasta))
filename=$(basename ${assemblies[$SLURM_ARRAY_TASK_ID]} .fasta)

# Create and go to output directory
mkdir ${OUTPUT_DIR}/${filename}
cd ${OUTPUT_DIR}/${filename}

# Run Merqury assembly evaluation
apptainer exec --bind ${MERYL_DB},${ASSEMBLY_DIR} /software/singularity/containers/Merqury-1.3-1.ubuntu20.sif \
merqury.sh ${MERYL_DB} ${assemblies[$SLURM_ARRAY_TASK_ID]} ${filename}
