#!/usr/bin/env bash

# This script modifies a TE superfamily (Copia or Gypsy) library TSV file to keep only relevant columns.
# Usage: bash modify_copia_gypsy_lib.sh <superfamily library file>  

# Get file name and data directory
filename=$(basename $1 .tsv)
DATA_DIR=$(dirname $1)

# Extract relevant columns from TSV library file
awk 'BEGIN{ 
        FS="[\t#]"
        OFS="\t" 
}{
        if( !( $0 ~ /Order/ )){
                
                print $1,$3,$4,$5,$6,$8
        }else{
                print "name","order","superfamily","clade","complete","domains"
        }
}' $1 >> ${DATA_DIR}/${filename}_modif.tsv

