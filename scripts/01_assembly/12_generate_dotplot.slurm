#!/usr/bin/env bash

# This script generates a dot plot from the assembly-to-reference alignment output of nucmer using mummerplot from MUMmer (beta version 4.0.0).
# Note: multiple assembly alignments can be run using slurm array.
# Usage: sbatch 12_generate_dotplot.slurm <assembly directory> <reference genome file> <output directory>

#SBATCH --array=0-3
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G
#SBATCH --time=01:00:00
#SBATCH --job-name=generate_dotplot
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_generate_dotplot_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_generate_dotplot_%j.e
#SBATCH --partition=pall

# Store assemblies, reference genome, nucmer delta files and the output directory
assemblies=($(ls $(realpath $1)/*assembly*.fasta))
reference=$(realpath $2)
nucmer_files=($(ls $(realpath $3)/*.delta))
OUTPUT_DIR=$3

# Get current filename and go to output directory
filename=$(basename ${assemblies[$SLURM_ARRAY_TASK_ID]} .fasta)
cd ${OUTPUT_DIR}

# Add gnuplot command to PATH
export PATH=/software/bin:$PATH

# Import Mummer module
module add UHTS/Analysis/mummer/4.0.0beta1

# Generate dotplot with mummerplot
# --filter option: only display "best" alignment
# -R option: reference sequence in fasta file
# -Q option: query sequences in fasta files
# -t option: output terminal for the plot (png, X11 or postscript)
# --layout option: layout plot such that largest hit is on the diagonal
# --prefix option: prefix for output file
# --fat option: layout plot using fattest alignment
# --large option: size of plot (default is small)
mummerplot --filter -R $reference -Q ${assemblies[$SLURM_ARRAY_TASK_ID]} --png --large --layout --fat --prefix ${filename}_dotplot ${nucmer_files[$SLURM_ARRAY_TASK_ID]}

