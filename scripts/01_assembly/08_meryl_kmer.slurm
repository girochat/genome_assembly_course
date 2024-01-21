#!/usr/bin/env bash

# This script builds a kmer database out of paired-end short reads with Meryl (Canu version 2.1.1). It outputs the database kmer_db.meryl in the same directory as the reads.
# Usage: sbatch 08_meryl_kmer.slurm <reads directory> <kmer size>

#SBATCH --cpus-per-task=4
#SBATCH --mem=20G
#SBATCH --time=01:00:00
#SBATCH --job-name=meryl_kmer
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_meryl_kmer_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_meryl_kmer_%j.e
#SBATCH --partition=pall

# Get read directory and kmer size from arguments
READS_DIR=$1
kmer_size=$2
paired_reads=($(ls ${READS_DIR}/*.fastq.gz))

# Import Canu module to use meryl command
module add UHTS/Assembler/canu/2.1.1

# Build kmer database with Meryl for each pair of reads
meryl count k=${kmer_size} threads=4 memory=20 ${paired_reads[0]} output ${READS_DIR}/kmer_db_1.meryl
meryl count k=${kmer_size} threads=4 memory=20 ${paired_reads[1]} output ${READS_DIR}/kmer_db_2.meryl

# Merge the paired read databases
meryl union-sum ${READS_DIR}/kmer_db_1.meryl ${READS_DIR}/kmer_db_2.meryl output ${READS_DIR}/kmer_db.meryl

# Keep only the merged database
rm -R ${READS_DIR}/kmer_db_1.meryl ${READS_DIR}/kmer_db_2.meryl

