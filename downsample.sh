#!/bin/bash

#usage downsample.sh bamfile gtf counts chr22
nThreads=4

bam=$1
gtf=$2
counts=$3
chr=$4

#downsample bam
bambase=$(basename $bam)
echo "samtools view -b $bam $chr -o ${bambase%.bam}.$chr.bam"
samtools view -b $bam $chr -o ${bambase%.bam}.$chr.bam
samtools index ${bambase%.bam}.$chr.bam

#create fastq
samtools sort -n -@ $nThreads -o ${bambase%.bam}.$chr.sorted.bam ${bambase%.bam}.$chr.bam
samtools fastq -@ $nThreads -1 ${bambase%.bam}.$chr.R1.fq -2 ${bambase%.bam}.$chr.R2.fq -s singleton.fq -0 ambig.f1 ${bambase%.bam}.$chr.sorted.bam


#downsample gtf
gtfbase=$(basename $gtf)
echo "cat $gtf | grep '^$chr' > ${gtfbase%.gtf}.$chr.gtf"
eval "cat $gtf | grep '^$chr'> ${gtfbase%.gtf}.$chr.gtf "

#downsample counts
downsampleCounts.pl $gtf $counts > counts.$chr
