#!/usr/bin/env bash

# This script performs an assembly evaluation with QUAST (version 5.2.0). Both Pacbio CLR and Illumina paired-end reads are provided for the evaluation.
# Usage: sbatch 08_quast_evaluation.slurm <assembly directory (absolute path)> <output directory> < 1=with reference / 0=without> 

#SBATCH --cpus-per-task=20
#SBATCH --mem=40G
#SBATCH --time=2-00:00:00
#SBATCH --job-name=quast_evaluation
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_quast_evaluation_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_quast_evaluation_%j.e
#SBATCH --partition=pall

# Store all assemblies in an array
assemblies=$(ls $1/*.fasta)

# Get output directory and boolean variable indicating with/without reference analysis
OUTPUT_DIR=$2
reference=$3

# Define absolute path to references
READS_DIR=/data/courses/assembly-annotation-course/raw_data/Sha/participant_5/
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
	apptainer exec --bind $READS_DIR:/mnt/reads /data/courses/assembly-annotation-course/containers/quast_5.1.0rc1.sif \
	python3 $PWD/quast-5.2.0/quast.py \
	-o $PWD/${OUTPUT_DIR} --threads 16 --large --est-ref-size 135000000 \
	--pe1 $PWD/data/reads/genome/Illumina/ERR3624575_1_modif.fastq.gz --pe2 $PWD/data/reads/genome/Illumina/ERR3624575_2_modif.fastq.gz \
	--pacbio /mnt/reads/pacbio/ERR3415830.fastq.gz --pacbio /mnt/reads/pacbio/ERR3415831.fastq.gz \
	${assemblies[@]} 
else
	# Run LG-QUAST with reference genome
	apptainer exec --bind $READS_DIR:/mnt/reads,$REF_DIR:/mnt/reference /data/courses/assembly-annotation-course/containers/quast_5.1.0rc1.sif \
	python3 $PWD/quast-5.2.0/quast.py \
	-r $PWD/data/reference/ref_genome.fa --features /mnt/reference/TAIR10_GFF3_genes.gff \
	-o $PWD/${OUTPUT_DIR} --threads 20 --large --no-sv \
	--pe1 $PWD/data/reads/genome/Illumina/ERR3624575_1_modif.fastq.gz --pe2 $PWD/data/reads/genome/Illumina/ERR3624575_2_modif.fastq.gz\
	--pacbio /mnt/reads/pacbio/ERR3415830.fastq.gz --pacbio /mnt/reads/pacbio/ERR3415831.fastq.gz \
	${assemblies[@]}
fi
