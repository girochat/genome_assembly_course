#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=01:00:00
#SBATCH --job-name=final_annot
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_final_annot_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_final_annot_%j.e
#SBATCH --partition=pall

# Import maker module
module load SequenceAnalysis/GenePrediction/maker/2.31.9
export TMPDIR=$SCRATCH

# Get assembly name and maker output directory
assembly=$1
MAKER_DIR=$2

# Go to maker output directory for given assembly
cd ${MAKER_DIR}/${assembly}.maker.output

# Merge all protein sequences found for each contig into one
gff3_merge -d ${assembly}_master_datastore_index.log -o ${assembly}.all.maker.gff
gff3_merge -d ${assembly}_master_datastore_index.log -n -o ${assembly}.all.maker.noseq.gff
fasta_merge -d ${assembly}_master_datastore_index.log -o ${assembly}

# Store maker output filename in variables
protein=${assembly}.all.maker.proteins.fasta
transcript=${assembly}.all.maker.transcripts.fasta
gff=${assembly}.all.maker.noseq.gff
prefix=${assembly}_

# Create a copy of maker output file to rename sequence ID
cp $gff ${gff}.renamed.gff
cp $protein ${protein}.renamed.fasta
cp $transcript ${transcript}.renamed.fasta

# Rename sequence using shorter IDs and create map of old/new IDs
maker_map_ids --prefix $prefix --justify 7 ${gff}.renamed.gff > ${assembly}.id.map
map_gff_ids ${assembly}.id.map ${gff}.renamed.gff
map_fasta_ids ${assembly}.id.map ${protein}.renamed.fasta
map_fasta_ids ${assembly}.id.map ${transcript}.renamed.fasta
