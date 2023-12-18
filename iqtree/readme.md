# Running IQ-TREE

## This folder contains all files and code necessary to run IQ-TREE on this *Ceyx* RADseq dataset

- The file named [pops.phy](https://github.com/DevonDeRaad/nmel.ceyx/blob/main/iqtree/pops.phy) contains all 2580 loci passing filtering (concatenated) and all 107 samples passing filtering protocols. This can be used as input to IQ-TREE to generate a maximum-likelihood phylogeny.
- Automatic model selection and maximum-liklihood tree reconstruction (w/ 1000 UF bootstrap reps) were performed on the KUHPCC using the code found in the script named [run.iqtree.sh](https://github.com/DevonDeRaad/nmel.ceyx/blob/main/iqtree/run.iqtree.sh).
- The output consensus tree with bootstrap support values is found in the file named [pops.phy.contree](https://github.com/DevonDeRaad/nmel.ceyx/blob/main/iqtree/pops.phy.contree).
- A walk through of the steps from vcf to concensus tree is available for viewing via the document named [run.iqtree.html](https://devonderaad.github.io/nmel.ceyx/iqtree/run.iqtree.html).
