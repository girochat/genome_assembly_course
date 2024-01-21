#!/usr/bin/env bash

# This script classifies TEs present in a TE library into known clades using TESorter (version 1.3.0). 
# Usage: sbatch 02_sort_TE.slurm <list of TE library fasta files (copia and gypsy)>

#SBATCH --cpus-per-task=4
#SBATCH --mem=10G
#SBATCH --time=01:00:00
#SBATCH --job-name=sort_TE
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_sort_TE_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_sort_TE_%j.e
#SBATCH --partition=pall

# Go to output directory
OUT_DIR=$(dirname $1)
cd ${OUT_DIR}

# Classify TEs with TESorter for each TE library files given in argument
for file in $@
do	
	filename=$(basename $file)

	singularity exec /data/courses/assembly-annotation-course/containers2/TEsorter_1.3.0.sif \
	TEsorter $PWD/$filename -db rexdb-plant

done
