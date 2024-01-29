#!/usr/bin/env bash

# This script builds a TSV file out of the TE annotation GFF file, keeping only relevant columns.
# Usage: bash modify_TE_annotation_gff.sh <TE annotation GFF file>

filename=$(basename $1 .gff3)
OUTPUT_DIR=$(dirname $1)

awk -F "[\t;=]" 'BEGIN{
        OFS="\t"
        print "seqid","source","type","start","end","score","strand","ID","name","classification","sequence_ontology","identity","method"
}{
        if( !( $1 ~ /#/ )){
                if( $11 ~ /Name/ ){
                        print $1,$2,$3,$4,$5,$6,$7,$10,$12,$14,$16,$18,$20
                }else{
                        print $1,$2,$3,$4,$5,$6,$7,$10,$14,$16,$18,$20,$22
                }
        }
}' $1 >> ${OUTPUT_DIR}/${filename}.tsv

