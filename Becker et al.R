getwd()

library(readr)
library(dplyr)
library(tidyr)
library(tibble)
library(biomaRt)
library(rtracklayer)  ## Needed for import()
library(GenomicFeatures)


## Load the attribute information from Cuffnorm ##
Cuffnorm.attr = read_delim("genes.attr_table", delim = "\t") %>% 
  dplyr::rename(external_gene_name = gene_short_name)
# Cuffnorm.attr %>% filter(external_gene_name == "Ahr") %>% View()

## Load the merged.gtf file from Cuffmerge to have the strand information (required by featurecount for counting reads) ##
Cuffmerge.annot.path = file.path("Y:/Deborah.GERARD/CompBetweenOlfCUffAndNewCUff/06072017-CuffquantRes/merged.gtf")

Cuffmerge.annot = import(Cuffmerge.annot.path, format = "GTF")
Cuffmerge.annot[1:10,]

Cuffmerge.annot.df = as.data.frame(Cuffmerge.annot) %>%
  dplyr::rename(tracking_id = gene_id)

head(Cuffmerge.annot.df)

## Load the gene table with FPKMs and fuse the attribute table with ##
Cuffnorm.FPKM = read_delim("genes.fpkm_table", delim = "\t") %>%
  mutate(D0_FPKM = (`ST2-D0_0` + `ST2-D0_1` + `ST2-D0_2`)/3,
         AD1_FPKM = (`A-D1_0` + `A-D1_1` + `A-D1_2`)/3,
         AD3_FPKM = (`A-D3_0` + `A-D3_1` + `A-D3_2`)/3,
         AD5_FPKM = (`A-D5_0` + `A-D5_1` + `A-D5_2`)/3,
         AD9_FPKM = (`A-D9_0` + `A-D9_1` + `A-D9_2`)/3,
         AD15_FPKM = (`A-D15_0` + `A-D15_1` + `A-D15_2`)/3,
         OD1_FPKM = (`O-D1_0` + `O-D1_1` + `O-D1_2`)/3,
         OD3_FPKM = (`O-D3_0` + `O-D3_1` + `O-D3_2`)/3,
         OD5_FPKM = (`O-D5_0` + `O-D5_1` + `O-D5_2`)/3,
         OD9_FPKM = (`O-D9_0` + `O-D9_1` + `O-D9_2`)/3,
         OD15_FPKM = (`O-D15_0` + `O-D15_1` + `O-D15_2`)/3) %>%
  left_join(Cuffnorm.attr, by = "tracking_id") %>%
  dplyr::select(tracking_id, external_gene_name, locus, matches("FPKM")) %>%
  separate(locus, into = c("chr", "region"), sep = ":") %>%
  separate(region, into = c("start", "end"), sep = "-")

View(Cuffnorm.FPKM)

## Extract TSS (=start) from the coordinates and add 2000 bp to the left and right side of the TSS and make the SAF file 
# for featurecount  -  SAF file for H3K4me3 and H3K27ac ##
head(Cuffmerge.annot.df)
Cuffmerge.annot.df.uniq = Cuffmerge.annot.df %>%
  distinct(tracking_id, .keep_all = TRUE) %>%
  dplyr::select(tracking_id, strand) %>%
  tbl_df()

Cuffnorm.FPKM.fin = Cuffnorm.FPKM %>%
  inner_join(Cuffmerge.annot.df.uniq, by = "tracking_id") %>%
  dplyr::select(tracking_id:end, strand, D0_FPKM:OD15_FPKM)

Cuffnorm.FPKM.fin$RealStart = ifelse(Cuffnorm.FPKM.fin$strand == "+", Cuffnorm.FPKM.fin$start, Cuffnorm.FPKM.fin$end)

Cuffnorm.FPKM.fin$TSSMinus2kb = as.numeric(Cuffnorm.FPKM.fin$RealStart) - 2000
Cuffnorm.FPKM.fin$TSSPlus2kb = as.numeric(Cuffnorm.FPKM.fin$RealStart) + 2000

View(Cuffnorm.FPKM.fin)

Cuffnorm.FPKM.TSS = Cuffnorm.FPKM.fin %>%
  dplyr::select(tracking_id, chr, TSSMinus2kb, TSSPlus2kb, strand)

write.table(Cuffnorm.FPKM.TSS, "07072017_H3K4me3_H3K27ac.saf", sep = "\t", col.names = FALSE, row.names = FALSE, quote = FALSE)

## Extract the gene body (start - end) from the coordinates and make the SAF filew for featurecount - 
## SAF file for H3K36me3 ##
# Cuffnorm.FPKM.fin$RealEnd = ifelse(Cuffnorm.FPKM.fin$strand == "+", Cuffnorm.FPKM.fin$end, Cuffnorm.FPKM.fin$start)

Cuffnorm.FPKM.geneBody = Cuffnorm.FPKM.fin %>%
  dplyr::select(tracking_id, chr, start, end, strand)

write.table(Cuffnorm.FPKM.geneBody, "07072017_H3K36me3.saf", sep = "\t", col.names = FALSE, row.names = FALSE, quote = FALSE)


## Calculate RPM (for H3K4me3 and H3K27ac) and RPKM for H3K36me3 ##

rawCounts.K27.K4 = read_delim("07072017-H3K4me3_H3K27ac_RawCounts.txt", delim = "\t", skip = 1,
                              col_types = cols(Chr = col_character(), Start = col_character(), End = col_character())) %>%
  dplyr::rename(H3K4me3_D0_RawCounts = `TC1-H3K4-ST2-D0.GRCm38.p3.q30.sorted.bam`,
                H3K4me3_AD1_RawCounts = `TC1-H3K4-A-D1.GRCm38.p3.q30.sorted.bam`,
                H3K4me3_AD3_RawCounts = `TC1-H3K4-A-D3.GRCm38.p3.q30.sorted.bam`,
                H3K4me3_AD5_RawCounts = `TC1-H3K4-A-D5.GRCm38.p3.q30.sorted.bam`,
                H3K4me3_AD9_RawCounts = `TC1-H3K4-A-D9.GRCm38.p3.q30.sorted.bam`,
                H3K4me3_AD15_RawCounts = `TC1-H3K4-A-D15.GRCm38.p3.q30.sorted.bam`,
                H3K4me3_OD1_RawCounts = `TC1-H3K4-O-D1.GRCm38.p3.q30.sorted.bam`,
                H3K4me3_OD3_RawCounts = `TC1-H3K4-O-D3.GRCm38.p3.q30.sorted.bam`,
                H3K4me3_OD5_RawCounts = `TC1-H3K4-O-D5.GRCm38.p3.q30.sorted.bam`,
                H3K4me3_OD9_RawCounts = `TC1-H3K4-O-D9.GRCm38.p3.q30.sorted.bam`,
                H3K27Ac_D0_RawCounts = `./../../H3K27Ac/Aligned_reads/TC1-H3K27-ST2-D0.GRCm38.p3.q30.sorted.bam`,
                H3K27Ac_AD1_RawCounts = `./../../H3K27Ac/Aligned_reads/TC1-H3K27-A-D1.GRCm38.p3.q30.sorted.bam`,
                H3K27Ac_AD3_RawCounts = `./../../H3K27Ac/Aligned_reads/TC1-H3K27-A-D3.GRCm38.p3.q30.sorted.bam`,
                H3K27Ac_AD5_RawCounts = `./../../H3K27Ac/Aligned_reads/TC1-H3K27-A-D5.GRCm38.p3.q30.sorted.bam`,
                H3K27Ac_AD15_RawCounts = `./../../H3K27Ac/Aligned_reads/TC1-H3K27-A-D15.GRCm38.p3.q30.sorted.bam`,
                H3K27Ac_OD1_RawCounts = `./../../H3K27Ac/Aligned_reads/TC1-H3K27-O-D1.GRCm38.p3.q30.sorted.bam`,
                H3K27Ac_OD3_RawCounts = `./../../H3K27Ac/Aligned_reads/TC1-H3K27-O-D3.GRCm38.p3.q30.sorted.bam`,
                H3K27Ac_OD5_RawCounts = `./../../H3K27Ac/Aligned_reads/TC1-H3K27-O-D5.GRCm38.p3.q30.sorted.bam`,
                H3K27Ac_OD9_RawCounts = `./../../H3K27Ac/Aligned_reads/TC1-H3K27-O-D9.GRCm38.p3.q30.sorted.bam`,
                H3K27Ac_OD15_RawCounts = `./../../H3K27Ac/Aligned_reads/TC1-H3K27-O-D15.GRCm38.p3.q30.sorted.bam`)

View(rawCounts.K27.K4)

rawCounts.K36 = read_delim("07072017_H3K36me3_RawCounts.txt", delim = "\t", skip = 1,
                              col_types = cols(Chr = col_character(), Start = col_character(), End = col_character())) %>%
  dplyr::rename(H3K36me3_D0_RawCounts = `TC1-H3K36-ST2-D0.GRCm38.p3.q30.sorted.bam`,
                H3K36me3_AD1_RawCounts = `TC1-H3K36-A-D1.GRCm38.p3.q30.sorted.bam`,
                H3K36me3_AD3_RawCounts = `TC1-H3K36-A-D3.GRCm38.p3.q30.sorted.bam`,
                H3K36me3_AD5_RawCounts = `TC1-H3K36-A-D5.GRCm38.p3.q30.sorted.bam`,
                H3K36me3_AD9_RawCounts = `TC1-H3K36-A-D9.GRCm38.p3.q30.sorted.bam`,
                H3K36me3_AD15_RawCounts = `TC1-H3K36-A-D15.GRCm38.p3.q30.sorted.bam`,
                H3K36me3_OD1_RawCounts = `TC1-H3K36-O-D1.GRCm38.p3.q30.sorted.bam`,
                H3K36me3_OD3_RawCounts = `TC1-H3K36-O-D3.GRCm38.p3.q30.sorted.bam`,
                H3K36me3_OD5_RawCounts = `TC1-H3K36-O-D5.GRCm38.p3.q30.sorted.bam`,
                H3K36me3_OD9_RawCounts = `TC1-H3K36-O-D9.GRCm38.p3.q30.sorted.bam`,
                H3K36me3_OD15_RawCounts = `TC1-H3K36-O-D15.GRCm38.p3.q30.sorted.bam`)

rawCounts.K36

# Create a function that does the calculation of RPM and RPKM ##
RPMFunc = function(ReadsCount){
  millionsMapped = sum(ReadsCount)/1e+06
  rpm = ReadsCount/millionsMapped
  return(rpm)
}

RPKMFunc = function(ReadsCount, lght){
  geneLghtKB = lght/1000
  millionsMapped = sum(ReadsCount)/1e+06
  rpm = ReadsCount/millionsMapped
  rpkm = rpm/geneLghtKB
  return(rpkm)
}

# Calculate RPM for H3K4me3 and H3K27Ac #
RPM.K27.K4 = apply(dplyr::select(rawCounts.K27.K4, matches("RawCounts")), 2, function (x) RPMFunc(ReadsCount = x)) %>%
  tbl_df() %>%
  dplyr::rename(H3K4me3_D0_RPM = H3K4me3_D0_RawCounts,
                H3K4me3_AD1_RPM = H3K4me3_AD1_RawCounts,
                H3K4me3_AD3_RPM = H3K4me3_AD3_RawCounts,
                H3K4me3_AD5_RPM = H3K4me3_AD5_RawCounts,
                H3K4me3_AD9_RPM = H3K4me3_AD9_RawCounts,
                H3K4me3_AD15_RPM = H3K4me3_AD15_RawCounts,
                H3K4me3_OD1_RPM = H3K4me3_OD1_RawCounts,
                H3K4me3_OD3_RPM = H3K4me3_OD3_RawCounts,
                H3K4me3_OD5_RPM = H3K4me3_OD5_RawCounts,
                H3K4me3_OD9_RPM = H3K4me3_OD9_RawCounts,
                H3K27Ac_D0_RPM = H3K27Ac_D0_RawCounts,
                H3K27Ac_AD1_RPM = H3K27Ac_AD1_RawCounts,
                H3K27Ac_AD3_RPM = H3K27Ac_AD3_RawCounts,
                H3K27Ac_AD5_RPM = H3K27Ac_AD5_RawCounts,
                H3K27Ac_AD15_RPM = H3K27Ac_AD15_RawCounts,
                H3K27Ac_OD1_RPM = H3K27Ac_OD1_RawCounts,
                H3K27Ac_OD3_RPM = H3K27Ac_OD3_RawCounts,
                H3K27Ac_OD5_RPM = H3K27Ac_OD5_RawCounts,
                H3K27Ac_OD9_RPM = H3K27Ac_OD9_RawCounts,
                H3K27Ac_OD15_RPM = H3K27Ac_OD15_RawCounts) %>%
  bind_cols(rawCounts.K27.K4) %>%
  dplyr::select(Geneid, Chr, Start, End, Strand, Length, matches("RPM"))
RPM.K27.K4

# Calculate RPKM for H3K36me3 #
gene.length = as.vector(dplyr::select(rawCounts.K36, Length))
RPKM.K36 = apply(dplyr::select(rawCounts.K36, matches("RawCounts")), 2, function(x) RPKMFunc(ReadsCount = x, lght = gene.length)) %>%
  as.data.frame() %>%
  dplyr::rename(H3K36me3_D0_RPKM = Length,
                H3K36me3_AD1_RPKM = Length.1,
                H3K36me3_AD3_RPKM = Length.2,
                H3K36me3_AD5_RPKM = Length.3,
                H3K36me3_AD9_RPKM = Length.4,
                H3K36me3_AD15_RPKM = Length.5,
                H3K36me3_OD1_RPKM = Length.6,
                H3K36me3_OD3_RPKM = Length.7,
                H3K36me3_OD5_RPKM = Length.8,
                H3K36me3_OD9_RPKM = Length.9,
                H3K36me3_OD15_RPKM = Length.10) %>%
  bind_cols(rawCounts.K36) %>%
  dplyr::select(Geneid, Chr, Start, End, Strand, Length, matches("RPKM")) %>%
  tbl_df()

RPKM.K36

## Merge chip-seq data and rna-seq data together ##
Cuffnorm.FPKM = Cuffnorm.FPKM %>% dplyr::rename(Geneid = tracking_id)
RPM.K27.K4
RPKM.K36

merge.dat = Cuffnorm.FPKM %>% 
  left_join(RPM.K27.K4, by = "Geneid") %>%
  left_join(RPKM.K36, by = "Geneid") %>%
  dplyr::select(Geneid:OD15_FPKM, H3K4me3_D0_RPM:H3K27Ac_OD15_RPM, H3K36me3_D0_RPKM:H3K36me3_OD15_RPKM)
merge.dat

## Remove the non-conform chromosome (PATCHES) ##
mouse.chr = c(1:19, "X", "Y")
merge.dat.chr = merge.dat %>%
  filter(chr %in% mouse.chr)

write.table(merge.dat, "07072017-Becker_et_al_data.txt", sep = "\t", row.names = FALSE, col.names = TRUE, quote = FALSE)
write.table(merge.dat.chr, "07072017-Becker_et_al_data_filt.txt", sep = "\t", row.names = FALSE, col.names = TRUE, quote = FALSE)

## Retrieve 3' UTR sequence ##
f = file.path("Mus_musculus.GRCm38.79.gtf")
annot.Ens = import(f, format = "GTF")
annot.Ens[1:10,]
annot.Ens.df = as.data.frame(annot.Ens)
head(annot.Ens.df)

## Only keep regular chromosomes (1->19, X, Y)  and remove strand as being a star (*) because makeTxDbFromGRanges gives an arror otherwise ##
# unknowStrand = c("*")
annot.Ens.df.filt = annot.Ens.df %>%
  filter(seqnames %in% mouse.chr) %>%
  # filter(!strand %in% unknowStrand) %>%
  makeGRangesFromDataFrame(keep.extra.columns = TRUE, ignore.strand = FALSE)

## Convert the data frame to a GR object to be able to save as a TxDb object
annot.Ens.GR = makeTxDbFromGRanges(annot.Ens.df.filt)
annot.Ens.GR
saveDb(annot.Ens.GR, "07072017-Mus_musculus.GRCm38.79_Ensembl.sqlite")

## Retrieve the 3'UTR ##
threeUTR = threeUTRsByTranscript(annot.Ens.GR, use.names = TRUE)
threeUTR
lgththreeUTR = width(ranges(threeUTR))
head(lgththreeUTR)
lgththreeUTR.df = as.data.frame(lgththreeUTR)

# Sum the with of exons for having the length of the 3' UTR
lgththreeUTR.df.new = lgththreeUTR.df %>% 
  group_by(group, group_name) %>% 
  summarise(sum(value)) %>%
  rename(ensembl_transcript_id = group_name, threeUTR = `sum(value)`)

## Now retreive the sequences of 3'UTR ##
mart = listMarts(host = "mar2015.archive.ensembl.org") ## Use the same mart as the GTF file that I have downloaded (Mus_musculus.GRCm38.79.gtf)
ens79 = useMart(host = "mar2015.archive.ensembl.org", biomart = "ENSEMBL_MART_ENSEMBL", dataset = "mmusculus_gene_ensembl")
listDatasets(ens79)

filt = listFilters(ens79)

attri = listAttributes(ens79)

genes = getBM(mart = ens79, attributes = c("ensembl_gene_id", "ensembl_transcript_id", "external_gene_name"))
head(genes)
seqthreeUTR = getSequence(seqType = "3utr", mart = ens79, type = "ensembl_transcript_id", id = genes$ensembl_transcript_id)
head(seqthreeUTR)

## Combine the sequence of the 3'UTR with the length ##
lgththreeUTR.df.new
threeUTRFin = left_join(lgththreeUTR.df.new, seqthreeUTR, by = "ensembl_transcript_id") %>%
  left_join(genes, by = "ensembl_transcript_id") %>%
  dplyr::select(ensembl_gene_id, ensembl_transcript_id, external_gene_name, threeUTR, `3utr`) %>%
  ungroup() %>%
  dplyr::select(-group)
threeUTRFin


## Associate the 3'UTR data (and sequences) to the XLOC_ID ##
uniq.XLOC = Cuffmerge.annot.df %>%
  dplyr::select(tracking_id, gene_name, nearest_ref) %>%
  tbl_df()

View(Cuffmerge.annot.df)
View(uniq.XLOC)

Cuffmerge.annot.df.light = uniq.XLOC %>%
  rename(ensembl_transcript_id = nearest_ref)
Cuffmerge.annot.df.light

threeUTRFin.XLOC = Cuffmerge.annot.df.light %>%
  left_join(threeUTRFin, by = "ensembl_transcript_id") %>%
  group_by(tracking_id) %>%
  summarize_all(funs(paste(., collapse = ","))) %>%
  rename(`3UTR_Length` = threeUTR, `3UTR_Seq` = `3utr`)
View(threeUTRFin.XLOC)

write.table(threeUTRFin.XLOC, "07072017-3UTR_Seq.txt", row.names = FALSE, col.names = TRUE, sep = "\t", quote = FALSE)
