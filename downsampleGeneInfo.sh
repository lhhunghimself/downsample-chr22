#!/bin/bash

#usage downsampleGeneInfo.sh  gencode.gene.info.v22.tsv chr22

geneinfo=$1
chr=$2


geneinfobase=$(basename $geneinfo)
head -1 $geneinfo > "${geneinfobase%.tsv}.$chr.tsv"
echo "cat $geneinfo | grep '$chr' >> ${geneinfobase%.tsv}.$chr.tsv"
eval "cat $geneinfo | grep '$chr' >> ${geneinfobase%.tsv}.$chr.tsv"


