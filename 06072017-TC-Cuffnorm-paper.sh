#!/bin/bash

## 06072017 - Gerard et al. -  Use Cuffquant from the Cufflinks suite 2.2.1 to quantify the transcriptome assembly ##
## Cufflinks includes a program, “Cuffnorm”, that you can use to generate tables of expression values that are properly normalized for library size
## Export Cufflinks suite and Cuffquant into the PATH ##
export PATH=/work/users/dgerard/programs/cufflinks-2.2.1.Linux_x86_64:$PATH

## Go to the directory where you want the results to be saved ##
cd /scratch/users/dgerard/06072017-CuffquantRes/

## Run the Cuffnorm ##

cuffnorm ./../DebbyScripts/CuffmergeJulisPaper/merged.gtf -o ./ -L ST2-D0,A-D1,A-D3,A-D5,A-D9,A-D15,O-D1,O-D3,O-D5,O-D9,O-D15 \
-p 12 --library-type fr-unstranded --library-norm-method geometric --output-format simple-table --compatible-hits-norm \
/scratch/users/dgerard/RNA-seq-rep1/CuffquantPaper/ST2-D0/abundances.cxb,/scratch/users/dgerard/RNA-seq-rep2/CuffquantPaper/ST2-D0/abundances.cxb,/scratch/users/dgerard/RNA-seq-rep3/CuffquantPaper/ST2-D0/abundances.cxb \
/scratch/users/dgerard/RNA-seq-rep1/CuffquantPaper/A-D1/abundances.cxb,/scratch/users/dgerard/RNA-seq-rep2/CuffquantPaper/A-D1/abundances.cxb,/scratch/users/dgerard/RNA-seq-rep3/CuffquantPaper/A-D1/abundances.cxb \
/scratch/users/dgerard/RNA-seq-rep1/CuffquantPaper/A-D3/abundances.cxb,/scratch/users/dgerard/RNA-seq-rep2/CuffquantPaper/A-D3/abundances.cxb,/scratch/users/dgerard/RNA-seq-rep3/CuffquantPaper/A-D3/abundances.cxb \
/scratch/users/dgerard/RNA-seq-rep1/CuffquantPaper/A-D5/abundances.cxb,/scratch/users/dgerard/RNA-seq-rep2/CuffquantPaper/A-D5/abundances.cxb,/scratch/users/dgerard/RNA-seq-rep3/CuffquantPaper/A-D5/abundances.cxb \
/scratch/users/dgerard/RNA-seq-rep1/CuffquantPaper/A-D9/abundances.cxb,/scratch/users/dgerard/RNA-seq-rep2/CuffquantPaper/A-D9/abundances.cxb,/scratch/users/dgerard/RNA-seq-rep3/CuffquantPaper/A-D9/abundances.cxb \
/scratch/users/dgerard/RNA-seq-rep1/CuffquantPaper/A-D15/abundances.cxb,/scratch/users/dgerard/RNA-seq-rep2/CuffquantPaper/A-D15/abundances.cxb,/scratch/users/dgerard/RNA-seq-rep3/CuffquantPaper/A-D15/abundances.cxb \
/scratch/users/dgerard/RNA-seq-rep1/CuffquantPaper/O-D1/abundances.cxb,/scratch/users/dgerard/RNA-seq-rep2/CuffquantPaper/O-D1/abundances.cxb,/scratch/users/dgerard/RNA-seq-rep3/CuffquantPaper/O-D1/abundances.cxb \
/scratch/users/dgerard/RNA-seq-rep1/CuffquantPaper/O-D3/abundances.cxb,/scratch/users/dgerard/RNA-seq-rep2/CuffquantPaper/O-D3/abundances.cxb,/scratch/users/dgerard/RNA-seq-rep3/CuffquantPaper/O-D3/abundances.cxb \
/scratch/users/dgerard/RNA-seq-rep1/CuffquantPaper/O-D5/abundances.cxb,/scratch/users/dgerard/RNA-seq-rep2/CuffquantPaper/O-D5/abundances.cxb,/scratch/users/dgerard/RNA-seq-rep3/CuffquantPaper/O-D5/abundances.cxb \
/scratch/users/dgerard/RNA-seq-rep1/CuffquantPaper/O-D9/abundances.cxb,/scratch/users/dgerard/RNA-seq-rep2/CuffquantPaper/O-D9/abundances.cxb,/scratch/users/dgerard/RNA-seq-rep3/CuffquantPaper/O-D9/abundances.cxb \
/scratch/users/dgerard/RNA-seq-rep1/CuffquantPaper/O-D15/abundances.cxb,/scratch/users/dgerard/RNA-seq-rep2/CuffquantPaper/O-D15/abundances.cxb,/scratch/users/dgerard/RNA-seq-rep3/CuffquantPaper/O-D15/abundances.cxb

