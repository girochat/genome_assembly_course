#!/usr/bin/env bash

# This script prepares data for a GENESPACE analysis of gene annotation. It extracts gene coordinates from gene annotation GFF file in bed format
# and the corresponding protein sequences in fasta format. Note: only sequences of the ten longest contigs of the assembly are considered.
# Usage: sbatch 10_format_annotation.slurm <genomic feature GFF file> <protein sequence FASTA file> <GENESPACE directory> <contig name file>

#SBATCH --cpus-per-task=4
#SBATCH --mem=1G
#SBATCH --time=01:00:00
#SBATCH --job-name=format
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_format_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_format_%j.e
#SBATCH --partition=pall

# Get GFF file, FASTA file, GENESPACE directory and contig names file from script arguments 
accession_maker_noseq=$1
accession_maker_protein=$2
accession=$(basename $1 .all.maker.noseq.gff.renamed.gff)
accession_bed_output=$3/${accession}.bed 
accession_fasta_output=$3/${accession}.fa 

# Store contig names in an array
contig_names=($(cat $4))

# Extract gene coordinates in BED format from GFF file only for ten longest contigs 
awk -F "[\t;=]" -v c="${contig_names[*]}" 'BEGIN{
	split(c, names, " ")
	for (name in names) {
		contig=names[name]
		contigs[contig]=name
	}
	OFS="\t"
} $3 ~ /mRNA/ {
	if ($1 in contigs){ 
		print $1,$4,$5,$10 
	}
}' ${accession_maker_noseq} >> ${accession_bed_output}


# Make a list of gene ids in bed file 
ASSEMBLY_DIR=$(dirname $4)
awk '{print ">" $4}' ${accession_bed_output} > ${ASSEMBLY_DIR}/gene_ids.txt
sort ${ASSEMBLY_DIR}/gene_ids.txt > ${ASSEMBLY_DIR}/gene_ids_sorted.txt


# Get protein sequences from fasta file that match gene ids
# First, create one record of a fasta sequence
awk 'BEGIN{
	RS=">"
	FS=" "
}{ 
	sequence=">" $1
	for (i=6; i<=NF; i++){ 
		sequence=sequence " " $i
	} 
	print sequence
}' ${accession_maker_protein} > temp.fa

# Then, select records with gene id in gene id list and reconstruct fasta file format
sort -k 1,1 temp.fa > temp_sorted.fa 
join temp_sorted.fa ${ASSEMBLY_DIR}/gene_ids_sorted.txt > joined.fa 

awk '{ 
	for (i=1; i<= NF; i++) {
		print $i
	}
}' joined.fa > ${accession_fasta_output}

rm joined.fa
rm temp_sorted.fa
rm temp.fa

