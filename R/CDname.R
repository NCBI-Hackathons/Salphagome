### This function takes a protein id and returns a vector with the region name of the Conserved Protein Domain Family, if applicable.

# The function uses the NCBI Entrez Utilities API. 

## Dependencies
library(rentrez)


## Define function
get_CDDacc <- function(prot_acc) {
  
  # NCBI Eutils through rentrez pckg.
    protein <-  entrez_summary(db="protein", id= prot_acc)
    p_links = entrez_link(dbfrom='protein', id=protein$uid, db='cdd')
    cdd = p_links$links$protein_cdd_concise_2
    
  # initializes an empty vector
  acc = c()   
  
  # if CDD
    if(! is.null(cdd)) {
      region = entrez_summary(db="cdd", id= cdd)
      acc[i] = region$accession
    } else {acc[i] = 0}
      
  
    
  acc  

}


## Usage
# xps = c("YP_001949746.1", "YP_001949758", "YP_001949763", "YP_001949766", "YP_001949773", "YP_001949775", "YP_001949776", "YP_001949796", "YP_001949797", "YP_001949798", "YP_004306652", "YP_004306653", "YP_004306654", "YP_004306656", "YP_004306662", "YP_004306669", "YP_004306672", "YP_004306675", "YP_004306679", "YP_004306680", "YP_004306696")
# sapply(xp, get_CDDacc)
