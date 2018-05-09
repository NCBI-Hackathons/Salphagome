### This script takes a vector containing protein ids and, if applicable, returns a vector 
### with the region name of the Conserved Protein Domain Family. 

# The function uses the NCBI Entrez Utilities API. 


get_CDDacc <- function(prot_vector) {
  
  acc = vector(mode = "character", length = length(seq(prot_vector)))
  
  for(i in seq(prot_vector)) {
    protein <-  entrez_summary(db="protein", id= prot_vector[i])
    p_links = entrez_link(dbfrom='protein', id=protein$uid, db='cdd')
    foo = p_links$links$protein_cdd_concise_2
    if(! is.null(foo)) {
      region = entrez_summary(db="cdd", id= foo)
      acc[i] = region$accession
    } else {acc[i] = 0}
      
  }
    
  acc  

}

get_CDDacc(xps)
