#!/bin/bash

#usage downsample.sh bamfile gtf counts chr22
nThreads=4

bam=$1
gtf=$2
counts=$3
chr=$4

#downsample bam
bambase=$(basename $bam)
echo "samtools view -b $bam $chr -o ${bambase::-4}.$chr.bam" 
samtools view -b $bam $chr -o ${bambase::-4}.$chr.bam
samtools index ${bambase::-4}.$chr.bam

#create fastq
samtools sort -n -@ $nThreads -o ${bambase::-4}.$chr.sorted.bam ${bambase::-4}.$chr.bam
samtools fastq -@ $nThreads -1 ${bambase::-4}.$chr.R1.fq -2 ${bambase::-4}.$chr.R2.fq -s singleton.fq -0 ambig.f1 ${bambase::-4}.$chr.sorted.bam


#downsample gtf
gtfbase=$(basename $gtf)
echo "cat $gtf | grep '^$chr' > ${gtfbase::-4}.$chr.gtf"
eval "cat $gtf | grep '^$chr'> ${gtfbase::-4}.$chr.gtf " 

#downsample counts
downsampleCounts.pl $gtf $counts > counts.$chr


