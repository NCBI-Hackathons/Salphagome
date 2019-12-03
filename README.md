# Novel discovery of phages from *Salmonella* sequences: The case of typhoidal salmonellosis

## What does Salphagome do?

## How do I use it?

```salphagome.ipynb```

# Process Details:

## Process SAM files
We first process each of the SAM files generated from the alignment by counting the alignments for each phage in each of the Typhi and PTyphi samples. We counted the hits using the analyse.sh script. This script will simply take each SAM file and list all of the phages in the SAM file and returns how many hits/counts of each phage in that SAM file. This process can take a while.

This program then outputs a dataframe, which is a CSV file to be used for downstream analysis and then generate plots for the data.

This is done by running the following script for each sample(Typhi/PTyphi) result folder:

Example shown below:

<i>bash analyse.sh $RESULTS_DIR</i>

Where $RESULTS_DIR is the directory containing the results from the alignments i.e the SAM files created by magicblast

## Normalisation
So the approach that we used for an initial normalisation of the counts of each phage in a Tpyphi/PTyphi sample is to retrieve the SRA accession Id of the particular sample, and then query the Entrez database for the number of reads in that sequencing run. We then used this number as the denominator for the counts/hits per phage. This is new column is then the pre-normalized version of the hits that we have generated previously.

At this step, we normalise the data for each sample by using the combined output of the phage count and percentage coverage across the phage, based on the filtering procedure that we used to calculate the Phage abundance section of this pipeline, to come up with a normalised count.

## Create Figures
We then use the following notebook, which is available for creating figures:  

`salphagome.ipynb`

## Preliminary Results

### *Salmonella typhi* Enrichment Index
The following radar chart shows the *Salmonella* typhi Enrichment Index for 153 different Phages. Astonishingly, only 2 phages had a high index in S. typhi, Vi06 and phiSG-JL2.

<img src="./STEIP.png">

# Analysis

### What is unique about phages infecting *S. typhi*
To study why these 2 phages are highly successful in infecting S. typhi, not paratyphi, we performed further analysis using DELTA-BLAST. We found that [Vi06](https://www.ncbi.nlm.nih.gov/nuccore/NC_015271.1/) and [phiSG-JL2](https://www.ncbi.nlm.nih.gov/nuccore/NC_010807.1) only among all phages share 3 similar proteins.  
  * The first is a protein that is similar to the **dGTPase inhibitor** in *E. coli*. dGTPase is an important enzyme that plays a role in regulating the intracellular pool of dGTP and DNA repair mechanism. It hydrolyzes dGTP and is able to bind strongly to single-stranded DNA. Previous research suggested that mutation in dGTPase resulted in dramatic decrease in *S. typhi* survival in the ex vivo swine stomach content, which is an assay to test for the essential genes that are important for *S. typhi* survival in the harsh gastric environment.
  * The second protein has a certain similarity to a phage lambda **Rz1-like protein**. Rz1 is a component of the spanin complex that disrupts the host outer membrane and participates in cell lysis during virus exit.
  * The third one was a **hypothetical protein** with yet unknown function.


### References
[PMID: 16597989](https://www.ncbi.nlm.nih.gov/pubmed/?term=16597989)
