#!/usr/bin/env bash

# This script aligns RT protein sequences of TE superfamilies with clustal (version 1.2.4) and builds a phylogenetic tree with FastTree (version 2.1.10).
# Usage: sbatch 06_create_phylo_tree.slurm <RT protein sequences (fasta)> <output directory> <superfamily name>

#SBATCH --cpus-per-task=1
#SBATCH --mem=5G
#SBATCH --time=01:00:00
#SBATCH --job-name=phylo_tree
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_phylo_tree_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_phylo_tree_%j.e
#SBATCH --partition=pall

# Get protein sequence fasta file, output directory and superfamily name from script arguments
prot_seq=$1
OUTPUT_DIR=$2
family=$3

# Import clustal omega module
module add SequenceAnalysis/MultipleSequenceAlignment/clustal-omega/1.2.4

# Align sequences with clustal
clustalo -i ${prot_seq} -o ${OUTPUT_DIR}/${family}_prot_alignment.fasta

# Import FastTree module
module add Phylogeny/FastTree/2.1.10 

# Build tree with FastTree
FastTree -out ${OUTPUT_DIR}/${family}_alignment.tree ${OUTPUT_DIR}/${family}_prot_alignment.fasta
