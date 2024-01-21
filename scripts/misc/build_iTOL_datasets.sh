#!/usr/bin/env bash

# This script builds colour strip and simple bar annotation dataset for iTOL for superfamily phylogenetic tree.
# Usage: bash build_iTOL_datasets.sh <superfamily TESorter classification file (.cls.tsv)> <colour dataset> <superfamily RT protein sequences (fasta)> <EDTA summary file> <superfamily name (with capital letter)> <simple bar dataset> 

# Store script arguments into variables
annotation_file=$1
colour_dataset=$2
RT_prot_sequences=$3
EDTA_summary=$4
lib_type=$5
bar_dataset=$6

# Define specific colours per clade in the colour dataset
awk 'BEGIN{
	colours["Reina"]="#000080"
	colours["Athila"]="#e6c300"
	colours["Retand"]="#ffa352"
	colours["CRM"]="#00cccc"
	colours["Tekay"]="#008000"

	colours["Ivana"]="#008000"
	colours["SIRE"]="#00cccc"
	colours["Ale"]="#000080"
	colours["Tork"]="#800080"
	colours["Bianca"]="#e6c300"
	colours["TAR"]="#ff6666"
	colours["Ikeros"]="#ffa352"	
}{
	print $1,colours[$4],$4
}' ${annotation_file} >> ${colour_dataset}


# Create file with superfamily-specific TE id number that have RT sequence
awk -F "[>#]" '$0 ~ /TE_/ {
	print $2
}' ${RT_prot_sequences} >> TE_ids.txt

# Retrieve count of each TE in the EDTA summary
grep -f TE_ids.txt ${EDTA_summary} >> temp.txt

# Store the count of each TE in the simple bar datasets
awk -v var=${lib_type} '{
	print $1 "#LTR/" var "," $2
}' temp.txt >> ${bar_dataset}

rm temp.txt
rm TE_ids.txt 
