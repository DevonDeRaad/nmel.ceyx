# Northern Melanesian *Ceyx* RADseq investigation

[![DOI](https://zenodo.org/badge/724345112.svg)](https://zenodo.org/doi/10.5281/zenodo.12534730)

### This repository contains documentation of all resources used to analyze the phylogeographic patterns of Northern Melanesian *Ceyx* Kingfishers for the manuscript "Genomic patterns in the dwarf kingfishers of northern Melanesia reveal a mechanistic framework explaining the paradox of the great speciators", published in the journal Evolution Letters.

### Mapping
*    All details for creating maps shown in the manuscript can be found in the folder called [mapping](https://github.com/DevonDeRaad/nmel.ceyx/tree/main/mapping).
### Data availability
*   All input files necessary to recreate this study can be accessed via the folder named [data](https://github.com/DevonDeRaad/nmel.ceyx/tree/main/data).

### Quality filtering raw, unfiltered SNPs
*   The entire SNP filtering process, facilitated by the R packages [vcfR](https://doi.org/10.1111/1755-0998.12549) and [SNPfiltR](https://doi.org/10.1111/1755-0998.13618) is available to view here:
    > <https://devonderaad.github.io/nmel.ceyx/ceyx.filtering.html>

### Constructing an unrooted, distance-based phylogenetic network
*   The process can be viewed from this link:
    > <https://devonderaad.github.io/nmel.ceyx/splitstree.fst.html>

### Constructing a maximum-likelihood phylogeny from all samples
*   All input and output files plus code can be found in the folder named [iqtree](https://github.com/DevonDeRaad/nmel.ceyx/tree/main/iqtree).

### Running *ADMIXTURE* on this dataset
*   All input and output files plus code can be found in the folder named [admixture](https://github.com/DevonDeRaad/nmel.ceyx/tree/main/admixture).

### Reconstructing the species tree and assessing diversification
*   All input and output files plus code for making a species tree can be found in the folder named [SNAPP](https://github.com/DevonDeRaad/nmel.ceyx/tree/main/snapp).
*   A detailed walk-through of the process can be viewed [here](https://devonderaad.github.io/nmel.ceyx/snapp/execute.snapp.html).
*   The process of constructing a log-lineage through time (LTT) plot based on the maximum clade credibility tree, and simulating the null distribution of LTT plots based on a pure-birth model can be viewed [here](https://devonderaad.github.io/nmel.ceyx/snapp/LTT.plots.html).
*   During the peer review process, reviewers raised concerns that the early burst pattern we recovered could be a product of idiosyncracies in the MCMC approach. To investigate this possibility, we repeated the entire procedure (generating the SNAPP tree and assessing the resulting emirpical LTT plot against simulations) 9 times using 3 different downsampling schemes, each repeated three times. All of these trees consistently converged and generated the same pattern, giving us confidence in the robustness of this key result. Please view this whole investigation here: [https://devonderaad.github.io/nmel.ceyx/snapp/verify.snapp.results/verify.snapp.results.html](https://devonderaad.github.io/nmel.ceyx/snapp/verify.snapp.results/verify.snapp.results.html).

### Testing for gene flow
*    All input and output files from running the program [Dsuite](https://github.com/millanek/Dsuite) can be found in the folder called [dsuite](https://github.com/DevonDeRaad/nmel.ceyx/tree/main/dsuite).
*    A detailed walk-through of the entire process including all code can be viewed [here](https://devonderaad.github.io/nmel.ceyx/dsuite/run.dsuite.html).

### Calculating pariwise FST between lineages
*   The process can be viewed from this link:
    > <https://devonderaad.github.io/nmel.ceyx/splitstree.fst.html>

### Calculating genetic diversity
*   The process can be viewed from this link:
    > <https://devonderaad.github.io/nmel.ceyx/gen.div/assess.gen.div.html>

