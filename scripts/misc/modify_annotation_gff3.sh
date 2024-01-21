#!/usr/bin/env bash

filename=$(basename $1 .gff3)

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
}' $1 >> ${filename}.tsv

