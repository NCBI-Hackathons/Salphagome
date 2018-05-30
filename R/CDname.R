### This function takes a protein id and returns a vector with the region name of the Conserved Protein Domain Family, if applicable.

# The function uses the NCBI Entrez Utilities API. 

## Dependencies
library(rentrez)


## Define function
get_CDD = function(xp) {
  
  # NCBI Eutils through rentrez pckg.
  protein <-  entrez_summary(db="protein", id= xp)
  p_links = entrez_link(dbfrom='protein', id=protein$uid, db='cdd')
  cdd = p_links$links$protein_cdd_concise_2
  
  
  # initializes an empty vector
  acc = c()
  
  # if CDD
  if(! is.null(cdd)) {
    for(i in seq_along(cdd)) {
      region = entrez_summary(db="cdd", id= cdd[i])
      acc = c(acc, region$accession)
    }

  } else {acc = 0}
  
  acc
  
}

## Usage
#xp = c("XP_012572936", "XP_012572937", "YP_001949758")
#for(x in xp) {print(lapply(x, get_CDD))}
