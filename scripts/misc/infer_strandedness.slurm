#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --mem=5G
#SBATCH --time=02:05:00
#SBATCH --job-name=infer_strandedness
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=end,fail
#SBATCH --error=error_%j.e

# path to the project directory
reference_genome=$(basename $1)
SAM_file=$(basename $2 .sam)
OUTPUT_DIR=$3
DATA_DIR=$(dirname $1)
SAM_DIR=$(dirname $2)

module add UHTS/Analysis/samtools/1.10

# Convert SAM to BAM and sort
samtools view -bh -o ${SAM_DIR}/${SAM_file}.bam ${SAM_DIR}/${SAM_file}.sam
samtools sort -m 5G -@ 4 ${SAM_DIR}/${SAM_file}.bam > ${SAM_DIR}/${SAM_file}.sorted.bam

# Convert fasta file to bed
conda create -n temp pip 
conda activate temp
pip install pyfaidx  
faidx --transform bed ${DATA_DIR}/${reference_genome} > ${DATA_DIR}/ref_genes_sequences.bed
conda env remove -n temp

module add UHTS/Quality_control/RSeQC/4.0.0

# infer the strandedness of the library used for transcriptome assembly using RSeQC
# (RSeQC requires a reference gene sequences in bed format)
infer_experiment.py -r ${DATA_DIR}/ref_genes_sequences.bed -i ${SAM_DIR}/${SAM_file}.sorted.bam > ${OUTPUT_DIR}/results_strandedness.txt

