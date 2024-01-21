#!/usr/bin/env bash

# This script extracts the Gypsy and Copia TE genomic sequences out of an EDTA or other TE library (fasta format).
# Usage: bash extract_copia_gypsy.sh <library file> <output directory> <library type>

# Get EDTA library file
EDTA_library=$1
OUTPUT_DIR=$2
lib_type=$3

# Extract only Gypsy sequences from EDTA library
awk 'BEGIN{
	extract=0
}{ 
	if($1 ~ />/){
		if($1 ~ /Gypsy/){
			extract=1
		}else{
			extract=0
		}
	}
	if(extract == 1){
		print $0
	}
}' ${EDTA_library} >> ${OUTPUT_DIR}/gypsy_library${lib_type}.fasta

# Extract only Copia sequences from EDTA library
awk 'BEGIN{
        extract=0
}{ 
        if($1 ~ />/){
		if($1 ~ /Copia/){
                	extract=1
        	}else{ 
			extract=0 
        	}
	}
        if(extract == 1){ 
                print $0
        }
}' ${EDTA_library} >> ${OUTPUT_DIR}/copia_library${lib_type}.fasta

