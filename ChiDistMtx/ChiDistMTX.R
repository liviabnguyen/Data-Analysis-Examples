options(stringsAsFactors=F)

# set for desktop
setwd("~/desktop")

# import libaries
# install.packages("analogue")
library(analogue)

# import data
df<-read.table("kmer_abund.txt", header=T)

# get rid of GC column
# df$Feature<-NULL

# set rownames to kmers
row.names(df)<-df$Feature

# get rid of mer columns
df$Feature<-NULL

# transpose to make make samples rows and kmers columns
df<-t(df)

# calculate distance matrix
dm<-as.matrix(distance(df, method = "chi.distance"))

# write out the distances
write.table(dm, "kmer_abund_dist_mtx.txt", sep="\t", quote=F)


