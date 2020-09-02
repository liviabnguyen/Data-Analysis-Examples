options(stringsAsFactors=F)
setwd("~/desktop")
#install.packages("data.table")
#install.packages('R.utils')
#install.packages('analogue')
library(R.utils)
library(data.table)
library(analogue)

df <- fread("kmer_counts_12mers_anno_GC_TMM_norm.txt")

buscos <- fread("kmers_in_buscos.txt.gz")

buscos
sub <- df[df$mer %in% buscos$V1,]

sub1 <- df[!df$mer %in% buscos$V1,]

fwrite(sub, "buscos.txt", quote=F, sep="\t", row.names = F,)
fwrite(sub1, "not_buscos.txt", quote=F, sep="\t", row.names = F,)

