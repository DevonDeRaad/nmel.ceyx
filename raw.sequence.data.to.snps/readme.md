# Moving from raw Illumina reads to called SNPs

## Steps
- I used the scripts 'demultiplex.plate.1.sh' and 'demultiplex.plate.2.sh' to demultiplex the pooled reads into individual fastq files with the 'fq.gz' extension for each sample.

- I then used the script 'map.and.run.stacks.sh' to map each individual sample fastq file (available at NCBI [bioproject PRJNA1128088](http://www.ncbi.nlm.nih.gov/bioproject/1128088) against the publicly available *Ceyx cyanopectus* reference genome [available here](https://www.ncbi.nlm.nih.gov/datasets/genome/GCA_013401355.1/), and call SNPs using [Stacks](https://catchenlab.life.illinois.edu/stacks/).
- From there, I copied the output unfiltered vcf file containing 179,940 unfiltered SNPs (available [here](https://github.com/DevonDeRaad/nmel.ceyx/blob/main/data/populations.snps.vcf.gz)) to my local machine to work on in RStudio. The pipeline picks up from there with [SNP filtering](https://devonderaad.github.io/nmel.ceyx/ceyx.filtering.html).
