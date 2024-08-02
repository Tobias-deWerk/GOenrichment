library(clusterProfiler)
library(enrichplot)

GOEnrichment <- function(genes_of_interest, universe, gene_to_GO, ontology = 'BP'){
  
  TERM2GENE = gene_to_GO[gene_to_GO$Ontology == ontology, c('GOterm', 'LocusID')]
  TERM2GENE$LocusID = substr(TERM2GENE$LocusID, start = 1, stop = 16)
  TERM2NAME = gene_to_GO[gene_to_GO$Ontology == ontology, c('GOterm', 'GOdesc')]
  results <- clusterProfiler::enricher(gene = genes_of_interest, universe = universe, TERM2GENE = TERM2GENE, TERM2NAME = TERM2NAME)
  
  return(results)
}

results <- GOEnrichment(genes_of_interest = "A vector of your genes of interest",
                        universe = "A vector containing all genes in your data",
                        gene_to_GO = "The gene to GO conversion mapping provided below",
                        ontology = "Biological process (BP) / Molecular Function (MF) / Cellular Component (CC)")


dotplot(results, showCategory=20) + ggtitle("GO Enrichment Dot Plot")

#Example case
genes_of_interest = read.table(file = "GoIs.txt", sep = "\n")$V1
universe = read.table(file = "universe.txt", sep = "\n")$V1
gene_to_GO = read.csv(file = "gene-to-GO-ALL.csv")

results <- GOEnrichment(genes_of_interest = genes_of_interest,
                        universe = universe,
                        gene_to_GO = gene_to_GO,
                        ontology = "BP")

# Create a dot plot
dotplot(results, showCategory=20) + ggtitle("GO Enrichment Dot Plot")
