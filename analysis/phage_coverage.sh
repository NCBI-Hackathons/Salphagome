#!/bin/bash
## CONVERT SAM TO BAM FILES
#for i in *.sam; do samtools view -Sb $i > $i.bam; done
#for i in *.sam.bam; do samtools sort $i -o $i.sorted.bam; done
#for i in `ls *.bam`; do samtools index $i $i.bai; done
## GENERATE BEDGRAPHS FROM BAM FILES
#for i in *.bam; do bamCoverage --binSize 100 -b $i --outFileFormat bedgraph -o $i.bedgraph; done
# For an analysis of all the phages in sample sequence: 
echo "Here is the analysis of all phages in each sample:"
for f in `ls *.bedgraph`; do
echo ""
echo $f
echo "---"
awk -F"\t" 'NR>1{if ($4 < 3) {arrlow[$1]++} else {arrhi[$1]++}} END {for (a in arrlow) { if(length(arrlow[a]) == 0){arrlow[a] = 0} if(length(arrhi[a]) == 0){arrhi[a] = 0} print a, 100*(arrhi[a])/(arrlow[a] + arrhi[a]),"%" }}' $f; done
