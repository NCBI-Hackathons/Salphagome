### This script takes a vector containing protein ids and returns a data frame containing
### the protein ids and the phage genome accession encoding that protein.

# The function uses the NCBI Entrez Utilities API. 


## Dependencies
library(rentrez)

## Read the prot. ids as data frame
ids <- read.csv("prot_ids", header = FALSE)

## Convert into vector
ids = ids[,1]


## Loop over protein ids

genome = c()

  
for(i in seq_along(ids)) {
  
  target = ids[i]
  
  # NCBI E-utilities
  foo = entrez_link(dbfrom='protein', id=target, db='all')
  
  # Link to Gene database
  faa = entrez_summary(db = "gene", id = foo$links$protein_gene)
  
  # From genomic info, extract the genome
  genome[i] = faa$genomicinfo[,2]
  
  }


## Build df containing columns: prot.ids, genome
typhi = data.frame(ids, genome) 

## Export to csv file
write.csv(typhi, file = "summary")
