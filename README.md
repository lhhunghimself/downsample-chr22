# Downsample Repository

This repository contains a set of scripts for downsampling genomic data, including BAM files, GTF files, gene information files (TSV), and reference genome FASTA files. These scripts are particularly useful for selecting specific chromosomes and their corresponding data from larger genomic datasets, making it more efficient to work with the data.

## Table of Contents

1. [Requirements](#requirements)
2. [Usage](#usage)
3. [Description of Scripts](#description-of-scripts)

## Requirements

1. [Samtools](http://www.htslib.org/)
2. [Perl](https://www.perl.org/)

## Usage

To use these scripts, follow the steps below:

1. Clone the repository.
2. Make the scripts executable by running `chmod +x script_name` for each script.
3. Run the scripts using the appropriate command line arguments as described in the [Description of Scripts](#description-of-scripts) section.

## Description of Scripts

1. **downsample.sh**: This script downsamples a BAM file, GTF file, and counts file for a specified chromosome. Usage: `./downsample.sh bamfile gtf counts chr`

2. **downsampleGeneInfo.sh**: This script downsamples a gene information file (TSV) for a specified chromosome. Usage: `./downsampleGeneInfo.sh gencode.gene.info.v22.tsv chr`

3. **downsampleCounts.pl**: This Perl script downsamples a counts file based on the genes present in a GTF file. Usage: `./downsampleCounts.pl gtf counts`

4. **downsampleReference.pl**: This Perl script downsamples a reference genome FASTA file by removing all other chromosomes except the specified one. Usage: `./downsampleReference.pl GRCh38.d1.vd1.fa chr > GRCh38.d1.vd1.chr22.fa`

Remember to replace the input file names and chromosome names with your own data and desired chromosome.
