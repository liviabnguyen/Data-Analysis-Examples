#install.packages("ggdendro")
setwd("~/desktop")

options(stringasFactor = F)

library(ggplot2)
library(ggdendro)

dm <- read.table("zGC_RLE_dist_mtx.txt")

dm <- as.dist(dm)

# hierarchical clustering
hc <- hclust(dm)

p <- ggdendrogram(hc)

ggsave("~/desktop/zGC_RLE_ggd.jpeg", p , height=3, width=3)

