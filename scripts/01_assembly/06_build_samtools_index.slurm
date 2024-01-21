#!/usr/bin/env bash

# This script builds the samtools index of BAM file(s).
# Usage: sbatch 06_build_samtools_index.slurm <list of bam files>

#SBATCH --array=0-1
#SBATCH --cpus-per-task=4
#SBATCH --mem=30G
#SBATCH --time=07:00:00
#SBATCH --job-name=samtools_index
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_samtools_index_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_samtools_index_%j.e
#SBATCH --partition=pall

# Import samtools module
module add UHTS/Analysis/samtools/1.10

# Store list of BAM files given in argument in array
BAM_FILES=($@)

# Get current BAM file and go to BAM file directory
BAM_FILE=${BAM_FILES[$SLURM_ARRAY_TASK_ID]}
filename=$(basename ${BAM_FILE} .bam)
cd $(dirname ${BAM_FILE})

# Index the BAM files with samtools (require sorting first)
# -m option : max memory per thread (less intermediary log file)
# -@ option : number of threads
samtools sort -m 5G -@ 4 ${filename}.bam > ${filename}.sorted.bam 
samtools index -b ${filename}.sorted.bam

