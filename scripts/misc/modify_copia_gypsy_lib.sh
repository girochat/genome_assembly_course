#!/usr/bin/env bash

filename=$(basename $1 .tsv)

awk 'BEGIN{ 
        FS="[\t#]"
        OFS="\t" 
}{
        if( !( $0 ~ /Order/ )){
                
                print $1,$3,$4,$5,$6,$8
        }else{
                print "name","order","superfamily","clade","complete","domains"
        }
}' $1 >> ${filename}_modif.tsv

