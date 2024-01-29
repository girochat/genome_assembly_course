#!/usr/bin/env bash

#SBATCH --cpus-per-task=10
#SBATCH --mem=30G
#SBATCH --time=02:00:00
#SBATCH --job-name=blastp
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_blastp_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_blastp_%j.e
#SBATCH --partition=pall

uniprot_ref=$1
maker_protein_file=$2
maker_noseq_gff=$3
OUTPUT_DIR=$4
blast_output=${OUTPUT_DIR}/blast_hit.out

# Import blast and maker modules
module add Blast/ncbi-blast/2.10.1+
module load SequenceAnalysis/GenePrediction/maker/2.31.9

# Build blast database from plant protein sequence in Uniprot
makeblastdb -in ${uniprot_ref} -dbtype prot

# Run blastp search with proteins annotated with MAKER
# option outfmt : output file format
# option evalue : expectation value threshold to accept hit
blastp -db ${uniprot_ref} -query ${maker_protein_file} -num_threads 10 -outfmt 6 -evalue 1e-10 -out ${blast_output}

# Add uniprot functional annotation in fasta header
maker_functional_fasta ${uniprot_ref} ${blast_output} ${maker_protein_file} > ${maker_protein_file}.uniprot
maker_functional_gff ${uniprot_ref} ${blast_output} ${maker_noseq_gff} > ${maker_noseq_gff}.uniprot

