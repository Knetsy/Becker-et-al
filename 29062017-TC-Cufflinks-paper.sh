#!/bin/bash

## 30032017 - Gerard et al. -  Use Cufflinks 2.2.1 to make the transcriptome assembly ##

## Export Cufflinks into the PATH ##
export PATH=/work/users/dgerard/programs/cufflinks-2.2.1.Linux_x86_64:$PATH

## Go to the directory where the BAM files are for the 1st biological replicate ##
cd /scratch/users/dgerard/RNA-seq-rep1/MappedReads/XSattriBAM/

## Run the transcriptome assembly for the 1st biological replicate ##

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep1/CufflinksPaper/ST2-D0 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.TC1_ST2_D0_1_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam  

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep1/CufflinksPaper/A-D1 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.TC1_A_D1_3_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep1/CufflinksPaper/A-D3 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.TC1_A_D3_2_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep1/CufflinksPaper/A-D5 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.TC1_A_D5_1_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep1/CufflinksPaper/A-D9 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.TC1_A_D9_2_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep1/CufflinksPaper/A-D15 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.TC1_A_D15_2_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep1/CufflinksPaper/O-D1 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.TC1_O_D1_2_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep1/CufflinksPaper/O-D3 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H0Y3NBGXX_TC1-O-D3-2_14s006637-1-1_Sinkkonen_lane114s006637_1_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep1/CufflinksPaper/O-D5 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.TC1_O_D5_1_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep1/CufflinksPaper/O-D9 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.TC1_O_D9_1_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep1/CufflinksPaper/O-D15 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.TC1_O_D15_3_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

## Change the directory where the BAM files are for the 2nd biological replicate ##
cd /scratch/users/dgerard/RNA-seq-rep2/MappedReads/XSattriBAM

## Run the transcriptome assembly for the 2nd biological replicate ##

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep2/CufflinksPaper/ST2-D0 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H5TCCBGXX_TC2-ST2-D0-3_15s009482-1-1_Sinkkonen_lane115s009482_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep2/CufflinksPaper/A-D1 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H5TCCBGXX_TC2-A-D1-1_15s009483-1-1_Sinkkonen_lane115s009483_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep2/CufflinksPaper/A-D3 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H5TCCBGXX_TC2-A-D3-2_15s009485-1-1_Sinkkonen_lane115s009485_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep2/CufflinksPaper/A-D5 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H5TCCBGXX_TC2-A-D5-3_15s009487-1-1_Sinkkonen_lane115s009487_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep2/CufflinksPaper/A-D9 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H5TCCBGXX_TC2-A-D9-1_15s009489-1-1_Sinkkonen_lane115s009489_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep2/CufflinksPaper/A-D15 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H5TCCBGXX_TC2-A-D15-3_15s009491-1-1_Sinkkonen_lane115s009491_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep2/CufflinksPaper/O-D1 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H5TCCBGXX_TC2-O-D1-3_15s009484-1-1_Sinkkonen_lane115s009484_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep2/CufflinksPaper/O-D3 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H5TCCBGXX_TC2-O-D3-3_15s009486-1-1_Sinkkonen_lane115s009486_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep2/CufflinksPaper/O-D5 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H5TCCBGXX_TC2-O-D5-2_15s009488-1-1_Sinkkonen_lane115s009488_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep2/CufflinksPaper/O-D9 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H5TCCBGXX_TC2-O-D9-3_15s009490-1-1_Sinkkonen_lane115s009490_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep2/CufflinksPaper/O-D15 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H5TCCBGXX_TC2-O-D15-3_15s009492-1-1_Sinkkonen_lane115s009492_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

## Change the directory where the BAN files are for the 3rd biological replicate ##
cd /scratch/users/dgerard/RNA-seq-rep3/MappedReads/XSattriBAM

## Run the transcriptome assembly for the 3rd biological replicate ##

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep3/CufflinksPaper/ST2-D0 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H7LKGBGXX_TC3-ST2-D0-1_15s009493-1-1_Sinkkonen_lane115s009493_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep3/CufflinksPaper/A-D1 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H7LKGBGXX_TC3-A-D1-3_15s009494-1-1_Sinkkonen_lane115s009494_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep3/CufflinksPaper/A-D3 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H7LKGBGXX_TC3-A-D3-3_15s009496-1-1_Sinkkonen_lane115s009496_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep3/CufflinksPaper/A-D5 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H7LKGBGXX_TC3-A-D5-2_15s009498-1-1_Sinkkonen_lane115s009498_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep3/CufflinksPaper/A-D9 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H7LKGBGXX_TC3-A-D9-2_15s009500-1-1_Sinkkonen_lane115s009500_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep3/CufflinksPaper/A-D15 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H7LKGBGXX_TC3-A-D15-3_15s009502-1-1_Sinkkonen_lane115s009502_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep3/CufflinksPaper/O-D1 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H7LKGBGXX_TC3-O-D1-1_15s009495-1-1_Sinkkonen_lane115s009495_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep3/CufflinksPaper/O-D3 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H7LKGBGXX_TC3-O-D3-2_15s009497-1-1_Sinkkonen_lane115s009497_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep3/CufflinksPaper/O-D5 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H7LKGBGXX_TC3-O-D5-2_15s009499-1-1_Sinkkonen_lane115s009499_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep3/CufflinksPaper/O-D9 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H7LKGBGXX_TC3-O-D9-1_15s009501-1-1_Sinkkonen_lane115s009501_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam

cufflinks -p 12 -o /scratch/users/dgerard/RNA-seq-rep3/CufflinksPaper/O-D15 -g \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.79.gtf -b \
/scratch/users/dgerard/RNA-seq-rep1/mm10fromENSEMBL/Mus_musculus.GRCm38.dna.primary_assembly.fa -u \
--library-type fr-unstranded ./Mapped.Trim.H7LKGBGXX_TC3-O-D15-2_15s009503-1-1_Sinkkonen_lane115s009503_sequence.txt.worRNAreads.txt.gzAligned.sortedByCoord.out.bam
