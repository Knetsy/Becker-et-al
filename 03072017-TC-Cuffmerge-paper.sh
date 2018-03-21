#!/bin/bash

## 03072017-Cuffmerge-merge together several Cufflinks assemblies, It handles also handles running Cuffcompare for you, 
#and automatically filters a number of transfrags that are probably artfifacts. I
# If you have a reference GTF file available, you can provide it to the script in order to gracefully merge novel isoforms and known isoforms and maximize overall assembly quality

## -s => This argument should point to the genomic DNA sequences for the reference. If a directory, it should contain one fasta file per contig. 
# If a multifasta file, all contigs should be present. The merge script will pass this option to cuffcompare, which will use the sequences to assist in classifying transfrags and excluding artifacts (e.g. repeats). 
# For example, Cufflinks transcripts consisting mostly of lower-case bases are classified as repeats.

## Put cuffmerge into the path ##
export PATH=/work/users/dgerard/programs/cufflinks-2.2.1.Linux_x86_64:$PATH

## Change the directory where the assembly text file is ##
cd /scratch/users/dgerard/DebbyScripts

## Run Cuffmerge ##
cuffmerge -o CuffmergeJulisPaper -g /scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -p \
12 -s /scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa 03072017-TC-Cuffmerge-Assemblies.txt
