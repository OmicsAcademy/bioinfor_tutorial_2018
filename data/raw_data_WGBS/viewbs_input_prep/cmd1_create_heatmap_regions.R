tab<-read.table("gene_coor.meth_heat.dnmt3b1.txt", header=T, row.names=1)
head(tab)
pheatmap(tab_new, na_col = "grey", cluster_rows=F, cluster_cols=F)
tab_new<-tab[order(rowSums(tab), decreasing=T), ]
library(pheatmap)
pheatmap(tab_new, na_col = "grey", cluster_rows=F, cluster_cols=F)
pheatmap(tab_new, na_col = "grey", cluster_rows=T, cluster_cols=F)
tab_noNA<- tab[complete.cases(tab), ]
pheatmap(tab_noNA, na_col = "grey", cluster_rows=T, cluster_cols=F)

