#!/usr/bin/env bash

# This script performs an assembly evaluation with QUAST (version 5.2.0). Both Pacbio CLR and Illumina paired-end reads are provided for the evaluation.
# Usage: sbatch 09_quast_evaluation.slurm <assembly directory> <output directory> < 1=with reference / 0=without> 

#SBATCH --cpus-per-task=20
#SBATCH --mem=50G
#SBATCH --time=2-00:00:00
#SBATCH --job-name=quast_evaluation
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_quast_evaluation_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_quast_evaluation_%j.e
#SBATCH --partition=pall

# Get list of assemblies (absolute path)
ASSEMBLY_DIR=$(realpath $1)
assemblies=$(ls ${ASSEMBLY_DIR}/*.fasta)

# Get output directory and boolean variable indicating with/without reference analysis
OUTPUT_DIR=$2
reference=$3

# Store path to modified Illumina PE short reads and reference genome
read1=data/reads/genome/Illumina/ERR3624575_1_modif.fastq.gz
read2=data/reads/genome/Illumina/ERR3624575_2_modif.fastq.gz
ref_genome=data/reference/TAIR10_genome_modif.fa

# Define absolute path to references (necessary for container)
PACBIO_DIR=/data/courses/assembly-annotation-course/raw_data/Sha/participant_5/pacbio/
REF_DIR=/data/courses/assembly-annotation-course/references/

# Evaluate genome assembly using QUAST
# --large option : for genome with size > 100M. Automatically applies --eukaryote --min-contig 3000 --min-alignment 500 --extensive-mis-size 7000 options
# -r option : for reference genome file
# --features option : for annotation file of reference genome
# --upper-bound-assembly : give simulated upper bound assembly (only with reference option)
# -est-ref-size : estimated reference genome size (in bp). No needed if -r specified.
# --pe1 --pe2 options : for paired-end short reads
# --pacbio option : for PacBio SMRT reads
if [ $reference -eq 0 ]
then
	# Run LG-QUAST without reference genome
	apptainer exec --bind $PACBIO_DIR:/mnt/pacbio $PWD/scripts/misc/quast.sif \
	python3 $PWD/scripts/misc/quast-5.2.0/quast.py \
	-o $PWD/${OUTPUT_DIR} --threads 20 --large --est-ref-size 126000000 \
	--pe1 $PWD/$read1 --pe2 $PWD/$read2 \
	--pacbio /mnt/pacbio/*1.fastq.gz --pacbio /mnt/pacbio/*2.fastq.gz \
	${assemblies} 
else
	# Run LG-QUAST with reference genome
	apptainer exec --bind $PACBIO_DIR:/mnt/pacbio,$REF_DIR:/mnt/reference $PWD/scripts/misc/quast.sif \
	python3 $PWD/scripts/misc/quast-5.2.0/quast.py \
	-r $PWD/${ref_genome} --features /mnt/reference/TAIR10_GFF3_genes.gff \
	-o $PWD/${OUTPUT_DIR} --threads 20 --large --upper-bound \
	--pe1 $PWD/$read1 --pe2 $PWD/$read2 \
	--pacbio /mnt/pacbio/*1.fastq.gz --pacbio /mnt/pacbio/*2.fastq.gz \
	${assemblies}
fi
