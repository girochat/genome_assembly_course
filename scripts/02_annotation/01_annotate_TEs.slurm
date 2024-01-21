#!/usr/bin/env bash

# This script builds a TE whole genome annotation and a non-redundant TE libary of a given genome/assembly with EDTA (version 1.9.6). 
# Usage: sbatch 13_annotate_TEs.slurm <genome file> <coding regions file>

#SBATCH --cpus-per-task=40
#SBATCH --mem=10G
#SBATCH --time=6:00:00
#SBATCH --job-name=TE_annotation
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_TE_annotation_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_TE_annotation_%j.e
#SBATCH --partition=pall

# Get genome/assembly file, coding regions annotation and output directory from arguments
genome_file=$(basename $1)
coding_regions_file=$(basename $2)
OUTPUT_DIR=$(dirname $1)

# Go to output directory
cd ${OUTPUT_DIR}

# Run EDTA
singularity exec /data/courses/assembly-annotation-course/containers2/EDTA_v1.9.6.sif EDTA.pl \
--genome $PWD/${genome_file} --species others --step all --cds $PWD/${coding_regions_file} --anno 1 --threads 50

