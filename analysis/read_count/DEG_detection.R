setwd("/home/xie002/tb_tutorial/analysis/read_count")
getwd()
count_tab <- read.table("yeast_EV_DNMT3B_count.tab",
                        header=T) 
rownames(count_tab) = count_tab[, 1] # count_tab$gene_id
count_tab = count_tab[, -c(1)]

colData <- read.table("sample_info4DESeq2.txt", header = T)
colData$Condition = factor(colData$Condition, c("EV", "DNMT3B"))

library(DESeq2)
dds <- DESeqDataSetFromMatrix(countData = count_tab,
                              colData = colData,
                              design= ~ Condition)
dds <- DESeq(dds)
resultsNames(dds) # lists the coefficients
res  <- results(dds, name="Condition_DNMT3B_vs_EV")
res <- res[order(res$padj), ]
resDF = as.data.frame(res)
resDF$gene_id = rownames(resDF)
resDF <- resDF[, c(7, 1, 2, 3,4,5,6)]
write.table(resDF, file = "yeast_DESeq2_DEG.tab", 
            sep = "\t", quote = FALSE, row.names = FALSE)
# or to shrink log fold changes association with condition:
#res <- lfcShrink(dds, coef="condition_trt_vs_untrt", type="apeglm")

library(ggplot2)
## PCA
vsd <- vst(dds, blind=FALSE)
pcaData <- plotPCA(vsd, intgroup=c("Condition"), returnData=TRUE)
percentVar <- round(100 * attr(pcaData, "percentVar"))

plotFig <- ggplot(pcaData, aes(PC1, PC2, color=Condition)) +
  geom_point(size=3) +
  xlab(paste0("PC1: ",percentVar[1],"% variance")) +
  ylab(paste0("PC2: ",percentVar[2],"% variance")) + 
  coord_fixed()
ggsave(plotFig, filename = "yeast_DESeq2_PCA.pdf")

pdf("yeast_DESeq2_MAplot.pdf")
plotMA(res, ylim=c(-2,2))
dev.off()
