library(clusterProfiler)
GOEnrichment <- function(genes_of_interest, universe, gene_to_GO, ontology = 'BP'){
  
  TERM2GENE = gene_to_GO[gene_to_GO$Ontology == ontology, c('GOterm', 'LocusID')]
  TERM2GENE$LocusID = substr(TERM2GENE$LocusID, start = 1, stop = 16)
  TERM2NAME = gene_to_GO[gene_to_GO$Ontology == ontology, c('GOterm', 'GOdesc')]
  results <- clusterProfiler::enricher(gene = test, universe = universe, TERM2GENE = TERM2GENE, TERM2NAME = TERM2NAME)
  
  return(results)
}

results <- GOEnrichment(genes_of_interest = "A vector of your genes of interest",
                        universe = "A vector containing all genes in your data",
                        gene_to_GO = "The gene to GO conversion mapping provided below",
                        ontology = "Biological process (BP) / Molecular Function (MF) / Cellular Component (CC)")

