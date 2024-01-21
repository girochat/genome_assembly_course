#!/usr/bin/env bash

# This script extracts the RT protein sequence of Copia and Gypsy TE elements from the TESorter protein sequence library (.dom.faa file).
# Usage: bash extract_RT_prot_seq.sh <copia protein sequences> <gypsy protein sequences> <output directory>

# Store script arguments into variables
copia_filename=$(basename $1 .faa)
gypsy_filename=$(basename $2 .faa)
OUTPUT_DIR=$(dirname $1)

# Extract sequences for Copia and then Gypsy
awk 'BEGIN{
	FS="|"
	extract=0
}{
	if( $0 ~ /Ty1-RT/){
		extract=1
	}else{
		if( $1 ~ /^>/ ){
			extract=0
		}
	}
	if( extract==1 ){
		print $1
	}
}' ${OUTPUT_DIR}/${copia_filename}.faa >> ${OUTPUT_DIR}/copia_RT_sequences.fasta

awk 'BEGIN{
        FS="|"
	extract=0
}{
        if( $0 ~ /Ty3-RT/){
                extract=1
        }else{
                if( $1 ~ /^>/ ){
                        extract=0
                }
        }
	if( extract==1 ){
		print $1
	}
}' ${OUTPUT_DIR}/${gypsy_filename}.faa >> ${OUTPUT_DIR}/gypsy_RT_sequences.fasta
	
