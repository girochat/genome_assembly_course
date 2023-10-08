#!/usr/bin/env bash

# This script performs assembly polishing using Pilon (version 1.22). It attempts to fix possible snps, indels, gaps and local misassemblies. 
# Usage: sbatch 07_polish_assembly.slurm <assembly file> <alignment directory>

#SBATCH --cpus-per-task=4
#SBATCH --mem=48G
#SBATCH --time=02:00:00
#SBATCH --job-name=polishing
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_polishing_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_polishing_%j.e
#SBATCH --partition=pall

# Get assembly file and alignment directories from script arguments
assembly_file=$1
ALIGN_DIR=$2

# Get assembly directory
ASSEMBLY_DIR=$(dirname ${assembly_file})

# Get basename of current assembly file
filename=$(basename ${assembly_file} .fasta)

# Polish assembly with Pilon with increased resources (mem=45G)
# --genome option: assembly to be polished
# --frags option: for alignment data with paired-end reads (not mate pair)
# --diploid option: for diploid genome
# --fix option: specify which polishing actions to perform
java -Xmx45g -jar /mnt/software/UHTS/Analysis/pilon/1.22/bin/pilon-1.22.jar \
--genome ${assembly_file} \
--frags ${ALIGN_DIR}/${filename}_alignment.sorted.bam \
--outdir ${ASSEMBLY_DIR} --output ${filename}_polished \
--diploid --fix "all" --threads 4  
